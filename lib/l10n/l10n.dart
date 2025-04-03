import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бункер'**
  String get appTitle;

  /// No description provided for @newGame.
  ///
  /// In ru, this message translates to:
  /// **'Новая игра'**
  String get newGame;

  /// No description provided for @history.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get history;

  /// No description provided for @rules.
  ///
  /// In ru, this message translates to:
  /// **'Правила'**
  String get rules;

  /// No description provided for @volume.
  ///
  /// In ru, this message translates to:
  /// **'Громкость'**
  String get volume;

  /// No description provided for @music.
  ///
  /// In ru, this message translates to:
  /// **'Музыка'**
  String get music;

  /// No description provided for @dubbing.
  ///
  /// In ru, this message translates to:
  /// **'Озвучка'**
  String get dubbing;

  /// No description provided for @effects.
  ///
  /// In ru, this message translates to:
  /// **'Эффекты'**
  String get effects;

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @game_settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки игры'**
  String get game_settings;

  /// No description provided for @exitGameTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выход из игры'**
  String get exitGameTitle;

  /// No description provided for @exitGameMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите выйти из игры?'**
  String get exitGameMessage;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @exit.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get exit;

  /// No description provided for @gameTone.
  ///
  /// In ru, this message translates to:
  /// **'Тон игры'**
  String get gameTone;

  /// No description provided for @familyFriendly.
  ///
  /// In ru, this message translates to:
  /// **'Семейный'**
  String get familyFriendly;

  /// No description provided for @plotWishes.
  ///
  /// In ru, this message translates to:
  /// **'Введите пожелания по сюжету'**
  String get plotWishes;

  /// No description provided for @voting.
  ///
  /// In ru, this message translates to:
  /// **'Голосование'**
  String get voting;

  /// No description provided for @playerVoting.
  ///
  /// In ru, this message translates to:
  /// **'Голосует игрок {playerName}'**
  String playerVoting(Object playerName);

  /// No description provided for @round.
  ///
  /// In ru, this message translates to:
  /// **'РАУНД'**
  String get round;

  /// No description provided for @survivors.
  ///
  /// In ru, this message translates to:
  /// **'Выжившие:'**
  String get survivors;

  /// No description provided for @eliminated.
  ///
  /// In ru, this message translates to:
  /// **'Выбывшие:'**
  String get eliminated;

  /// No description provided for @howManyToKick.
  ///
  /// In ru, this message translates to:
  /// **'Сколько человек кикнуть'**
  String get howManyToKick;

  /// No description provided for @disasterDescription.
  ///
  /// In ru, this message translates to:
  /// **'Описание катастрофы'**
  String get disasterDescription;

  /// No description provided for @shelter.
  ///
  /// In ru, this message translates to:
  /// **'Бункер'**
  String get shelter;

  /// No description provided for @information.
  ///
  /// In ru, this message translates to:
  /// **'Информация'**
  String get information;

  /// No description provided for @difficulty.
  ///
  /// In ru, this message translates to:
  /// **'Сложность'**
  String get difficulty;

  /// No description provided for @difficultyClassic.
  ///
  /// In ru, this message translates to:
  /// **'Классика'**
  String get difficultyClassic;

  /// No description provided for @difficultyHardcore.
  ///
  /// In ru, this message translates to:
  /// **'Хардкор'**
  String get difficultyHardcore;

  /// No description provided for @difficultyInsanity.
  ///
  /// In ru, this message translates to:
  /// **'Безумие'**
  String get difficultyInsanity;

  /// No description provided for @count.
  ///
  /// In ru, this message translates to:
  /// **'Количество: {count}'**
  String count(Object count);

  /// No description provided for @countPlayers.
  ///
  /// In ru, this message translates to:
  /// **'Количество игроков'**
  String get countPlayers;

  /// No description provided for @startGame.
  ///
  /// In ru, this message translates to:
  /// **'Начать игру'**
  String get startGame;

  /// No description provided for @pause.
  ///
  /// In ru, this message translates to:
  /// **'Пауза'**
  String get pause;

  /// No description provided for @lore.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get lore;

  /// No description provided for @loading.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка...'**
  String get loading;

  /// No description provided for @goBack.
  ///
  /// In ru, this message translates to:
  /// **'Вернуться'**
  String get goBack;

  /// No description provided for @rulesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Правила игры'**
  String get rulesTitle;

  /// No description provided for @gameTitle.
  ///
  /// In ru, this message translates to:
  /// **'Игра \"Бункер\"'**
  String get gameTitle;

  /// No description provided for @gameDescription.
  ///
  /// In ru, this message translates to:
  /// **'Популярная социально-стратегическая игра, в которой участники должны убедить остальных, что именно они достойны места в бункере после глобальной катастрофы.'**
  String get gameDescription;

  /// No description provided for @disasterScenario.
  ///
  /// In ru, this message translates to:
  /// **'Сценарий катастрофы'**
  String get disasterScenario;

  /// No description provided for @disasterScenarioDesc.
  ///
  /// In ru, this message translates to:
  /// **'В начале игры объявляется тип апокалипсиса (ядерная война, пандемия, падение астероида и т.д.), что влияет на стратегию выживания.'**
  String get disasterScenarioDesc;

  /// No description provided for @characterRoles.
  ///
  /// In ru, this message translates to:
  /// **'Раздача ролей и характеристик'**
  String get characterRoles;

  /// No description provided for @characterRolesDesc.
  ///
  /// In ru, this message translates to:
  /// **'Каждый игрок получает случайные параметры:'**
  String get characterRolesDesc;

  /// No description provided for @profession.
  ///
  /// In ru, this message translates to:
  /// **'Профессия (врач, инженер, военный, учитель и т.д.)'**
  String get profession;

  /// No description provided for @age.
  ///
  /// In ru, this message translates to:
  /// **'Возраст (может влиять на физические возможности)'**
  String get age;

  /// No description provided for @health.
  ///
  /// In ru, this message translates to:
  /// **'Здоровье (хронические болезни, инвалидность, отличная форма)'**
  String get health;

  /// No description provided for @hobbies.
  ///
  /// In ru, this message translates to:
  /// **'Хобби/навыки (может быть полезным или бесполезным в бункере)'**
  String get hobbies;

  /// No description provided for @phobias.
  ///
  /// In ru, this message translates to:
  /// **'Фобии (страхи, которые могут помешать выживанию)'**
  String get phobias;

  /// No description provided for @luggage.
  ///
  /// In ru, this message translates to:
  /// **'Багаж (предмет, который игрок взял с собой, например, оружие, аптечка, книги)'**
  String get luggage;

  /// No description provided for @additionalInfo.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительная информация (например, беременность, криминальное прошлое)'**
  String get additionalInfo;

  /// No description provided for @discussionDebate.
  ///
  /// In ru, this message translates to:
  /// **'Обсуждение и дебаты'**
  String get discussionDebate;

  /// No description provided for @discussionDebateDesc.
  ///
  /// In ru, this message translates to:
  /// **'Процесс принятия решений:'**
  String get discussionDebateDesc;

  /// No description provided for @discussionDebatePoint1.
  ///
  /// In ru, this message translates to:
  /// **'Игроки по очереди рассказывают о себе и доказывают, почему их нужно оставить в бункере'**
  String get discussionDebatePoint1;

  /// No description provided for @discussionDebatePoint2.
  ///
  /// In ru, this message translates to:
  /// **'Можно задавать друг другу вопросы, выявлять слабые стороны'**
  String get discussionDebatePoint2;

  /// No description provided for @votingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Голосование'**
  String get votingTitle;

  /// No description provided for @votingDesc.
  ///
  /// In ru, this message translates to:
  /// **'Выбор выживших:'**
  String get votingDesc;

  /// No description provided for @votingPoint1.
  ///
  /// In ru, this message translates to:
  /// **'После обсуждения участники голосуют, кого выгнать из бункера'**
  String get votingPoint1;

  /// No description provided for @votingPoint2.
  ///
  /// In ru, this message translates to:
  /// **'В некоторых версиях можно голосовать за нескольких игроков'**
  String get votingPoint2;

  /// No description provided for @votingPoint3.
  ///
  /// In ru, this message translates to:
  /// **'Процесс повторяется, пока не останется нужное количество выживших'**
  String get votingPoint3;

  /// No description provided for @kickedOutPlayers.
  ///
  /// In ru, this message translates to:
  /// **'Выгнанные игроки'**
  String get kickedOutPlayers;

  /// No description provided for @noKickedOutPlayers.
  ///
  /// In ru, this message translates to:
  /// **'Нет выгнанных игроков'**
  String get noKickedOutPlayers;

  /// No description provided for @cnt.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get cnt;

  /// No description provided for @family.
  ///
  /// In ru, this message translates to:
  /// **'Семейный'**
  String get family;

  /// No description provided for @time.
  ///
  /// In ru, this message translates to:
  /// **'Время'**
  String get time;

  /// No description provided for @requiredToOpenProperties.
  ///
  /// In ru, this message translates to:
  /// **'Требуется открыть характеристик'**
  String get requiredToOpenProperties;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
