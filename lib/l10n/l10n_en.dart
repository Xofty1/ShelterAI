import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Shelter';

  @override
  String get newGame => 'New Game';

  @override
  String get history => 'History';

  @override
  String get rules => 'Rules';

  @override
  String get volume => 'Volume';

  @override
  String get music => 'Music';

  @override
  String get dubbing => 'Dubbing';

  @override
  String get effects => 'Effects';

  @override
  String get language => 'Language';

  @override
  String get settings => 'Settings';

  @override
  String get game_settings => 'Game Settings';

  @override
  String get exitGameTitle => 'Exit Game';

  @override
  String get exitGameMessage => 'Are you sure you want to exit the game?';

  @override
  String get cancel => 'Cancel';

  @override
  String get exit => 'Exit';

  @override
  String get gameTone => 'Game Tone';

  @override
  String get familyFriendly => 'Family Friendly';

  @override
  String get plotWishes => 'Enter plot wishes';

  @override
  String get voting => 'Voting';

  @override
  String playerVoting(Object playerName) {
    return 'Player $playerName is voting';
  }

  @override
  String get round => 'ROUND';

  @override
  String get survivors => 'Survivors:';

  @override
  String get eliminated => 'Eliminated:';

  @override
  String get howManyToKick => 'How many people to kick';

  @override
  String get disasterDescription => 'Disaster Description';

  @override
  String get shelter => 'Shelter';

  @override
  String get information => 'Information';

  @override
  String get difficultyClassic => 'Classic';

  @override
  String get difficultyHardcore => 'Hardcore';

  @override
  String get difficultyInsanity => 'Insanity';

  @override
  String count(Object count) {
    return 'Count: $count';
  }

  @override
  String difficulty(Object level) {
    return 'Difficulty: $level';
  }

  @override
  String get startGame => 'Start Game';

  @override
  String get pause => 'Pause';

  @override
  String get lore => 'Lore';

  @override
  String get loading => 'Loading...';
}
