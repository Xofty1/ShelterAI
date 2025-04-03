// ignore: unused_import
import 'package:intl/intl.dart' as intl;
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
  String get roundNumber => 'Номер раунда';

  @override
  String get rules => 'Правила';

  @override
  String get volume => 'Громкость';

  @override
  String get playerList => 'СПИСОК ИГРОКОВ';

  @override
  String get abilitiesToOpen => 'Способностей открыть';

  @override
  String get music => 'Музыка';

  @override
  String get dubbing => 'Озвучка';

  @override
  String get effects => 'Эффекты';

  @override
  String get returnWord => 'Вернуться';

  @override
  String get language => 'Язык';

  @override
  String get settings => 'Настройки';

  @override
  String get game_settings => 'Настройки игры';

  @override
  String get exitGameTitle => 'Выход из игры';

  @override
  String get playerAmount => 'Количество игроков';

  @override
  String get continueWord => 'Продолжить';

  @override
  String get exitGameMessage => 'Вы уверены, что хотите выйти из игры?';

  @override
  String get cancel => 'Отмена';

  @override
  String get exit => 'Выйти';

  @override
  String get close => 'Закрыть';

  @override
  String get gameTone => 'Тон игры';

  @override
  String get random => 'Рандом';

  @override
  String get difficultySetting => 'Сложность';

  @override
  String get familyFriendly => 'Семейный';

  @override
  String get timer => 'Таймер';

  @override
  String get wishes => 'Пожелания';

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
  String get pressToSeeCard => 'Нажмите, чтобы увидеть карту игрока';

  @override
  String get eliminated => 'Выбывшие:';

  @override
  String get finale => 'ФИНАЛ';

  @override
  String get inBunker => 'В бункер попали:';

  @override
  String get notInBunker => 'Не попали:';

  @override
  String get howManyToKick => 'Человек выгнать:';

  @override
  String get players => 'Игроки';

  @override
  String get allPlayers => 'Все игроки';

  @override
  String get unKnown => 'Неизвестно';

  @override
  String get kickedPlayers => 'Выгнанные игроки';

  @override
  String get dataLoadingError => 'Ошибка загрузки данных';

  @override
  String get characteristicsToOpen => 'Требуется открыть характеристик:';

  @override
  String get disasterDescription => 'Описание катастрофы';

  @override
  String get shelter => 'Бункер';

  @override
  String get finish => 'Завершить';

  @override
  String get humans => 'человек';

  @override
  String get discussionTime => 'Время на обсуждение';

  @override
  String get shelterDescription => 'Описание бункера';

  @override
  String get capacity => 'Вместимость';

  @override
  String get confirmVote => 'Подтвердить голос';

  @override
  String get rooms => 'Помещения';

  @override
  String get discussion => 'Обсуждение';

  @override
  String get resources => 'Ресурсы';

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
  String get familyModeText => 'Семейный режим';

  @override
  String familyMode(Object familyMode) {
    return 'Семейный режим: $familyMode';
  }

  @override
  String get time => 'Время';

  @override
  String timerSettings(Object timer) {
    return 'Таймер: $timer';
  }

  @override
  String get startGame => 'Начать игру';

  @override
  String get pause => 'Пауза';

  @override
  String get lore => 'История';

  @override
  String get vkl => 'вкл';

  @override
  String get vikl => 'выкл';

  @override
  String get loading => 'Загрузка...';

  @override
  String get age => 'Возраст';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get health => 'Здоровье';

  @override
  String get hobbyAndSkills => 'Хобби/Навыки';

  @override
  String get phobias => 'Фобии';

  @override
  String get luggage => 'Багаж';

  @override
  String get roundInfo => 'Информация о райнде';

  @override
  String get additionalInfo => 'Дополнительная информация';

  @override
  String get playerInfo => 'ИНФОРМАЦИЯ ОБ ИГРОКЕ';
}
