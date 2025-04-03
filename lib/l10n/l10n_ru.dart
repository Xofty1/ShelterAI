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
  String difficulty(Object level) {
    return 'Сложность: $level';
  }

  @override
  String get startGame => 'Начать игру';

  @override
  String get pause => 'Пауза';

  @override
  String get lore => 'История';

  @override
  String get loading => 'Загрузка...';
}
