import 'dart:convert';
import 'dart:math';
import 'dart:io';

import 'package:shelter_ai/data/entities/json_preset.dart';
import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';
import 'package:shelter_ai/data/entities/json_offline.dart';

import '../entities/json_story.dart';

class GptRepositoryMock implements GptRepository {
  final Random _random = Random();

  @override
  Future<Disaster> createGame(GameSettings settings) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    print('mock');

    final file = File('assets/offline/games.txt');

    late String fileContent;

    fileContent = await file.readAsString();

    print('file_read');

    final currentStory = DataReader.fromJson(jsonDecode(fileContent));

    print('currentStory got');

    late Story story;

    switch ([settings.language, settings.safeMode]) {
      case ['ru', false]:
        story = currentStory.ru.no[_random.nextInt(2)];
        break;
      case ['ru', true]:
        story = currentStory.ru.yes[_random.nextInt(2)];
        break;
      case ['en', false]:
        story = currentStory.en.no[_random.nextInt(2)];
        break;
      case ['en', true]:
        story = currentStory.en.yes[_random.nextInt(2)];
        break;
      default:
        throw Error();
    }

    var disasterDesc = StringBuffer();
    disasterDesc.writeAll([
      story.disaster.history,
      '\n',
      story.disaster.distribution,
      '\n',
      story.disaster.worldSituation
    ]);

    // List of random disasters
    final disaster = Disaster(
        name: story.disaster.name,
        disasterDescription: disasterDesc.toString(),
        disasterShortDescription: story.shortDescription,
        shelterName: story.bunker.name,
        location: story.bunker.location,
        description: story.bunker.capacity,
        capacity: (settings.playersCount / 2 - 0.1).round(),
        rooms: story.bunker.rooms,
        resources: story.bunker.resources,
        answer: 'Offline mode',
      );
    // Return a random disaster
    return disaster;
  }

  @override
  Future<List<Player>> createPlayers(GameSettings settings, Disaster disaster) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1200));

    print('mock');

    final file = File('assets/offline/players.txt');

    print('file');

    final fileContent = await file.readAsString();

    final characteristics = Preset.fromJson(jsonDecode(fileContent));

    print('decoded');

    late Characteristics workSpace;

    print(settings.language);
    switch (settings.language){
      case 'ru':
        workSpace = characteristics.ru;
        break;
      case 'en':
        workSpace = characteristics.en;
        break;
      default:
        throw Error();
    }

    print('got');

    // Generate random players
    List<Player> players = [];

    for (int i = 0; i < settings.playersCount; i++) {
      players.add(Player(
        id: i+1,
        name: "Игрок ${i + 1}",
        profession: workSpace.profession[_random.nextInt(40)],
        bio: workSpace.age[_random.nextInt(40)],
        health: workSpace.health[_random.nextInt(40)],
        hobby: workSpace.hobbySkills[_random.nextInt(40)],
        phobia: workSpace.phobias[_random.nextInt(40)],
        luggage: workSpace.baggage[_random.nextInt(40)],
        extra: workSpace.additionalInformation[_random.nextInt(40)],
        lifeStatus: LifeStatus.alive,
        knownProperties: List.generate(6, (_) => false),
        notes: [], // No notes initially
      ));
    }

    return players;
  }

  @override
  Future<String> getFinale(GameSettings settings, Disaster disaster, List<Player> alivePlayers, List<Player> kickedPlayers) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1000));

    // Generate a random finale based on the disaster and players
    String disasterImpact = "После катастрофы '${disaster.name}', ";
    String aliveSummary = alivePlayers.isNotEmpty
        ? "выжившие (${alivePlayers.map((p) => p.name).join(", ")}) смогли адаптироваться благодаря их навыкам, таким как ${alivePlayers.first.profession}."
        : "никто не выжил.";
    String kickedSummary = kickedPlayers.isNotEmpty
        ? "Однако, ${kickedPlayers.map((p) => p.name).join(", ")} не смогли справиться с трудностями."
        : "Все участники справились с испытаниями.";

    String finale = "$disasterImpact $aliveSummary $kickedSummary";
    return finale;
  }
}
