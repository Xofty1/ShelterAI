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

  /// No description provided for @playerAmount.
  ///
  /// In ru, this message translates to:
  /// **'Количество игроков'**
  String get playerAmount;

  /// No description provided for @continueWord.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get continueWord;

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

  /// No description provided for @close.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// No description provided for @gameTone.
  ///
  /// In ru, this message translates to:
  /// **'Тон игры'**
  String get gameTone;

  /// No description provided for @random.
  ///
  /// In ru, this message translates to:
  /// **'Рандом'**
  String get random;

  /// No description provided for @difficultySetting.
  ///
  /// In ru, this message translates to:
  /// **'Сложность'**
  String get difficultySetting;

  /// No description provided for @familyFriendly.
  ///
  /// In ru, this message translates to:
  /// **'Семейный'**
  String get familyFriendly;

  /// No description provided for @timer.
  ///
  /// In ru, this message translates to:
  /// **'Таймер'**
  String get timer;

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

  /// No description provided for @pressToSeeCard.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите, чтобы увидеть карту игрока'**
  String get pressToSeeCard;

  /// No description provided for @eliminated.
  ///
  /// In ru, this message translates to:
  /// **'Выбывшие:'**
  String get eliminated;

  /// No description provided for @finale.
  ///
  /// In ru, this message translates to:
  /// **'ФИНАЛ'**
  String get finale;

  /// No description provided for @inBunker.
  ///
  /// In ru, this message translates to:
  /// **'В бункер попали:'**
  String get inBunker;

  /// No description provided for @notInBunker.
  ///
  /// In ru, this message translates to:
  /// **'Не попали:'**
  String get notInBunker;

  /// No description provided for @howManyToKick.
  ///
  /// In ru, this message translates to:
  /// **'Сколько человек выгнать:'**
  String get howManyToKick;

  /// No description provided for @kickedPlayers.
  ///
  /// In ru, this message translates to:
  /// **'Выгнанные игроки'**
  String get kickedPlayers;

  /// No description provided for @characteristicsToOpen.
  ///
  /// In ru, this message translates to:
  /// **'Требуется открыть характеристик:'**
  String get characteristicsToOpen;

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

  /// No description provided for @finish.
  ///
  /// In ru, this message translates to:
  /// **'Завершить'**
  String get finish;

  /// No description provided for @shelterDescription.
  ///
  /// In ru, this message translates to:
  /// **'Описание бункера'**
  String get shelterDescription;

  /// No description provided for @capacity.
  ///
  /// In ru, this message translates to:
  /// **'Вместимость'**
  String get capacity;

  /// No description provided for @confirmVote.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить голос'**
  String get confirmVote;

  /// No description provided for @rooms.
  ///
  /// In ru, this message translates to:
  /// **'Помещения'**
  String get rooms;

  /// No description provided for @discussion.
  ///
  /// In ru, this message translates to:
  /// **'Обсуждение'**
  String get discussion;

  /// No description provided for @resources.
  ///
  /// In ru, this message translates to:
  /// **'Ресурсы'**
  String get resources;

  /// No description provided for @information.
  ///
  /// In ru, this message translates to:
  /// **'Информация'**
  String get information;

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

  /// No description provided for @difficulty.
  ///
  /// In ru, this message translates to:
  /// **'Сложность: {level}'**
  String difficulty(Object level);

  /// No description provided for @familyMode.
  ///
  /// In ru, this message translates to:
  /// **'Семейный режим: {familyMode}'**
  String familyMode(Object familyMode);

  /// No description provided for @timerSettings.
  ///
  /// In ru, this message translates to:
  /// **'Таймер: {timer}'**
  String timerSettings(Object timer);

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

  /// No description provided for @age.
  ///
  /// In ru, this message translates to:
  /// **'Возраст'**
  String get age;

  /// No description provided for @confirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get confirm;

  /// No description provided for @health.
  ///
  /// In ru, this message translates to:
  /// **'Здоровье'**
  String get health;

  /// No description provided for @hobbyAndSkills.
  ///
  /// In ru, this message translates to:
  /// **'Хобби/Навыки'**
  String get hobbyAndSkills;

  /// No description provided for @phobias.
  ///
  /// In ru, this message translates to:
  /// **'Фобии'**
  String get phobias;

  /// No description provided for @luggage.
  ///
  /// In ru, this message translates to:
  /// **'Багаж'**
  String get luggage;

  /// No description provided for @additionalInfo.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительная информация'**
  String get additionalInfo;
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
