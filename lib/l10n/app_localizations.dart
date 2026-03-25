import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ta.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('ja'),
    Locale('ta'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Personalized Welcome'**
  String get appTitle;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get goodEvening;

  /// No description provided for @welcomeWithName.
  ///
  /// In en, this message translates to:
  /// **'Welcome{name}'**
  String welcomeWithName(String name);

  /// No description provided for @howAreYouFeeling.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get howAreYouFeeling;

  /// No description provided for @moodInspired.
  ///
  /// In en, this message translates to:
  /// **'Inspired'**
  String get moodInspired;

  /// No description provided for @moodEnergized.
  ///
  /// In en, this message translates to:
  /// **'Energized'**
  String get moodEnergized;

  /// No description provided for @moodCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get moodCalm;

  /// No description provided for @moodFocused.
  ///
  /// In en, this message translates to:
  /// **'Focused'**
  String get moodFocused;

  /// No description provided for @moodCreative.
  ///
  /// In en, this message translates to:
  /// **'Creative'**
  String get moodCreative;

  /// No description provided for @quickStart.
  ///
  /// In en, this message translates to:
  /// **'Quick Start'**
  String get quickStart;

  /// No description provided for @tileSetGoals.
  ///
  /// In en, this message translates to:
  /// **'Set Goals'**
  String get tileSetGoals;

  /// No description provided for @tileSetGoalsSub.
  ///
  /// In en, this message translates to:
  /// **'Track your progress'**
  String get tileSetGoalsSub;

  /// No description provided for @tileExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get tileExplore;

  /// No description provided for @tileExploreSub.
  ///
  /// In en, this message translates to:
  /// **'Curated for you'**
  String get tileExploreSub;

  /// No description provided for @tileAlerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get tileAlerts;

  /// No description provided for @tileAlertsSub.
  ///
  /// In en, this message translates to:
  /// **'Stay updated'**
  String get tileAlertsSub;

  /// No description provided for @tileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tileSettings;

  /// No description provided for @tileSettingsSub.
  ///
  /// In en, this message translates to:
  /// **'Customize experience'**
  String get tileSettingsSub;

  /// No description provided for @beginYourJourney.
  ///
  /// In en, this message translates to:
  /// **'Begin Your Journey'**
  String get beginYourJourney;

  /// No description provided for @letsGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started'**
  String get letsGetStarted;

  /// No description provided for @alreadyHaveAccountSignIn.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get alreadyHaveAccountSignIn;

  /// No description provided for @personalizeYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Personalize your experience'**
  String get personalizeYourExperience;

  /// No description provided for @tapToTellName.
  ///
  /// In en, this message translates to:
  /// **'Tap to tell us your name'**
  String get tapToTellName;

  /// No description provided for @whatShouldWeCallYou.
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get whatShouldWeCallYou;

  /// No description provided for @enterYourNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name…'**
  String get enterYourNameHint;

  /// No description provided for @helloUser.
  ///
  /// In en, this message translates to:
  /// **'Hello, {userName}! 👋'**
  String helloUser(String userName);

  /// No description provided for @wevePersonalized.
  ///
  /// In en, this message translates to:
  /// **'We\'ve personalized your experience'**
  String get wevePersonalized;

  /// No description provided for @setBadge.
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get setBadge;

  /// No description provided for @exploreTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get exploreTitle;

  /// No description provided for @exploreSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Curated reads, just for you'**
  String get exploreSubtitle;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @latest.
  ///
  /// In en, this message translates to:
  /// **'Latest'**
  String get latest;

  /// No description provided for @articlesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} articles'**
  String articlesCount(int count);

  /// No description provided for @readMinutes.
  ///
  /// In en, this message translates to:
  /// **'{n} min'**
  String readMinutes(int n);

  /// No description provided for @readSuffix.
  ///
  /// In en, this message translates to:
  /// **' read'**
  String get readSuffix;

  /// No description provided for @byAuthor.
  ///
  /// In en, this message translates to:
  /// **'by {author}'**
  String byAuthor(String author);

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryTech.
  ///
  /// In en, this message translates to:
  /// **'Tech'**
  String get categoryTech;

  /// No description provided for @categoryDesign.
  ///
  /// In en, this message translates to:
  /// **'Design'**
  String get categoryDesign;

  /// No description provided for @categoryWellness.
  ///
  /// In en, this message translates to:
  /// **'Wellness'**
  String get categoryWellness;

  /// No description provided for @categoryFinance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get categoryFinance;

  /// No description provided for @categoryScience.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get categoryScience;

  /// No description provided for @articleHciTitle.
  ///
  /// In en, this message translates to:
  /// **'The Future of Human-Computer Interaction'**
  String get articleHciTitle;

  /// No description provided for @articleDesignSysTitle.
  ///
  /// In en, this message translates to:
  /// **'Design Systems That Scale With Your Team'**
  String get articleDesignSysTitle;

  /// No description provided for @articleMorningTitle.
  ///
  /// In en, this message translates to:
  /// **'Morning Rituals of High Performers'**
  String get articleMorningTitle;

  /// No description provided for @articleIndexTitle.
  ///
  /// In en, this message translates to:
  /// **'Index Funds vs Active Portfolio Management'**
  String get articleIndexTitle;

  /// No description provided for @articleNeuralTitle.
  ///
  /// In en, this message translates to:
  /// **'Neural Plasticity and Learning New Skills'**
  String get articleNeuralTitle;

  /// No description provided for @articleMicroTitle.
  ///
  /// In en, this message translates to:
  /// **'Micro-interactions: Small Details, Big Impact'**
  String get articleMicroTitle;

  /// No description provided for @articleHabitsTitle.
  ///
  /// In en, this message translates to:
  /// **'Building Habits That Actually Stick'**
  String get articleHabitsTitle;

  /// No description provided for @articleGptTitle.
  ///
  /// In en, this message translates to:
  /// **'GPT-5 and the Reasoning Revolution'**
  String get articleGptTitle;

  /// No description provided for @alertsTitle.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get alertsTitle;

  /// No description provided for @unreadCountBadge.
  ///
  /// In en, this message translates to:
  /// **'{count} unread'**
  String unreadCountBadge(int count);

  /// No description provided for @readAll.
  ///
  /// In en, this message translates to:
  /// **'Read all'**
  String get readAll;

  /// No description provided for @statTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get statTotal;

  /// No description provided for @statUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get statUrgent;

  /// No description provided for @statUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get statUnread;

  /// No description provided for @statSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get statSuccess;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get filterUrgent;

  /// No description provided for @filterUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get filterUnread;

  /// No description provided for @filterInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get filterInfo;

  /// No description provided for @allClear.
  ///
  /// In en, this message translates to:
  /// **'All clear!'**
  String get allClear;

  /// No description provided for @noAlertsForFilter.
  ///
  /// In en, this message translates to:
  /// **'No {filter} alerts'**
  String noAlertsForFilter(String filter);

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @alertTypeUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get alertTypeUrgent;

  /// No description provided for @alertTypeInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get alertTypeInfo;

  /// No description provided for @alertTypeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get alertTypeSuccess;

  /// No description provided for @alertTypeWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get alertTypeWarning;

  /// No description provided for @alertGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'Goal deadline approaching'**
  String get alertGoalTitle;

  /// No description provided for @alertGoalBody.
  ///
  /// In en, this message translates to:
  /// **'Your monthly run goal is due in 3 days. You\'re at 62%.'**
  String get alertGoalBody;

  /// No description provided for @alertNewArticleTitle.
  ///
  /// In en, this message translates to:
  /// **'New article available'**
  String get alertNewArticleTitle;

  /// No description provided for @alertNewArticleBody.
  ///
  /// In en, this message translates to:
  /// **'Neural Plasticity and Learning has been added to your list.'**
  String get alertNewArticleBody;

  /// No description provided for @alertSavingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Savings milestone reached!'**
  String get alertSavingsTitle;

  /// No description provided for @alertSavingsBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ve hit 75% of your \$5,000 savings goal. Great work!'**
  String get alertSavingsBody;

  /// No description provided for @alertWeeklyTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly check-in reminder'**
  String get alertWeeklyTitle;

  /// No description provided for @alertWeeklyBody.
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to update your goal progress for this week.'**
  String get alertWeeklyBody;

  /// No description provided for @alertTechTitle.
  ///
  /// In en, this message translates to:
  /// **'3 new articles in Tech'**
  String get alertTechTitle;

  /// No description provided for @alertTechBody.
  ///
  /// In en, this message translates to:
  /// **'Topics matching your interests have been curated for you.'**
  String get alertTechBody;

  /// No description provided for @alertStreakTitle.
  ///
  /// In en, this message translates to:
  /// **'Streak maintained! 🔥'**
  String get alertStreakTitle;

  /// No description provided for @alertStreakBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ve logged in 7 days in a row. Keep it up!'**
  String get alertStreakBody;

  /// No description provided for @alertSyncTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings sync failed'**
  String get alertSyncTitle;

  /// No description provided for @alertSyncBody.
  ///
  /// In en, this message translates to:
  /// **'Your preferences couldn\'t be synced. Tap to retry.'**
  String get alertSyncBody;

  /// No description provided for @time2m.
  ///
  /// In en, this message translates to:
  /// **'2m ago'**
  String get time2m;

  /// No description provided for @time18m.
  ///
  /// In en, this message translates to:
  /// **'18m ago'**
  String get time18m;

  /// No description provided for @time1h.
  ///
  /// In en, this message translates to:
  /// **'1h ago'**
  String get time1h;

  /// No description provided for @time3h.
  ///
  /// In en, this message translates to:
  /// **'3h ago'**
  String get time3h;

  /// No description provided for @time5h.
  ///
  /// In en, this message translates to:
  /// **'5h ago'**
  String get time5h;

  /// No description provided for @timeYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get timeYesterday;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsFitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get settingsFitness;

  /// No description provided for @settingsStepGoals.
  ///
  /// In en, this message translates to:
  /// **'Step & distance goals'**
  String get settingsStepGoals;

  /// No description provided for @settingsExploreArticles.
  ///
  /// In en, this message translates to:
  /// **'Explore articles'**
  String get settingsExploreArticles;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsPush.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get settingsPush;

  /// No description provided for @settingsPushSub.
  ///
  /// In en, this message translates to:
  /// **'Alerts and updates'**
  String get settingsPushSub;

  /// No description provided for @settingsEmailDigest.
  ///
  /// In en, this message translates to:
  /// **'Email Digest'**
  String get settingsEmailDigest;

  /// No description provided for @settingsEmailDigestSub.
  ///
  /// In en, this message translates to:
  /// **'Weekly summary'**
  String get settingsEmailDigestSub;

  /// No description provided for @settingsGoalReminders.
  ///
  /// In en, this message translates to:
  /// **'Goal Reminders'**
  String get settingsGoalReminders;

  /// No description provided for @settingsGoalRemindersSub.
  ///
  /// In en, this message translates to:
  /// **'Daily nudges'**
  String get settingsGoalRemindersSub;

  /// No description provided for @settingsWeeklyReport.
  ///
  /// In en, this message translates to:
  /// **'Weekly Report'**
  String get settingsWeeklyReport;

  /// No description provided for @settingsWeeklyReportSub.
  ///
  /// In en, this message translates to:
  /// **'Progress overview'**
  String get settingsWeeklyReportSub;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingsDarkMode;

  /// No description provided for @settingsDarkModeSub.
  ///
  /// In en, this message translates to:
  /// **'Easier on the eyes'**
  String get settingsDarkModeSub;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Data'**
  String get settingsPrivacy;

  /// No description provided for @settingsHaptics.
  ///
  /// In en, this message translates to:
  /// **'Haptic Feedback'**
  String get settingsHaptics;

  /// No description provided for @settingsHapticsSub.
  ///
  /// In en, this message translates to:
  /// **'Touch vibrations'**
  String get settingsHapticsSub;

  /// No description provided for @settingsAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get settingsAnalytics;

  /// No description provided for @settingsAnalyticsSub.
  ///
  /// In en, this message translates to:
  /// **'Help us improve'**
  String get settingsAnalyticsSub;

  /// No description provided for @settingsCloudSync.
  ///
  /// In en, this message translates to:
  /// **'Cloud Sync'**
  String get settingsCloudSync;

  /// No description provided for @settingsCloudSyncSub.
  ///
  /// In en, this message translates to:
  /// **'Sync across devices'**
  String get settingsCloudSyncSub;

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// No description provided for @settingsChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsChangePassword;

  /// No description provided for @settingsSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get settingsSignOut;

  /// No description provided for @settingsDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get settingsDeleteAccount;

  /// No description provided for @settingsProfileTap.
  ///
  /// In en, this message translates to:
  /// **'Tap to edit display name'**
  String get settingsProfileTap;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0 • Made with ❤️'**
  String get settingsVersion;

  /// No description provided for @selectOption.
  ///
  /// In en, this message translates to:
  /// **'Select {label}'**
  String selectOption(String label);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get displayName;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @signOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign out?'**
  String get signOutTitle;

  /// No description provided for @signOutBody.
  ///
  /// In en, this message translates to:
  /// **'You will need to sign in again to access your personalized content.'**
  String get signOutBody;

  /// No description provided for @signOutAction.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOutAction;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account?'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountBody.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone. All your data will be permanently removed.'**
  String get deleteAccountBody;

  /// No description provided for @deleteAction.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteAction;

  /// No description provided for @toastProfileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get toastProfileUpdated;

  /// No description provided for @toastPasswordShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get toastPasswordShort;

  /// No description provided for @toastPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get toastPasswordMismatch;

  /// No description provided for @toastPasswordUpdated.
  ///
  /// In en, this message translates to:
  /// **'Password updated'**
  String get toastPasswordUpdated;

  /// No description provided for @toastAccountDeletion.
  ///
  /// In en, this message translates to:
  /// **'Account deletion requested'**
  String get toastAccountDeletion;

  /// No description provided for @toastDarkOn.
  ///
  /// In en, this message translates to:
  /// **'Dark mode on'**
  String get toastDarkOn;

  /// No description provided for @toastDarkOff.
  ///
  /// In en, this message translates to:
  /// **'Dark mode off'**
  String get toastDarkOff;

  /// No description provided for @toastThemeApplied.
  ///
  /// In en, this message translates to:
  /// **'Theme: {name}'**
  String toastThemeApplied(String name);

  /// No description provided for @toastLanguageApplied.
  ///
  /// In en, this message translates to:
  /// **'Language: {name}'**
  String toastLanguageApplied(String name);

  /// No description provided for @goalsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Goals'**
  String get goalsTitle;

  /// No description provided for @goalsWeeklySteps.
  ///
  /// In en, this message translates to:
  /// **'Weekly Steps'**
  String get goalsWeeklySteps;

  /// No description provided for @goalsSteps.
  ///
  /// In en, this message translates to:
  /// **'{count} steps'**
  String goalsSteps(int count);

  /// No description provided for @goalsDistanceKm.
  ///
  /// In en, this message translates to:
  /// **'Distance: {km} km'**
  String goalsDistanceKm(String km);

  /// No description provided for @goalsStepsLabel.
  ///
  /// In en, this message translates to:
  /// **'Steps: {count}'**
  String goalsStepsLabel(int count);

  /// No description provided for @goalsDeadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline: {date}'**
  String goalsDeadline(String date);

  /// No description provided for @goalsRunMonth.
  ///
  /// In en, this message translates to:
  /// **'Run {km} km this month'**
  String goalsRunMonth(String km);

  /// No description provided for @goalsCategoryFitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get goalsCategoryFitness;

  /// No description provided for @goalsCategorySavings.
  ///
  /// In en, this message translates to:
  /// **'Savings'**
  String get goalsCategorySavings;

  /// No description provided for @goalsCategoryReading.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get goalsCategoryReading;

  /// No description provided for @goalsSavingsMonth.
  ///
  /// In en, this message translates to:
  /// **'Save {amount} this month'**
  String goalsSavingsMonth(String amount);

  /// No description provided for @goalsReadingMonth.
  ///
  /// In en, this message translates to:
  /// **'Read {count} books this month'**
  String goalsReadingMonth(int count);

  /// No description provided for @goalsSavedProgress.
  ///
  /// In en, this message translates to:
  /// **'{current} / {target} saved'**
  String goalsSavedProgress(int current, int target);

  /// No description provided for @goalsBooksProgress.
  ///
  /// In en, this message translates to:
  /// **'{read} of {total} books'**
  String goalsBooksProgress(int read, int total);

  /// No description provided for @weekdayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get weekdayMon;

  /// No description provided for @weekdayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get weekdayTue;

  /// No description provided for @weekdayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get weekdayWed;

  /// No description provided for @weekdayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get weekdayThu;

  /// No description provided for @weekdayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get weekdayFri;

  /// No description provided for @weekdaySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get weekdaySat;

  /// No description provided for @weekdaySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get weekdaySun;

  /// No description provided for @monthJan.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get monthJan;

  /// No description provided for @monthFeb.
  ///
  /// In en, this message translates to:
  /// **'Feb'**
  String get monthFeb;

  /// No description provided for @monthMar.
  ///
  /// In en, this message translates to:
  /// **'Mar'**
  String get monthMar;

  /// No description provided for @monthApr.
  ///
  /// In en, this message translates to:
  /// **'Apr'**
  String get monthApr;

  /// No description provided for @monthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// No description provided for @monthJun.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get monthJun;

  /// No description provided for @monthJul.
  ///
  /// In en, this message translates to:
  /// **'Jul'**
  String get monthJul;

  /// No description provided for @monthAug.
  ///
  /// In en, this message translates to:
  /// **'Aug'**
  String get monthAug;

  /// No description provided for @monthSep.
  ///
  /// In en, this message translates to:
  /// **'Sep'**
  String get monthSep;

  /// No description provided for @monthOct.
  ///
  /// In en, this message translates to:
  /// **'Oct'**
  String get monthOct;

  /// No description provided for @monthNov.
  ///
  /// In en, this message translates to:
  /// **'Nov'**
  String get monthNov;

  /// No description provided for @monthDec.
  ///
  /// In en, this message translates to:
  /// **'Dec'**
  String get monthDec;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeAmoled.
  ///
  /// In en, this message translates to:
  /// **'AMOLED'**
  String get themeAmoled;

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// No description provided for @langSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get langSpanish;

  /// No description provided for @langFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get langFrench;

  /// No description provided for @langHindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get langHindi;

  /// No description provided for @langJapanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get langJapanese;

  /// No description provided for @settingsProfileDefault.
  ///
  /// In en, this message translates to:
  /// **'Your Profile'**
  String get settingsProfileDefault;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'en',
    'es',
    'fr',
    'hi',
    'ja',
    'ta',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'ja':
      return AppLocalizationsJa();
    case 'ta':
      return AppLocalizationsTa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
