// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'व्यक्तिगत स्वागत';

  @override
  String get goodMorning => 'सुप्रभात';

  @override
  String get goodAfternoon => 'नमस्कार';

  @override
  String get goodEvening => 'शुभ संध्या';

  @override
  String welcomeWithName(String name) {
    return 'स्वागत है$name';
  }

  @override
  String get howAreYouFeeling => 'आज आप कैसा महसूस कर रहे हैं?';

  @override
  String get moodInspired => 'प्रेरित';

  @override
  String get moodEnergized => 'ऊर्जावान';

  @override
  String get moodCalm => 'शांत';

  @override
  String get moodFocused => 'केंद्रित';

  @override
  String get moodCreative => 'रचनात्मक';

  @override
  String get quickStart => 'त्वरित शुरुआत';

  @override
  String get tileSetGoals => 'लक्ष्य';

  @override
  String get tileSetGoalsSub => 'प्रगति देखें';

  @override
  String get tileExplore => 'अन्वेषण';

  @override
  String get tileExploreSub => 'आपके लिए चयनित';

  @override
  String get tileAlerts => 'सूचनाएँ';

  @override
  String get tileAlertsSub => 'अपडेट रहें';

  @override
  String get tileSettings => 'सेटिंग्स';

  @override
  String get tileSettingsSub => 'अनुभव अनुकूलित करें';

  @override
  String get beginYourJourney => 'यात्रा शुरू करें';

  @override
  String get letsGetStarted => 'चलिए शुरू करें';

  @override
  String get alreadyHaveAccountSignIn => 'पहले से खाता है? साइन इन करें';

  @override
  String get personalizeYourExperience => 'अनुभव को व्यक्तिगत बनाएँ';

  @override
  String get tapToTellName => 'नाम बताने के लिए टैप करें';

  @override
  String get whatShouldWeCallYou => 'हम आपको क्या कहें?';

  @override
  String get enterYourNameHint => 'अपना नाम लिखें…';

  @override
  String helloUser(String userName) {
    return 'नमस्ते, $userName! 👋';
  }

  @override
  String get wevePersonalized => 'हमने आपका अनुभव व्यक्तिगत किया';

  @override
  String get setBadge => 'सेट';

  @override
  String get exploreTitle => 'अन्वेषण';

  @override
  String get exploreSubtitle => 'आपके लिए चयनित पठन';

  @override
  String get search => 'खोजें';

  @override
  String get featured => 'विशेष';

  @override
  String get latest => 'नवीनतम';

  @override
  String articlesCount(int count) {
    return '$count लेख';
  }

  @override
  String readMinutes(int n) {
    return '$n min';
  }

  @override
  String get readSuffix => ' पठन';

  @override
  String byAuthor(String author) {
    return '$author द्वारा';
  }

  @override
  String get categoryAll => 'सभी';

  @override
  String get categoryTech => 'टेक';

  @override
  String get categoryDesign => 'डिज़ाइन';

  @override
  String get categoryWellness => 'कल्याण';

  @override
  String get categoryFinance => 'वित्त';

  @override
  String get categoryScience => 'विज्ञान';

  @override
  String get articleHciTitle => 'मानव-कंप्यूटर इंटरैक्शन का भविष्य';

  @override
  String get articleDesignSysTitle => 'डिज़ाइन सिस्टम जो आपकी टीम के साथ बढ़ें';

  @override
  String get articleMorningTitle => 'उच्च प्रदर्शनकर्ताओं की सुबह की रीतें';

  @override
  String get articleIndexTitle => 'इंडेक्स फंड बनाम सक्रिय पोर्टफोलियो';

  @override
  String get articleNeuralTitle => 'तंत्रिका लचीलापन और नए कौशल';

  @override
  String get articleMicroTitle => 'माइक्रो-इंटरैक्शन: छोटे विवरण, बड़ा प्रभाव';

  @override
  String get articleHabitsTitle => 'वास्तव में टिकाऊ आदतें';

  @override
  String get articleGptTitle => 'GPT-5 और तर्क क्रांति';

  @override
  String get alertsTitle => 'सूचनाएँ';

  @override
  String unreadCountBadge(int count) {
    return '$count अपठित';
  }

  @override
  String get readAll => 'सभी पढ़ लें';

  @override
  String get statTotal => 'कुल';

  @override
  String get statUrgent => 'जरूरी';

  @override
  String get statUnread => 'अपठित';

  @override
  String get statSuccess => 'सफलता';

  @override
  String get filterAll => 'सभी';

  @override
  String get filterUrgent => 'जरूरी';

  @override
  String get filterUnread => 'अपठित';

  @override
  String get filterInfo => 'जानकारी';

  @override
  String get allClear => 'सब साफ!';

  @override
  String noAlertsForFilter(String filter) {
    return 'कोई $filter अलर्ट नहीं';
  }

  @override
  String get dismiss => 'खारिज';

  @override
  String get alertTypeUrgent => 'जरूरी';

  @override
  String get alertTypeInfo => 'जानकारी';

  @override
  String get alertTypeSuccess => 'सफलता';

  @override
  String get alertTypeWarning => 'चेतावनी';

  @override
  String get alertGoalTitle => 'लक्ष्य की समय सीमा नज़दीक';

  @override
  String get alertGoalBody =>
      'आपका मासिक दौड़ लक्ष्य 3 दिन में समाप्त। 62% पर हैं।';

  @override
  String get alertNewArticleTitle => 'नया लेख';

  @override
  String get alertNewArticleBody =>
      '«तंत्रिका लचीलापन» आपकी सूची में जोड़ा गया।';

  @override
  String get alertSavingsTitle => 'बचत की उपलब्धि!';

  @override
  String get alertSavingsBody => 'आपने \$5,000 लक्ष्य का 75% पूरा किया। शाबाश!';

  @override
  String get alertWeeklyTitle => 'साप्ताहिक याद दिलाना';

  @override
  String get alertWeeklyBody => 'इस सप्ताह अपनी प्रगति अपडेट करें।';

  @override
  String get alertTechTitle => 'टेक में 3 नए लेख';

  @override
  String get alertTechBody => 'आपकी रुचियों के अनुसार चयनित विषय।';

  @override
  String get alertStreakTitle => 'सिलसिला जारी! 🔥';

  @override
  String get alertStreakBody => 'लगातार 7 दिन। जारी रखें!';

  @override
  String get alertSyncTitle => 'सिंक विफल';

  @override
  String get alertSyncBody => 'प्राथमिकताएँ सिंक नहीं हुईं। पुनः प्रयास करें।';

  @override
  String get time2m => '2 मि पहले';

  @override
  String get time18m => '18 मि पहले';

  @override
  String get time1h => '1 घं पहले';

  @override
  String get time3h => '3 घं पहले';

  @override
  String get time5h => '5 घं पहले';

  @override
  String get timeYesterday => 'कल';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsFitness => 'फिटनेस';

  @override
  String get settingsStepGoals => 'कदम और दूरी';

  @override
  String get settingsExploreArticles => 'लेख देखें';

  @override
  String get settingsNotifications => 'सूचनाएँ';

  @override
  String get settingsPush => 'पुश सूचनाएँ';

  @override
  String get settingsPushSub => 'अलर्ट और अपडेट';

  @override
  String get settingsEmailDigest => 'ईमेल सारांश';

  @override
  String get settingsEmailDigestSub => 'साप्ताहिक सारांश';

  @override
  String get settingsGoalReminders => 'लक्ष्य अनुस्मारक';

  @override
  String get settingsGoalRemindersSub => 'दैनिक संकेत';

  @override
  String get settingsWeeklyReport => 'साप्ताहिक रिपोर्ट';

  @override
  String get settingsWeeklyReportSub => 'प्रगति अवलोकन';

  @override
  String get settingsAppearance => 'दिखावट';

  @override
  String get settingsDarkMode => 'डार्क मोड';

  @override
  String get settingsDarkModeSub => 'आँखों के लिए आरामदायक';

  @override
  String get settingsTheme => 'थीम';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsPrivacy => 'गोपनीयता और डेटा';

  @override
  String get settingsHaptics => 'हैप्टिक प्रतिक्रिया';

  @override
  String get settingsHapticsSub => 'स्पर्श कंपन';

  @override
  String get settingsAnalytics => 'विश्लेषण';

  @override
  String get settingsAnalyticsSub => 'सुधार में मदद';

  @override
  String get settingsCloudSync => 'क्लाउड सिंक';

  @override
  String get settingsCloudSyncSub => 'डिवाइसों में';

  @override
  String get settingsAccount => 'खाता';

  @override
  String get settingsChangePassword => 'पासवर्ड बदलें';

  @override
  String get settingsSignOut => 'साइन आउट';

  @override
  String get settingsDeleteAccount => 'खाता हटाएँ';

  @override
  String get settingsProfileTap => 'नाम संपादित करने के लिए टैप करें';

  @override
  String get settingsVersion => 'संस्करण 1.0.0 • प्यार से बना ❤️';

  @override
  String selectOption(String label) {
    return '$label चुनें';
  }

  @override
  String get cancel => 'रद्द';

  @override
  String get save => 'सहेजें';

  @override
  String get update => 'अपडेट';

  @override
  String get editProfile => 'प्रोफाइल संपादित करें';

  @override
  String get displayName => 'प्रदर्शन नाम';

  @override
  String get changePassword => 'पासवर्ड बदलें';

  @override
  String get newPassword => 'नया पासवर्ड';

  @override
  String get confirmPassword => 'पुष्टि करें';

  @override
  String get signOutTitle => 'साइन आउट?';

  @override
  String get signOutBody => 'व्यक्तिगत सामग्री के लिए फिर साइन इन करना होगा।';

  @override
  String get signOutAction => 'साइन आउट';

  @override
  String get deleteAccountTitle => 'खाता हटाएँ?';

  @override
  String get deleteAccountBody => 'पूर्ववत नहीं। सारा डेटा मिट जाएगा।';

  @override
  String get deleteAction => 'हटाएँ';

  @override
  String get toastProfileUpdated => 'प्रोफाइल अपडेट';

  @override
  String get toastPasswordShort => 'कम से कम 8 अक्षर';

  @override
  String get toastPasswordMismatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get toastPasswordUpdated => 'पासवर्ड अपडेट';

  @override
  String get toastAccountDeletion => 'हटाने का अनुरोध भेजा';

  @override
  String get toastDarkOn => 'डार्क मोड चालू';

  @override
  String get toastDarkOff => 'डार्क मोड बंद';

  @override
  String toastThemeApplied(String name) {
    return 'थीम: $name';
  }

  @override
  String toastLanguageApplied(String name) {
    return 'भाषा: $name';
  }

  @override
  String get goalsTitle => 'मेरे लक्ष्य';

  @override
  String get goalsWeeklySteps => 'साप्ताहिक कदम';

  @override
  String goalsSteps(int count) {
    return '$count कदम';
  }

  @override
  String goalsDistanceKm(String km) {
    return 'दूरी: $km किमी';
  }

  @override
  String goalsStepsLabel(int count) {
    return 'कदम: $count';
  }

  @override
  String goalsDeadline(String date) {
    return 'अंतिम तिथि: $date';
  }

  @override
  String goalsRunMonth(String km) {
    return 'इस महीने $km किमी दौड़';
  }

  @override
  String get goalsCategoryFitness => 'फिटनेस';

  @override
  String get goalsCategorySavings => 'बचत';

  @override
  String get goalsCategoryReading => 'पठन';

  @override
  String goalsSavingsMonth(String amount) {
    return 'इस महीने $amount बचाएँ';
  }

  @override
  String goalsReadingMonth(int count) {
    return 'इस महीने $count किताबें पढ़ें';
  }

  @override
  String goalsSavedProgress(int current, int target) {
    return '$current / $target बचत';
  }

  @override
  String goalsBooksProgress(int read, int total) {
    return '$total में से $read किताबें';
  }

  @override
  String get weekdayMon => 'सोम';

  @override
  String get weekdayTue => 'मंगल';

  @override
  String get weekdayWed => 'बुध';

  @override
  String get weekdayThu => 'गुरु';

  @override
  String get weekdayFri => 'शुक्र';

  @override
  String get weekdaySat => 'शनि';

  @override
  String get weekdaySun => 'रवि';

  @override
  String get monthJan => 'जन';

  @override
  String get monthFeb => 'फ़र';

  @override
  String get monthMar => 'मार्च';

  @override
  String get monthApr => 'अप्रै';

  @override
  String get monthMay => 'मई';

  @override
  String get monthJun => 'जून';

  @override
  String get monthJul => 'जुल';

  @override
  String get monthAug => 'अग';

  @override
  String get monthSep => 'सित';

  @override
  String get monthOct => 'अक्टू';

  @override
  String get monthNov => 'नव';

  @override
  String get monthDec => 'दिस';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'हल्का';

  @override
  String get themeDark => 'डार्क';

  @override
  String get themeAmoled => 'AMOLED';

  @override
  String get langEnglish => 'अंग्रेज़ी';

  @override
  String get langSpanish => 'स्पेनिश';

  @override
  String get langFrench => 'फ़्रेंच';

  @override
  String get langHindi => 'हिन्दी';

  @override
  String get langJapanese => 'जापानी';

  @override
  String get settingsProfileDefault => 'आपकी प्रोफाइल';
}
