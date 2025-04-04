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
  String get time => 'Время';

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
  String get abilitiesToOpen => 'Способностей открыть';

  @override
  String get wishes => 'Пожелания';

  @override
  String get roundNumber => 'Номер раунда';

  @override
  String get roundInfo => 'Информация о раунде';

  @override
  String get survivors => 'Выжившие:';

  @override
  String get pressToSeeCard => 'Нажмите, чтобы увидеть карту игрока';

  @override
  String get eliminated => 'Выбывшие:';

  @override
  String get players => 'Игроки';

  @override
  String get finale => 'ФИНАЛ';

  @override
  String get allPlayers => 'Все игроки';

  @override
  String get timeLabel => 'Время';

  @override
  String get playerList => 'СПИСОК ИГРОКОВ';

  @override
  String get returnWord => 'Вернуться';

  @override
  String get dataLoadingError => 'Ошибка загрузки данных';

  @override
  String get inBunker => 'В бункер попали:';

  @override
  String get notInBunker => 'Не попали:';

  @override
  String get finish => 'Завершить';

  @override
  String get howManyToKick => 'Человек выгнать:';

  @override
  String get kickedPlayers => 'Выгнанные игроки';

  @override
  String get unKnown => 'Неизвестно';

  @override
  String get characteristicsToOpen => 'Требуется открыть характеристик:';

  @override
  String get disasterDescription => 'Описание катастрофы';

  @override
  String get humans => 'человек';

  @override
  String get shelter => 'Бункер';

  @override
  String get shelterDescription => 'Описание бункера';

  @override
  String get discussionTime => 'Время на обсуждение';

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
  String get difficulty => 'Сложность';

  @override
  String get difficultyClassic => 'Классика';

  @override
  String get difficultyHardcore => 'Хардкор';

  @override
  String get difficultyInsanity => 'Безумие';

  @override
  String get familyModeText => 'Семейный режим';

  @override
  String count(Object count) {
    return 'Количество: $count';
  }

  @override
  String get vkl => 'вкл';

  @override
  String get vikl => 'выкл';

  @override
  String difficultyLevel(Object level) {
    return 'Сложность: $level';
  }

  @override
  String familyMode(Object familyMode) {
    return 'Семейный режим: $familyMode';
  }

  @override
  String timerSettings(Object timer) {
    return 'Таймер: $timer';
  }

  @override
  String get countPlayers => 'Количество игроков';

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
  String get gameDescription =>
      'Популярная социально-стратегическая игра, в которой участники должны убедить остальных, что именно они достойны места в бункере после глобальной катастрофы.';

  @override
  String get disasterScenario => 'Сценарий катастрофы';

  @override
  String get disasterScenarioDesc =>
      'В начале игры объявляется тип апокалипсиса (ядерная война, пандемия, падение астероида и т.д.), что влияет на стратегию выживания.';

  @override
  String get characterRoles => 'Раздача ролей и характеристик';

  @override
  String get characterRolesDesc => 'Каждый игрок получает случайные параметры:';

  @override
  String get profession => 'Профессия (врач, инженер, военный, учитель и т.д.)';

  @override
  String get age => 'Возраст';

  @override
  String get ageRule => 'Возраст (может влиять на физические возможности)';

  @override
  String get health => 'Здоровье';

  @override
  String get healthRule =>
      'Здоровье (хронические болезни, инвалидность, отличная форма)';

  @override
  String get hobbies => 'Хобби/навыки';

  @override
  String get hobbiesRule =>
      'Хобби/навыки (может быть полезным или бесполезным в бункере)';

  @override
  String get phobias => 'Фобии';

  @override
  String get phobiasRule => 'Фобии (страхи, которые могут помешать выживанию)';

  @override
  String get luggage => 'Багаж';

  @override
  String get luggageRule =>
      'Багаж (предмет, который игрок взял с собой, например, оружие, аптечка, книги)';

  @override
  String get additionalInfo => 'Дополнительная информация';

  @override
  String get additionalInfoRule =>
      'Дополнительная информация (например, беременность, криминальное прошлое)';

  @override
  String get discussionDebate => 'Обсуждение и дебаты';

  @override
  String get discussionDebateDesc => 'Процесс принятия решений:';

  @override
  String get discussionDebatePoint1 =>
      'Игроки по очереди рассказывают о себе и доказывают, почему их нужно оставить в бункере';

  @override
  String get discussionDebatePoint2 =>
      'Можно задавать друг другу вопросы, выявлять слабые стороны';

  @override
  String get votingTitle => 'Голосование';

  @override
  String get votingDesc => 'Выбор выживших:';

  @override
  String get votingPoint1 =>
      'После обсуждения участники голосуют, кого выгнать из бункера';

  @override
  String get votingPoint2 =>
      'В некоторых версиях можно голосовать за нескольких игроков';

  @override
  String get votingPoint3 =>
      'Процесс повторяется, пока не останется нужное количество выживших';

  @override
  String get kickedOutPlayers => 'Выгнанные игроки';

  @override
  String get noKickedOutPlayers => 'Нет выгнанных игроков';

  @override
  String get cnt => 'Продолжить';

  @override
  String get family => 'Семейный';

  @override
  String get requiredToOpenProperties => 'Требуется открыть характеристик';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get hobbyAndSkills => 'Хобби/Навыки';

  @override
  String get difficultySettings => 'Сложность';

  @override
  String get soonHistory => 'Скоро здесь будет история игр';

  @override
  String get playerInfo => 'ОБ ИГРОКЕ';
}
