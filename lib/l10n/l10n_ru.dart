import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Бункер';

  @override
  String get newGame => 'Новая игра';

  @override
  String get history => 'История';

  @override
  String get rules => 'Правила';

  @override
  String get volume => 'Громкость';

  @override
  String get music => 'Музыка';

  @override
  String get dubbing => 'Озвучка';

  @override
  String get effects => 'Эффекты';

  @override
  String get language => 'Язык';

  @override
  String get settings => 'Настройки';

  @override
  String get game_settings => 'Настройки игры';

  @override
  String get exitGameTitle => 'Выход из игры';

  @override
  String get exitGameMessage => 'Вы уверены, что хотите выйти из игры?';

  @override
  String get cancel => 'Отмена';

  @override
  String get exit => 'Выйти';

  @override
  String get gameTone => 'Тон игры';

  @override
  String get familyFriendly => 'Семейный';

  @override
  String get plotWishes => 'Введите пожелания по сюжету';

  @override
  String get voting => 'Голосование';

  @override
  String playerVoting(Object playerName) {
    return 'Голосует игрок $playerName';
  }

  @override
  String get round => 'РАУНД';

  @override
  String get survivors => 'Выжившие:';

  @override
  String get eliminated => 'Выбывшие:';

  @override
  String get howManyToKick => 'Сколько человек кикнуть';

  @override
  String get disasterDescription => 'Описание катастрофы';

  @override
  String get shelter => 'Бункер';

  @override
  String get information => 'Информация';

  @override
  String get difficulty => 'Сложность';

  @override
  String get difficultyClassic => 'Классика';

  @override
  String get difficultyHardcore => 'Хардкор';

  @override
  String get difficultyInsanity => 'Безумие';

  @override
  String count(Object count) {
    return 'Количество: $count';
  }

  @override
  String get startGame => 'Начать игру';

  @override
  String get pause => 'Пауза';

  @override
  String get lore => 'История';

  @override
  String get loading => 'Загрузка...';

  @override
  String get goBack => 'Вернуться';

  @override
  String get rulesTitle => 'Правила игры';

  @override
  String get gameTitle => 'Игра \"Бункер\"';

  @override
  String get gameDescription => 'Популярная социально-стратегическая игра, в которой участники должны убедить остальных, что именно они достойны места в бункере после глобальной катастрофы.';

  @override
  String get disasterScenario => 'Сценарий катастрофы';

  @override
  String get disasterScenarioDesc => 'В начале игры объявляется тип апокалипсиса (ядерная война, пандемия, падение астероида и т.д.), что влияет на стратегию выживания.';

  @override
  String get characterRoles => 'Раздача ролей и характеристик';

  @override
  String get characterRolesDesc => 'Каждый игрок получает случайные параметры:';

  @override
  String get profession => 'Профессия (врач, инженер, военный, учитель и т.д.)';

  @override
  String get age => 'Возраст (может влиять на физические возможности)';

  @override
  String get health => 'Здоровье (хронические болезни, инвалидность, отличная форма)';

  @override
  String get hobbies => 'Хобби/навыки (может быть полезным или бесполезным в бункере)';

  @override
  String get phobias => 'Фобии (страхи, которые могут помешать выживанию)';

  @override
  String get luggage => 'Багаж (предмет, который игрок взял с собой, например, оружие, аптечка, книги)';

  @override
  String get additionalInfo => 'Дополнительная информация (например, беременность, криминальное прошлое)';

  @override
  String get discussionDebate => 'Обсуждение и дебаты';

  @override
  String get discussionDebateDesc => 'Процесс принятия решений:';

  @override
  String get discussionDebatePoint1 => 'Игроки по очереди рассказывают о себе и доказывают, почему их нужно оставить в бункере';

  @override
  String get discussionDebatePoint2 => 'Можно задавать друг другу вопросы, выявлять слабые стороны';

  @override
  String get votingTitle => 'Голосование';

  @override
  String get votingDesc => 'Выбор выживших:';

  @override
  String get votingPoint1 => 'После обсуждения участники голосуют, кого выгнать из бункера';

  @override
  String get votingPoint2 => 'В некоторых версиях можно голосовать за нескольких игроков';

  @override
  String get votingPoint3 => 'Процесс повторяется, пока не останется нужное количество выживших';
}
