import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/presentation/ui_items/player_tap_card.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('PlayerTapCard - различные статусы', () {
    final playerAlive = Player(
      id: 10,
      name: 'Сергей Живой',
      profession: 'Инженер',
      bio: 'Выживший',
      health: 'Здоров',
      hobby: 'Шахматы',
      phobia: 'Агорафобия',
      luggage: 'Инструменты',
      extra: 'Разбирается в электронике',
      lifeStatus: LifeStatus.alive,
      knownProperties: List.filled(6, false),
      notes: [],
    );

    final playerLast = Player(
      id: 11,
      name: 'Мария Последняя',
      profession: 'Учитель',
      bio: 'Последний выживший',
      health: 'Аллергия',
      hobby: 'Рисование',
      phobia: 'Арахнофобия',
      luggage: 'Книги',
      extra: 'Знает 3 иностранных языка',
      lifeStatus: LifeStatus.last,
      knownProperties: List.filled(6, false),
      notes: [],
    );

    final playerKilled = Player(
      id: 12,
      name: 'Петр Убитый',
      profession: 'Военный',
      bio: 'Не выживший',
      health: 'Ранение',
      hobby: 'Стрельба',
      phobia: 'Гемофобия',
      luggage: 'Аптечка',
      extra: 'Умеет выживать в дикой природе',
      lifeStatus: LifeStatus.killed,
      knownProperties: List.filled(6, false),
      notes: [],
    );

    testGoldens('PlayerTapCard с разными статусами жизни', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 180,
                  height: 300,
                  child: PlayerTapCard(player: playerAlive),
                ),
                SizedBox(
                  width: 180,
                  height: 300,
                  child: PlayerTapCard(player: playerLast),
                ),
                SizedBox(
                  width: 180,
                  height: 300,
                  child: PlayerTapCard(player: playerKilled),
                ),
              ],
            ),
          ),
        ),
      );
      
      await screenMatchesGolden(tester, 'player_tap_card_life_statuses');
    });

    testGoldens('PlayerTapCard с длинными текстами', (tester) async {
      // Создаем игрока с очень длинными именем и профессией
      final playerLongText = Player(
        id: 999,
        name: 'Очень Длинное Имя Которое Не Влезает В Одну Строку',
        profession: 'Специалист По Длинным Названиям Профессий',
        bio: 'Био',
        health: 'Здоров',
        hobby: 'Хобби',
        phobia: 'Фобия',
        luggage: 'Багаж',
        extra: 'Экстра',
        lifeStatus: LifeStatus.alive,
        knownProperties: List.filled(6, false),
        notes: [],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 200,
                height: 300,
                child: PlayerTapCard(player: playerLongText),
              ),
            ),
          ),
        ),
      );

      await screenMatchesGolden(tester, 'player_tap_card_long_text');
    });
  });
} 