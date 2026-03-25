// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Personalized Welcome';

  @override
  String get goodMorning => 'Good Morning';

  @override
  String get goodAfternoon => 'Good Afternoon';

  @override
  String get goodEvening => 'Good Evening';

  @override
  String welcomeWithName(String name) {
    return 'Welcome$name';
  }

  @override
  String get howAreYouFeeling => 'How are you feeling today?';

  @override
  String get moodInspired => 'Inspired';

  @override
  String get moodEnergized => 'Energized';

  @override
  String get moodCalm => 'Calm';

  @override
  String get moodFocused => 'Focused';

  @override
  String get moodCreative => 'Creative';

  @override
  String get quickStart => 'Quick Start';

  @override
  String get tileSetGoals => 'Set Goals';

  @override
  String get tileSetGoalsSub => 'Track your progress';

  @override
  String get tileExplore => 'Explore';

  @override
  String get tileExploreSub => 'Curated for you';

  @override
  String get tileAlerts => 'Alerts';

  @override
  String get tileAlertsSub => 'Stay updated';

  @override
  String get tileSettings => 'Settings';

  @override
  String get tileSettingsSub => 'Customize experience';

  @override
  String get beginYourJourney => 'Begin Your Journey';

  @override
  String get letsGetStarted => 'Let\'s Get Started';

  @override
  String get alreadyHaveAccountSignIn => 'Already have an account? Sign in';

  @override
  String get personalizeYourExperience => 'Personalize your experience';

  @override
  String get tapToTellName => 'Tap to tell us your name';

  @override
  String get whatShouldWeCallYou => 'What should we call you?';

  @override
  String get enterYourNameHint => 'Enter your name…';

  @override
  String helloUser(String userName) {
    return 'Hello, $userName! 👋';
  }

  @override
  String get wevePersonalized => 'We\'ve personalized your experience';

  @override
  String get setBadge => 'Set';

  @override
  String get exploreTitle => 'Explore';

  @override
  String get exploreSubtitle => 'Curated reads, just for you';

  @override
  String get search => 'Search';

  @override
  String get featured => 'Featured';

  @override
  String get latest => 'Latest';

  @override
  String articlesCount(int count) {
    return '$count articles';
  }

  @override
  String readMinutes(int n) {
    return '$n min';
  }

  @override
  String get readSuffix => ' read';

  @override
  String byAuthor(String author) {
    return 'by $author';
  }

  @override
  String get categoryAll => 'All';

  @override
  String get categoryTech => 'Tech';

  @override
  String get categoryDesign => 'Design';

  @override
  String get categoryWellness => 'Wellness';

  @override
  String get categoryFinance => 'Finance';

  @override
  String get categoryScience => 'Science';

  @override
  String get articleHciTitle => 'The Future of Human-Computer Interaction';

  @override
  String get articleDesignSysTitle =>
      'Design Systems That Scale With Your Team';

  @override
  String get articleMorningTitle => 'Morning Rituals of High Performers';

  @override
  String get articleIndexTitle => 'Index Funds vs Active Portfolio Management';

  @override
  String get articleNeuralTitle => 'Neural Plasticity and Learning New Skills';

  @override
  String get articleMicroTitle =>
      'Micro-interactions: Small Details, Big Impact';

  @override
  String get articleHabitsTitle => 'Building Habits That Actually Stick';

  @override
  String get articleGptTitle => 'GPT-5 and the Reasoning Revolution';

  @override
  String get alertsTitle => 'Alerts';

  @override
  String unreadCountBadge(int count) {
    return '$count unread';
  }

  @override
  String get readAll => 'Read all';

  @override
  String get statTotal => 'Total';

  @override
  String get statUrgent => 'Urgent';

  @override
  String get statUnread => 'Unread';

  @override
  String get statSuccess => 'Success';

  @override
  String get filterAll => 'All';

  @override
  String get filterUrgent => 'Urgent';

  @override
  String get filterUnread => 'Unread';

  @override
  String get filterInfo => 'Info';

  @override
  String get allClear => 'All clear!';

  @override
  String noAlertsForFilter(String filter) {
    return 'No $filter alerts';
  }

  @override
  String get dismiss => 'Dismiss';

  @override
  String get alertTypeUrgent => 'Urgent';

  @override
  String get alertTypeInfo => 'Info';

  @override
  String get alertTypeSuccess => 'Success';

  @override
  String get alertTypeWarning => 'Warning';

  @override
  String get alertGoalTitle => 'Goal deadline approaching';

  @override
  String get alertGoalBody =>
      'Your monthly run goal is due in 3 days. You\'re at 62%.';

  @override
  String get alertNewArticleTitle => 'New article available';

  @override
  String get alertNewArticleBody =>
      'Neural Plasticity and Learning has been added to your list.';

  @override
  String get alertSavingsTitle => 'Savings milestone reached!';

  @override
  String get alertSavingsBody =>
      'You\'ve hit 75% of your \$5,000 savings goal. Great work!';

  @override
  String get alertWeeklyTitle => 'Weekly check-in reminder';

  @override
  String get alertWeeklyBody =>
      'Don\'t forget to update your goal progress for this week.';

  @override
  String get alertTechTitle => '3 new articles in Tech';

  @override
  String get alertTechBody =>
      'Topics matching your interests have been curated for you.';

  @override
  String get alertStreakTitle => 'Streak maintained! 🔥';

  @override
  String get alertStreakBody =>
      'You\'ve logged in 7 days in a row. Keep it up!';

  @override
  String get alertSyncTitle => 'Settings sync failed';

  @override
  String get alertSyncBody =>
      'Your preferences couldn\'t be synced. Tap to retry.';

  @override
  String get time2m => '2m ago';

  @override
  String get time18m => '18m ago';

  @override
  String get time1h => '1h ago';

  @override
  String get time3h => '3h ago';

  @override
  String get time5h => '5h ago';

  @override
  String get timeYesterday => 'Yesterday';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsFitness => 'Fitness';

  @override
  String get settingsStepGoals => 'Step & distance goals';

  @override
  String get settingsExploreArticles => 'Explore articles';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsPush => 'Push Notifications';

  @override
  String get settingsPushSub => 'Alerts and updates';

  @override
  String get settingsEmailDigest => 'Email Digest';

  @override
  String get settingsEmailDigestSub => 'Weekly summary';

  @override
  String get settingsGoalReminders => 'Goal Reminders';

  @override
  String get settingsGoalRemindersSub => 'Daily nudges';

  @override
  String get settingsWeeklyReport => 'Weekly Report';

  @override
  String get settingsWeeklyReportSub => 'Progress overview';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsDarkMode => 'Dark Mode';

  @override
  String get settingsDarkModeSub => 'Easier on the eyes';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsPrivacy => 'Privacy & Data';

  @override
  String get settingsHaptics => 'Haptic Feedback';

  @override
  String get settingsHapticsSub => 'Touch vibrations';

  @override
  String get settingsAnalytics => 'Analytics';

  @override
  String get settingsAnalyticsSub => 'Help us improve';

  @override
  String get settingsCloudSync => 'Cloud Sync';

  @override
  String get settingsCloudSyncSub => 'Sync across devices';

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsChangePassword => 'Change Password';

  @override
  String get settingsSignOut => 'Sign Out';

  @override
  String get settingsDeleteAccount => 'Delete Account';

  @override
  String get settingsProfileTap => 'Tap to edit display name';

  @override
  String get settingsVersion => 'Version 1.0.0 • Made with ❤️';

  @override
  String selectOption(String label) {
    return 'Select $label';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get update => 'Update';

  @override
  String get editProfile => 'Edit profile';

  @override
  String get displayName => 'Display name';

  @override
  String get changePassword => 'Change password';

  @override
  String get newPassword => 'New password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get signOutTitle => 'Sign out?';

  @override
  String get signOutBody =>
      'You will need to sign in again to access your personalized content.';

  @override
  String get signOutAction => 'Sign out';

  @override
  String get deleteAccountTitle => 'Delete account?';

  @override
  String get deleteAccountBody =>
      'This cannot be undone. All your data will be permanently removed.';

  @override
  String get deleteAction => 'Delete';

  @override
  String get toastProfileUpdated => 'Profile updated';

  @override
  String get toastPasswordShort => 'Password must be at least 8 characters';

  @override
  String get toastPasswordMismatch => 'Passwords do not match';

  @override
  String get toastPasswordUpdated => 'Password updated';

  @override
  String get toastAccountDeletion => 'Account deletion requested';

  @override
  String get toastDarkOn => 'Dark mode on';

  @override
  String get toastDarkOff => 'Dark mode off';

  @override
  String toastThemeApplied(String name) {
    return 'Theme: $name';
  }

  @override
  String toastLanguageApplied(String name) {
    return 'Language: $name';
  }

  @override
  String get goalsTitle => 'My Goals';

  @override
  String get goalsWeeklySteps => 'Weekly Steps';

  @override
  String goalsSteps(int count) {
    return '$count steps';
  }

  @override
  String goalsDistanceKm(String km) {
    return 'Distance: $km km';
  }

  @override
  String goalsStepsLabel(int count) {
    return 'Steps: $count';
  }

  @override
  String goalsDeadline(String date) {
    return 'Deadline: $date';
  }

  @override
  String goalsRunMonth(String km) {
    return 'Run $km km this month';
  }

  @override
  String get goalsCategoryFitness => 'Fitness';

  @override
  String get goalsCategorySavings => 'Savings';

  @override
  String get goalsCategoryReading => 'Reading';

  @override
  String goalsSavingsMonth(String amount) {
    return 'Save $amount this month';
  }

  @override
  String goalsReadingMonth(int count) {
    return 'Read $count books this month';
  }

  @override
  String goalsSavedProgress(int current, int target) {
    return '$current / $target saved';
  }

  @override
  String goalsBooksProgress(int read, int total) {
    return '$read of $total books';
  }

  @override
  String get weekdayMon => 'Mon';

  @override
  String get weekdayTue => 'Tue';

  @override
  String get weekdayWed => 'Wed';

  @override
  String get weekdayThu => 'Thu';

  @override
  String get weekdayFri => 'Fri';

  @override
  String get weekdaySat => 'Sat';

  @override
  String get weekdaySun => 'Sun';

  @override
  String get monthJan => 'Jan';

  @override
  String get monthFeb => 'Feb';

  @override
  String get monthMar => 'Mar';

  @override
  String get monthApr => 'Apr';

  @override
  String get monthMay => 'May';

  @override
  String get monthJun => 'Jun';

  @override
  String get monthJul => 'Jul';

  @override
  String get monthAug => 'Aug';

  @override
  String get monthSep => 'Sep';

  @override
  String get monthOct => 'Oct';

  @override
  String get monthNov => 'Nov';

  @override
  String get monthDec => 'Dec';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeAmoled => 'AMOLED';

  @override
  String get langEnglish => 'English';

  @override
  String get langSpanish => 'Spanish';

  @override
  String get langFrench => 'French';

  @override
  String get langHindi => 'Hindi';

  @override
  String get langJapanese => 'Japanese';

  @override
  String get settingsProfileDefault => 'Your Profile';
}
