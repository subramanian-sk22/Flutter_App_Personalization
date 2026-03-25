// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'தனிப்பட்ட வரவேற்பு';

  @override
  String get goodMorning => 'காலை வணக்கம்';

  @override
  String get goodAfternoon => 'மதியம் வணக்கம்';

  @override
  String get goodEvening => 'மாலை வணக்கம்';

  @override
  String welcomeWithName(String name) {
    return 'வரவேற்கிறோம் $name';
  }

  @override
  String get howAreYouFeeling => 'இன்று நீங்கள் எப்படி உணர்கிறீர்கள்?';

  @override
  String get moodInspired => 'உந்துதல்';

  @override
  String get moodEnergized => 'ஆற்றல் மிகுந்த';

  @override
  String get moodCalm => 'அமைதி';

  @override
  String get moodFocused => 'கவனம்';

  @override
  String get moodCreative => 'படைப்பாற்றல்';

  @override
  String get quickStart => 'விரைவான தொடக்கம்';

  @override
  String get tileSetGoals => 'இலக்குகள்';

  @override
  String get tileSetGoalsSub => 'முன்னேற்றம் பார்க்க';

  @override
  String get tileExplore => 'ஆராய்ச்சி';

  @override
  String get tileExploreSub => 'உங்களுக்கான தேர்வு';

  @override
  String get tileAlerts => 'அறிவிப்புகள்';

  @override
  String get tileAlertsSub => 'புதுப்பிப்பில் இருங்கள்';

  @override
  String get tileSettings => 'அமைப்புகள்';

  @override
  String get tileSettingsSub => 'அனுபவத்தை தனிப்பயனாக்கவும்';

  @override
  String get beginYourJourney => 'உங்கள் பயணத்தை தொடங்குங்கள்';

  @override
  String get letsGetStarted => 'வாங்க தொடங்கலாம்';

  @override
  String get alreadyHaveAccountSignIn =>
      'ஏற்கனவே கணக்கு உள்ளதா? உள்நுழையுங்கள்';

  @override
  String get personalizeYourExperience => 'உங்கள் அனுபவத்தை தனிப்பயனாக்குங்கள்';

  @override
  String get tapToTellName => 'பெயரைச் சொல்ல தட்டவும்';

  @override
  String get whatShouldWeCallYou => 'நாங்கள் உங்களை என்ன என்று அழைக்கலாம்?';

  @override
  String get enterYourNameHint => 'உங்கள் பெயரை உள்ளிடுங்கள்…';

  @override
  String helloUser(String userName) {
    return 'வணக்கம், $userName! 👋';
  }

  @override
  String get wevePersonalized =>
      'உங்கள் அனுபவத்தை நாங்கள் தனிப்பயனாக்கியுள்ளோம்';

  @override
  String get setBadge => 'அமைக்கப்பட்டது';

  @override
  String get exploreTitle => 'ஆராய்ச்சி';

  @override
  String get exploreSubtitle => 'உங்களுக்கான தேர்ந்தெடுக்கப்பட்ட வாசிப்பு';

  @override
  String get search => 'தேடல்';

  @override
  String get featured => 'சிறப்பு';

  @override
  String get latest => 'புதியது';

  @override
  String articlesCount(int count) {
    return '$count கட்டுரைகள்';
  }

  @override
  String readMinutes(int n) {
    return '$n நிமிடம்';
  }

  @override
  String get readSuffix => ' வாசிப்பு';

  @override
  String byAuthor(String author) {
    return '$author மூலம்';
  }

  @override
  String get categoryAll => 'அனைத்தும்';

  @override
  String get categoryTech => 'தொழில்நுட்பம்';

  @override
  String get categoryDesign => 'வடிவமைப்பு';

  @override
  String get categoryWellness => 'நலன்';

  @override
  String get categoryFinance => 'நிதி';

  @override
  String get categoryScience => 'அறிவியல்';

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
  String get alertsTitle => 'அறிவிப்புகள்';

  @override
  String unreadCountBadge(int count) {
    return '$count படிக்காதவை';
  }

  @override
  String get readAll => 'அனைத்தையும் படிக்கவும்';

  @override
  String get statTotal => 'மொத்தம்';

  @override
  String get statUrgent => 'அவசரம்';

  @override
  String get statUnread => 'படிக்காதவை';

  @override
  String get statSuccess => 'வெற்றி';

  @override
  String get filterAll => 'அனைத்தும்';

  @override
  String get filterUrgent => 'அவசரம்';

  @override
  String get filterUnread => 'படிக்காதவை';

  @override
  String get filterInfo => 'தகவல்';

  @override
  String get allClear => 'எல்லாம் சரி!';

  @override
  String noAlertsForFilter(String filter) {
    return '$filter அறிவிப்புகள் இல்லை';
  }

  @override
  String get dismiss => 'நீக்கு';

  @override
  String get alertTypeUrgent => 'அவசரம்';

  @override
  String get alertTypeInfo => 'தகவல்';

  @override
  String get alertTypeSuccess => 'வெற்றி';

  @override
  String get alertTypeWarning => 'எச்சரிக்கை';

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
  String get time2m => '2 நிமிடங்களுக்கு முன்';

  @override
  String get time18m => '18 நிமிடங்களுக்கு முன்';

  @override
  String get time1h => '1 மணி நேரத்திற்கு முன்';

  @override
  String get time3h => '3 மணி நேரத்திற்கு முன்';

  @override
  String get time5h => '5 மணி நேரத்திற்கு முன்';

  @override
  String get timeYesterday => 'நேற்று';

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get settingsFitness => 'உடற்பயிற்சி';

  @override
  String get settingsStepGoals => 'நடைகள் மற்றும் தூரம்';

  @override
  String get settingsExploreArticles => 'கட்டுரைகள் பார்க்க';

  @override
  String get settingsNotifications => 'அறிவிப்புகள்';

  @override
  String get settingsPush => 'புஷ் அறிவிப்புகள்';

  @override
  String get settingsPushSub => 'அலெர்ட்கள் மற்றும் புதுப்பிப்புகள்';

  @override
  String get settingsEmailDigest => 'மின்னஞ்சல் சுருக்கம்';

  @override
  String get settingsEmailDigestSub => 'வாராந்திர சுருக்கம்';

  @override
  String get settingsGoalReminders => 'இலக்கு நினைவூட்டல்கள்';

  @override
  String get settingsGoalRemindersSub => 'தினசரி நினைவூட்டல்';

  @override
  String get settingsWeeklyReport => 'வாராந்திர அறிக்கை';

  @override
  String get settingsWeeklyReportSub => 'முன்னேற்ற கண்ணோட்டம்';

  @override
  String get settingsAppearance => 'தோற்றம்';

  @override
  String get settingsDarkMode => 'டார்க் மோட்';

  @override
  String get settingsDarkModeSub => 'கண்களுக்கு வசதியானது';

  @override
  String get settingsTheme => 'தீம்';

  @override
  String get settingsLanguage => 'மொழி';

  @override
  String get settingsPrivacy => 'தனியுரிமை மற்றும் தரவு';

  @override
  String get settingsHaptics => 'ஹாப்டிக் பின்னூட்டம்';

  @override
  String get settingsHapticsSub => 'தொட்டு அதிர்வு';

  @override
  String get settingsAnalytics => 'பகுப்பாய்வு';

  @override
  String get settingsAnalyticsSub => 'மேம்படுத்த உதவும்';

  @override
  String get settingsCloudSync => 'கிளவுட் ஒத்திசைவு';

  @override
  String get settingsCloudSyncSub => 'சாதனங்கள் முழுவதும்';

  @override
  String get settingsAccount => 'கணக்கு';

  @override
  String get settingsChangePassword => 'கடவுச்சொல் மாற்றம்';

  @override
  String get settingsSignOut => 'வெளியேறு';

  @override
  String get settingsDeleteAccount => 'கணக்கை நீக்கு';

  @override
  String get settingsProfileTap => 'பெயரை மாற்ற தட்டவும்';

  @override
  String get settingsVersion => 'பதிப்பு 1.0.0 • அன்புடன் உருவாக்கப்பட்டது ❤️';

  @override
  String selectOption(String label) {
    return '$label தேர்ந்தெடுக்கவும்';
  }

  @override
  String get cancel => 'ரத்து';

  @override
  String get save => 'சேமிக்க';

  @override
  String get update => 'புதுப்பிக்க';

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
  String get goalsTitle => 'என் இலக்குகள்';

  @override
  String get goalsWeeklySteps => 'வாராந்திர நடைகள்';

  @override
  String goalsSteps(int count) {
    return '$count நடைகள்';
  }

  @override
  String goalsDistanceKm(String km) {
    return 'தூரம்: $km கிமீ';
  }

  @override
  String goalsStepsLabel(int count) {
    return 'நடைகள்: $count';
  }

  @override
  String goalsDeadline(String date) {
    return 'கடைசி தேதி: $date';
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
  String get weekdayMon => 'திங்கள்';

  @override
  String get weekdayTue => 'செவ்வாய்';

  @override
  String get weekdayWed => 'புதன்';

  @override
  String get weekdayThu => 'வியாழன்';

  @override
  String get weekdayFri => 'வெள்ளி';

  @override
  String get weekdaySat => 'சனி';

  @override
  String get weekdaySun => 'ஞாயிறு';

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
  String get themeSystem => 'சிஸ்டம்';

  @override
  String get themeLight => 'லைட்';

  @override
  String get themeDark => 'டார்க்';

  @override
  String get themeAmoled => 'AMOLED';

  @override
  String get langEnglish => 'ஆங்கிலம்';

  @override
  String get langSpanish => 'Spanish';

  @override
  String get langFrench => 'French';

  @override
  String get langHindi => 'ஹிந்தி';

  @override
  String get langJapanese => 'Japanese';

  @override
  String get settingsProfileDefault => 'Your Profile';
}
