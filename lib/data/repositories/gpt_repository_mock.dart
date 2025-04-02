import 'dart:math';

import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

class GptRepositoryMock implements GptRepository {
  final Random _random = Random();

  @override
  Future<Map<String, Object>> createGame(GameSettings settings) async {
    Disaster disaster = await getDisaster(settings);
    List<Player> players = await getPlayers(settings);
    return {'disaster': disaster, 'player_list': players};
  }

  Future<Disaster> getDisaster(GameSettings settings) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // List of random disasters
    final disasters = [
      const Disaster(
        name: "Ядерная война",
        disasterDescription:
            "Мир погрузился в хаос после ядерной войны. Радиация и разрушения повсюду.",
        disasterShortDescription: "Ядерная война уничтожила цивилизацию",
        shelterName: "Противоатомный бункер",
        location: "Глубоко под землей",
        description:
            "Противоатомное убежище с запасами на 1 год и системой фильтрации воздуха.",
        capacity: 5,
        rooms: [
          "Жилой отсек",
          "Склад",
          "Медицинский отсек",
          "Комната отдыха",
          "Технический блок"
        ],
        resources: ["Еда", "Вода", "Медикаменты", "Инструменты", "Генератор"],
      ),
      const Disaster(
        name: "Пандемия",
        disasterDescription:
            "Смертельный вирус уничтожил большую часть населения Земли.",
        disasterShortDescription: "Глобальная пандемия смертельного вируса",
        shelterName: "Медицинский бункер",
        location: "Под заброшенной больницей",
        description: "Медицинский бункер с лабораторией и карантинными зонами.",
        capacity: 6,
        rooms: [
          "Лаборатория",
          "Карантинная зона",
          "Жилой отсек",
          "Склад медикаментов",
          "Столовая"
        ],
        resources: [
          "Вакцины",
          "Антибиотики",
          "Защитные костюмы",
          "Еда",
          "Вода"
        ],
      ),
      const Disaster(
        name: "Климатическая катастрофа",
        disasterDescription:
            "Глобальное потепление привело к катастрофическим изменениям климата.",
        disasterShortDescription: "Глобальная климатическая катастрофа",
        shelterName: "Экокомплекс",
        location: "В горах",
        description:
            "Подземный экокомплекс с гидропонной фермой и системой терморегуляции.",
        capacity: 7,
        rooms: [
          "Гидропонная ферма",
          "Солнечная электростанция",
          "Жилые помещения",
          "Лаборатория",
          "Водоочистная"
        ],
        resources: [
          "Семена",
          "Солнечные батареи",
          "Системы фильтрации",
          "Инструменты",
          "Запасы еды"
        ],
      ),
      const Disaster(
        name: "Восстание ИИ",
        disasterDescription:
            "Искусственный интеллект вышел из-под контроля и начал уничтожать человечество.",
        disasterShortDescription: "Машины восстали против людей",
        shelterName: "Аналоговый бункер",
        location: "В отдаленной местности",
        description:
            "Бункер без электронных систем, защищенный от любого внешнего доступа.",
        capacity: 4,
        rooms: [
          "Механическая мастерская",
          "Архив знаний",
          "Жилой отсек",
          "Хранилище энергии"
        ],
        resources: [
          "Механические инструменты",
          "Книги",
          "Ручные генераторы",
          "Консервы"
        ],
      ),
      const Disaster(
        name: "Вторжение пришельцев",
        disasterDescription:
            "Инопланетная цивилизация атаковала Землю и захватила большую часть планеты.",
        disasterShortDescription: "Земля захвачена инопланетянами",
        shelterName: "Военный бункер",
        location: "Под бывшей военной базой",
        description:
            "Военный бункер с экспериментальными системами защиты от внеземных угроз.",
        capacity: 5,
        rooms: [
          "Оружейная",
          "Командный центр",
          "Спальные отсеки",
          "Медицинский отсек",
          "Склад"
        ],
        resources: [
          "Экспериментальное оружие",
          "Системы маскировки",
          "Боеприпасы",
          "Провизия",
          "Медикаменты"
        ],
      ),
    ];

    // Return a random disaster
    return disasters[_random.nextInt(disasters.length)];
  }

  Future<List<Player>> getPlayers(GameSettings settings) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1200));

    // Define possible traits for randomization
    final List<String> professions = [
      "Врач",
      "Инженер",
      "Ученый",
      "Строитель",
      "Фермер",
      "Солдат",
      "Учитель",
      "Программист",
      "Художник",
      "Повар"
    ];

    final List<String> hobbies = [
      "Рисование",
      "Музыка",
      "Чтение",
      "Спорт",
      "Садоводство",
      "Шахматы",
      "Коллекционирование",
      "Охота",
      "Рыбалка",
      "Кулинария"
    ];

    final List<String> phobias = [
      "Клаустрофобия",
      "Акрофобия",
      "Арахнофобия",
      "Социофобия",
      "Никтофобия",
      "Гермофобия",
      "Танатофобия",
      "Агорафобия",
      "Гемофобия",
      "Трипофобия"
    ];

    final List<String> luggageOptions = [
      "Аптечка",
      "Оружие",
      "Запас еды",
      "Инструменты",
      "Книги",
      "Фотографии близких",
      "Рация",
      "Компас",
      "Спальный мешок",
      "Нож"
    ];

    // Generate random players
    List<Player> players = [];
    int playerCount = settings.playersCount;

    for (int i = 0; i < playerCount; i++) {
      String profession = professions[_random.nextInt(professions.length)];
      String hobby = hobbies[_random.nextInt(hobbies.length)];
      String phobia = phobias[_random.nextInt(phobias.length)];
      String luggage = luggageOptions[_random.nextInt(luggageOptions.length)];

      String bio =
          "Персонаж возрастом ${20 + _random.nextInt(50)} лет, профессия: $profession.";
      String extra =
          _random.nextBool() ? "Имеет скрытые мотивы" : "Нет особенностей";

      players.add(Player(
        name: "Игрок ${i + 1}",
        profession: profession,
        bio: bio,
        health: "${50 + _random.nextInt(51)}%",
        // Health between 50% and 100%
        hobby: hobby,
        phobia: phobia,
        luggage: luggage,
        extra: extra,
        lifeStatus: LifeStatus.alive,
        knownProperties: List.generate(6, (_) => false),
        // Initially all properties unknown
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
