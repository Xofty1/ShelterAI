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
  String get playerAmount => 'Player amount';

  @override
  String get continueWord => 'Continue';

  @override
  String get exitGameMessage => 'Are you sure you want to exit the game?';

  @override
  String get cancel => 'Cancel';

  @override
  String get exit => 'Exit';

  @override
  String get close => 'Close';

  @override
  String get gameTone => 'Game Tone';

  @override
  String get random => 'Random';

  @override
  String get difficultySetting => 'Difficulty';

  @override
  String get familyFriendly => 'Family Friendly';

  @override
  String get timer => 'Timer';

  @override
  String get time => 'Time';

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
  String get abilitiesToOpen => 'Abilities to open';

  @override
  String get wishes => 'Wishes';

  @override
  String get roundNumber => 'Round number';

  @override
  String get roundInfo => 'Round information';

  @override
  String get survivors => 'Survivors:';

  @override
  String get pressToSeeCard => 'Press to see player card';

  @override
  String get eliminated => 'Eliminated:';

  @override
  String get players => 'Players';

  @override
  String get finale => 'FINAL';

  @override
  String get allPlayers => 'All players';

  @override
  String get timeLabel => 'Time';

  @override
  String get playerList => 'PLAYER LIST';

  @override
  String get returnWord => 'Return';

  @override
  String get dataLoadingError => 'Data loading error';

  @override
  String get inBunker => 'Players in shelter';

  @override
  String get notInBunker => 'Players outside';

  @override
  String get finish => 'Finish';

  @override
  String get howManyToKick => 'Players to be kicked out:';

  @override
  String get kickedPlayers => 'Kicked players';

  @override
  String get unKnown => 'Unknown';

  @override
  String get characteristicsToOpen => 'Characteristics to be opened:';

  @override
  String get disasterDescription => 'Disaster Description';

  @override
  String get humans => 'people';

  @override
  String get shelter => 'Shelter';

  @override
  String get shelterDescription => 'Shelter description';

  @override
  String get discussionTime => 'Discussion time';

  @override
  String get capacity => 'Shelter capacity';

  @override
  String get confirmVote => 'Confirm vote';

  @override
  String get rooms => 'Rooms';

  @override
  String get discussion => 'Discussion';

  @override
  String get resources => 'Resources';

  @override
  String get information => 'Information';

  @override
  String get difficulty => 'Difficulty';

  @override
  String get difficultyClassic => 'Classic';

  @override
  String get difficultyHardcore => 'Hardcore';

  @override
  String get difficultyInsanity => 'Insanity';

  @override
  String get familyModeText => 'Family mode';

  @override
  String count(Object count) {
    return 'Count: $count';
  }

  @override
  String get vkl => 'on';

  @override
  String get vikl => 'off';

  @override
  String difficultyLevel(Object level) {
    return 'Difficulty: $level';
  }

  @override
  String familyMode(Object familyMode) {
    return 'Family mode: $familyMode';
  }

  @override
  String timerSettings(Object timer) {
    return 'Timer: $timer';
  }

  @override
  String get countPlayers => 'Number of players';

  @override
  String get startGame => 'Start Game';

  @override
  String get pause => 'Pause';

  @override
  String get lore => 'Lore';

  @override
  String get loading => 'Loading...';

  @override
  String get goBack => 'Go Back';

  @override
  String get rulesTitle => 'Game Rules';

  @override
  String get gameTitle => 'Bunker Game';

  @override
  String get gameDescription => 'A popular social strategy game where participants must convince others that they deserve a place in the bunker after a global catastrophe.';

  @override
  String get disasterScenario => 'Disaster Scenario';

  @override
  String get disasterScenarioDesc => 'At the beginning of the game, the type of apocalypse is announced (nuclear war, pandemic, asteroid impact, etc.), which affects the survival strategy.';

  @override
  String get characterRoles => 'Role and Characteristic Distribution';

  @override
  String get characterRolesDesc => 'Each player receives random parameters:';

  @override
  String get profession => 'Profession (doctor, engineer, military, teacher, etc.)';

  @override
  String get age => 'Age (may affect physical abilities)';

  @override
  String get health => 'Health (chronic diseases, disability, excellent condition)';

  @override
  String get hobbies => 'Hobbies/skills (can be useful or useless in a bunker)';

  @override
  String get phobias => 'Phobias (fears that may interfere with survival)';

  @override
  String get luggage => 'Luggage (an item that the player took with them, such as weapons, first aid kit, books)';

  @override
  String get additionalInfo => 'Additional information (e.g., pregnancy, criminal past)';

  @override
  String get discussionDebate => 'Discussion and Debate';

  @override
  String get discussionDebateDesc => 'Decision-making process:';

  @override
  String get discussionDebatePoint1 => 'Players take turns talking about themselves and proving why they should be left in the bunker';

  @override
  String get discussionDebatePoint2 => 'You can ask each other questions and identify weaknesses';

  @override
  String get votingTitle => 'Voting';

  @override
  String get votingDesc => 'Choosing survivors:';

  @override
  String get votingPoint1 => 'After the discussion, participants vote on who to kick out of the bunker';

  @override
  String get votingPoint2 => 'In some versions, you can vote for multiple players';

  @override
  String get votingPoint3 => 'The process is repeated until the required number of survivors remains';

  @override
  String get kickedOutPlayers => 'Kicked out players';

  @override
  String get noKickedOutPlayers => 'No kicked out players';

  @override
  String get cnt => 'Continue';

  @override
  String get family => 'Family';

  @override
  String get requiredToOpenProperties => 'Required to open characteristics';

  @override
  String get confirm => 'Confirm';

  @override
  String get hobbyAndSkills => 'Hobby/Skills';

  @override
  String get difficultySettings => 'Difficulty';

  @override
  String get playerInfo => 'Player info';
}
