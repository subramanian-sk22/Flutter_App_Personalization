// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'パーソナライズへようこそ';

  @override
  String get goodMorning => 'おはようございます';

  @override
  String get goodAfternoon => 'こんにちは';

  @override
  String get goodEvening => 'こんばんは';

  @override
  String welcomeWithName(String name) {
    return 'ようこそ$name';
  }

  @override
  String get howAreYouFeeling => '今日の気分は？';

  @override
  String get moodInspired => 'やる気';

  @override
  String get moodEnergized => '元気';

  @override
  String get moodCalm => '落ち着き';

  @override
  String get moodFocused => '集中';

  @override
  String get moodCreative => '創造的';

  @override
  String get quickStart => 'クイックスタート';

  @override
  String get tileSetGoals => '目標';

  @override
  String get tileSetGoalsSub => '進捗を追う';

  @override
  String get tileExplore => '探索';

  @override
  String get tileExploreSub => 'あなた向けの記事';

  @override
  String get tileAlerts => '通知';

  @override
  String get tileAlertsSub => '最新情報';

  @override
  String get tileSettings => '設定';

  @override
  String get tileSettingsSub => 'カスタマイズ';

  @override
  String get beginYourJourney => '旅を始める';

  @override
  String get letsGetStarted => 'はじめましょう';

  @override
  String get alreadyHaveAccountSignIn => 'アカウントをお持ちですか？サインイン';

  @override
  String get personalizeYourExperience => '体験をパーソナライズ';

  @override
  String get tapToTellName => 'タップしてお名前を';

  @override
  String get whatShouldWeCallYou => 'お名前は？';

  @override
  String get enterYourNameHint => 'お名前を入力…';

  @override
  String helloUser(String userName) {
    return 'こんにちは、$userNameさん！ 👋';
  }

  @override
  String get wevePersonalized => '体験をパーソナライズしました';

  @override
  String get setBadge => '設定済';

  @override
  String get exploreTitle => '探索';

  @override
  String get exploreSubtitle => 'あなた向けの読み物';

  @override
  String get search => '検索';

  @override
  String get featured => '特集';

  @override
  String get latest => '新着';

  @override
  String articlesCount(int count) {
    return '$count件の記事';
  }

  @override
  String readMinutes(int n) {
    return '$n min';
  }

  @override
  String get readSuffix => 'で読了';

  @override
  String byAuthor(String author) {
    return '$author作';
  }

  @override
  String get categoryAll => 'すべて';

  @override
  String get categoryTech => 'テック';

  @override
  String get categoryDesign => 'デザイン';

  @override
  String get categoryWellness => 'ウェルネス';

  @override
  String get categoryFinance => 'ファイナンス';

  @override
  String get categoryScience => 'サイエンス';

  @override
  String get articleHciTitle => 'ヒューマン・コンピュータ・インタラクションの未来';

  @override
  String get articleDesignSysTitle => 'チームと伸びるデザインシステム';

  @override
  String get articleMorningTitle => 'ハイパフォーマーの朝の習慣';

  @override
  String get articleIndexTitle => 'インデックスファンドとアクティブ運用';

  @override
  String get articleNeuralTitle => '神経可塑性と新しいスキル';

  @override
  String get articleMicroTitle => 'マイクロインタラクション：小さな詳細、大きな効果';

  @override
  String get articleHabitsTitle => '続く習慣の作り方';

  @override
  String get articleGptTitle => 'GPT-5と推論革命';

  @override
  String get alertsTitle => '通知';

  @override
  String unreadCountBadge(int count) {
    return '未読 $count';
  }

  @override
  String get readAll => 'すべて既読';

  @override
  String get statTotal => '合計';

  @override
  String get statUrgent => '緊急';

  @override
  String get statUnread => '未読';

  @override
  String get statSuccess => '成功';

  @override
  String get filterAll => 'すべて';

  @override
  String get filterUrgent => '緊急';

  @override
  String get filterUnread => '未読';

  @override
  String get filterInfo => '情報';

  @override
  String get allClear => 'すべて完了！';

  @override
  String noAlertsForFilter(String filter) {
    return '$filterの通知はありません';
  }

  @override
  String get dismiss => '閉じる';

  @override
  String get alertTypeUrgent => '緊急';

  @override
  String get alertTypeInfo => '情報';

  @override
  String get alertTypeSuccess => '成功';

  @override
  String get alertTypeWarning => '注意';

  @override
  String get alertGoalTitle => '目標の期限が迫っています';

  @override
  String get alertGoalBody => '今月のランニング目標まであと3日。62%です。';

  @override
  String get alertNewArticleTitle => '新着記事';

  @override
  String get alertNewArticleBody => '「神経可塑性」がリストに追加されました。';

  @override
  String get alertSavingsTitle => '貯蓄のマイルストーン！';

  @override
  String get alertSavingsBody => '5000ドル目標の75%達成。おめでとう！';

  @override
  String get alertWeeklyTitle => '週次リマインダー';

  @override
  String get alertWeeklyBody => '今週の目標進捗を更新してください。';

  @override
  String get alertTechTitle => 'テック新着記事3件';

  @override
  String get alertTechBody => '興味に合わせたトピックを選びました。';

  @override
  String get alertStreakTitle => '連続記録継続！ 🔥';

  @override
  String get alertStreakBody => '7日連続です。この調子！';

  @override
  String get alertSyncTitle => '設定の同期に失敗';

  @override
  String get alertSyncBody => '設定を同期できませんでした。タップして再試行。';

  @override
  String get time2m => '2分前';

  @override
  String get time18m => '18分前';

  @override
  String get time1h => '1時間前';

  @override
  String get time3h => '3時間前';

  @override
  String get time5h => '5時間前';

  @override
  String get timeYesterday => '昨日';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsFitness => 'フィットネス';

  @override
  String get settingsStepGoals => '歩数と距離';

  @override
  String get settingsExploreArticles => '記事を探索';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsPush => 'プッシュ通知';

  @override
  String get settingsPushSub => 'アラートと更新';

  @override
  String get settingsEmailDigest => 'メールダイジェスト';

  @override
  String get settingsEmailDigestSub => '週次サマリー';

  @override
  String get settingsGoalReminders => '目標リマインダー';

  @override
  String get settingsGoalRemindersSub => '毎日のひと押し';

  @override
  String get settingsWeeklyReport => '週次レポート';

  @override
  String get settingsWeeklyReportSub => '進捗の概要';

  @override
  String get settingsAppearance => '外観';

  @override
  String get settingsDarkMode => 'ダークモード';

  @override
  String get settingsDarkModeSub => '目に優しい';

  @override
  String get settingsTheme => 'テーマ';

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsPrivacy => 'プライバシーとデータ';

  @override
  String get settingsHaptics => '触覚フィードバック';

  @override
  String get settingsHapticsSub => 'バイブレーション';

  @override
  String get settingsAnalytics => '分析';

  @override
  String get settingsAnalyticsSub => '改善のお手伝い';

  @override
  String get settingsCloudSync => 'クラウド同期';

  @override
  String get settingsCloudSyncSub => '端末間';

  @override
  String get settingsAccount => 'アカウント';

  @override
  String get settingsChangePassword => 'パスワード変更';

  @override
  String get settingsSignOut => 'サインアウト';

  @override
  String get settingsDeleteAccount => 'アカウント削除';

  @override
  String get settingsProfileTap => 'タップして表示名を編集';

  @override
  String get settingsVersion => 'バージョン 1.0.0 • ❤️を込めて';

  @override
  String selectOption(String label) {
    return '$labelを選択';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get update => '更新';

  @override
  String get editProfile => 'プロフィール編集';

  @override
  String get displayName => '表示名';

  @override
  String get changePassword => 'パスワード変更';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get confirmPassword => '確認';

  @override
  String get signOutTitle => 'サインアウトしますか？';

  @override
  String get signOutBody => 'パーソナライズされたコンテンツには再度サインインが必要です。';

  @override
  String get signOutAction => 'サインアウト';

  @override
  String get deleteAccountTitle => 'アカウントを削除しますか？';

  @override
  String get deleteAccountBody => '元に戻せません。データはすべて削除されます。';

  @override
  String get deleteAction => '削除';

  @override
  String get toastProfileUpdated => 'プロフィールを更新しました';

  @override
  String get toastPasswordShort => '8文字以上必要です';

  @override
  String get toastPasswordMismatch => 'パスワードが一致しません';

  @override
  String get toastPasswordUpdated => 'パスワードを更新しました';

  @override
  String get toastAccountDeletion => '削除リクエストを送信しました';

  @override
  String get toastDarkOn => 'ダークモードオン';

  @override
  String get toastDarkOff => 'ダークモードオフ';

  @override
  String toastThemeApplied(String name) {
    return 'テーマ: $name';
  }

  @override
  String toastLanguageApplied(String name) {
    return '言語: $name';
  }

  @override
  String get goalsTitle => 'マイ目標';

  @override
  String get goalsWeeklySteps => '週間の歩数';

  @override
  String goalsSteps(int count) {
    return '$count 歩';
  }

  @override
  String goalsDistanceKm(String km) {
    return '距離: $km km';
  }

  @override
  String goalsStepsLabel(int count) {
    return '歩数: $count';
  }

  @override
  String goalsDeadline(String date) {
    return '期限: $date';
  }

  @override
  String goalsRunMonth(String km) {
    return '今月 $km km 走る';
  }

  @override
  String get goalsCategoryFitness => 'フィットネス';

  @override
  String get goalsCategorySavings => '貯蓄';

  @override
  String get goalsCategoryReading => '読書';

  @override
  String goalsSavingsMonth(String amount) {
    return '今月 $amount 貯める';
  }

  @override
  String goalsReadingMonth(int count) {
    return '今月 $count 冊読む';
  }

  @override
  String goalsSavedProgress(int current, int target) {
    return '$current / $target 貯蓄';
  }

  @override
  String goalsBooksProgress(int read, int total) {
    return '$total 冊中 $read 冊';
  }

  @override
  String get weekdayMon => '月';

  @override
  String get weekdayTue => '火';

  @override
  String get weekdayWed => '水';

  @override
  String get weekdayThu => '木';

  @override
  String get weekdayFri => '金';

  @override
  String get weekdaySat => '土';

  @override
  String get weekdaySun => '日';

  @override
  String get monthJan => '1月';

  @override
  String get monthFeb => '2月';

  @override
  String get monthMar => '3月';

  @override
  String get monthApr => '4月';

  @override
  String get monthMay => '5月';

  @override
  String get monthJun => '6月';

  @override
  String get monthJul => '7月';

  @override
  String get monthAug => '8月';

  @override
  String get monthSep => '9月';

  @override
  String get monthOct => '10月';

  @override
  String get monthNov => '11月';

  @override
  String get monthDec => '12月';

  @override
  String get themeSystem => 'システム';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeAmoled => 'AMOLED';

  @override
  String get langEnglish => '英語';

  @override
  String get langSpanish => 'スペイン語';

  @override
  String get langFrench => 'フランス語';

  @override
  String get langHindi => 'ヒンディー語';

  @override
  String get langJapanese => '日本語';

  @override
  String get settingsProfileDefault => 'プロフィール';
}
