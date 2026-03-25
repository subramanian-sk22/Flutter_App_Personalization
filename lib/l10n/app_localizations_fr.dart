// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Bienvenue personnalisée';

  @override
  String get goodMorning => 'Bonjour';

  @override
  String get goodAfternoon => 'Bon après-midi';

  @override
  String get goodEvening => 'Bonsoir';

  @override
  String welcomeWithName(String name) {
    return 'Bienvenue$name';
  }

  @override
  String get howAreYouFeeling => 'Comment vous sentez-vous aujourd\'hui ?';

  @override
  String get moodInspired => 'Inspiré';

  @override
  String get moodEnergized => 'Énergisé';

  @override
  String get moodCalm => 'Calme';

  @override
  String get moodFocused => 'Concentré';

  @override
  String get moodCreative => 'Créatif';

  @override
  String get quickStart => 'Démarrage rapide';

  @override
  String get tileSetGoals => 'Objectifs';

  @override
  String get tileSetGoalsSub => 'Suivez vos progrès';

  @override
  String get tileExplore => 'Explorer';

  @override
  String get tileExploreSub => 'Sélectionné pour vous';

  @override
  String get tileAlerts => 'Alertes';

  @override
  String get tileAlertsSub => 'Restez informé';

  @override
  String get tileSettings => 'Paramètres';

  @override
  String get tileSettingsSub => 'Personnaliser';

  @override
  String get beginYourJourney => 'Commencer le voyage';

  @override
  String get letsGetStarted => 'C\'est parti';

  @override
  String get alreadyHaveAccountSignIn => 'Déjà un compte ? Connexion';

  @override
  String get personalizeYourExperience => 'Personnalisez votre expérience';

  @override
  String get tapToTellName => 'Appuyez pour nous dire votre nom';

  @override
  String get whatShouldWeCallYou => 'Comment vous appeler ?';

  @override
  String get enterYourNameHint => 'Entrez votre nom…';

  @override
  String helloUser(String userName) {
    return 'Bonjour, $userName ! 👋';
  }

  @override
  String get wevePersonalized => 'Nous avons personnalisé votre expérience';

  @override
  String get setBadge => 'OK';

  @override
  String get exploreTitle => 'Explorer';

  @override
  String get exploreSubtitle => 'Lectures sélectionnées pour vous';

  @override
  String get search => 'Rechercher';

  @override
  String get featured => 'À la une';

  @override
  String get latest => 'Récent';

  @override
  String articlesCount(int count) {
    return '$count articles';
  }

  @override
  String readMinutes(int n) {
    return '$n min';
  }

  @override
  String get readSuffix => ' de lecture';

  @override
  String byAuthor(String author) {
    return 'par $author';
  }

  @override
  String get categoryAll => 'Tous';

  @override
  String get categoryTech => 'Tech';

  @override
  String get categoryDesign => 'Design';

  @override
  String get categoryWellness => 'Bien-être';

  @override
  String get categoryFinance => 'Finance';

  @override
  String get categoryScience => 'Science';

  @override
  String get articleHciTitle => 'L\'avenir de l\'interaction homme-machine';

  @override
  String get articleDesignSysTitle =>
      'Les design systems à l\'échelle de votre équipe';

  @override
  String get articleMorningTitle => 'Rituels matinaux des meilleurs';

  @override
  String get articleIndexTitle => 'Fonds indiciels vs gestion active';

  @override
  String get articleNeuralTitle =>
      'Plasticité neuronale et nouvelles compétences';

  @override
  String get articleMicroTitle =>
      'Micro-interactions : petits détails, grand impact';

  @override
  String get articleHabitsTitle => 'Des habitudes qui durent vraiment';

  @override
  String get articleGptTitle => 'GPT-5 et la révolution du raisonnement';

  @override
  String get alertsTitle => 'Alertes';

  @override
  String unreadCountBadge(int count) {
    return '$count non lus';
  }

  @override
  String get readAll => 'Tout lu';

  @override
  String get statTotal => 'Total';

  @override
  String get statUrgent => 'Urgente';

  @override
  String get statUnread => 'Sin leer';

  @override
  String get statSuccess => 'Éxito';

  @override
  String get filterAll => 'Tous';

  @override
  String get filterUrgent => 'Urgent';

  @override
  String get filterUnread => 'Non lus';

  @override
  String get filterInfo => 'Info';

  @override
  String get allClear => 'Tout est clair !';

  @override
  String noAlertsForFilter(String filter) {
    return 'Aucune alerte $filter';
  }

  @override
  String get dismiss => 'Ignorer';

  @override
  String get alertTypeUrgent => 'Urgente';

  @override
  String get alertTypeInfo => 'Info';

  @override
  String get alertTypeSuccess => 'Éxito';

  @override
  String get alertTypeWarning => 'Aviso';

  @override
  String get alertGoalTitle => 'Échéance d\'objectif proche';

  @override
  String get alertGoalBody =>
      'Votre objectif course du mois expire dans 3 jours. Vous êtes à 62 %.';

  @override
  String get alertNewArticleTitle => 'Nouvel article';

  @override
  String get alertNewArticleBody =>
      '« Plasticité neuronale » a été ajouté à votre liste.';

  @override
  String get alertSavingsTitle => 'Objectif d\'épargne atteint !';

  @override
  String get alertSavingsBody =>
      'Vous avez atteint 75 % de votre objectif de 5 000 \$. Bravo !';

  @override
  String get alertWeeklyTitle => 'Rappel hebdomadaire';

  @override
  String get alertWeeklyBody =>
      'Pensez à mettre à jour vos objectifs cette semaine.';

  @override
  String get alertTechTitle => '3 nouveaux articles Tech';

  @override
  String get alertTechBody => 'Des sujets adaptés à vos goûts.';

  @override
  String get alertStreakTitle => 'Série maintenue ! 🔥';

  @override
  String get alertStreakBody => '7 jours d\'affilée. Continuez !';

  @override
  String get alertSyncTitle => 'Échec de synchro';

  @override
  String get alertSyncBody =>
      'Impossible de synchroniser. Touchez pour réessayer.';

  @override
  String get time2m => 'il y a 2 min';

  @override
  String get time18m => 'il y a 18 min';

  @override
  String get time1h => 'il y a 1 h';

  @override
  String get time3h => 'il y a 3 h';

  @override
  String get time5h => 'il y a 5 h';

  @override
  String get timeYesterday => 'Hier';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsFitness => 'Fitness';

  @override
  String get settingsStepGoals => 'Pas et distance';

  @override
  String get settingsExploreArticles => 'Articles';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsPush => 'Notifications push';

  @override
  String get settingsPushSub => 'Alertes et nouveautés';

  @override
  String get settingsEmailDigest => 'Résumé e-mail';

  @override
  String get settingsEmailDigestSub => 'Résumé hebdomadaire';

  @override
  String get settingsGoalReminders => 'Rappels d\'objectifs';

  @override
  String get settingsGoalRemindersSub => 'Petits rappels quotidiens';

  @override
  String get settingsWeeklyReport => 'Rapport hebdo';

  @override
  String get settingsWeeklyReportSub => 'Vue d\'ensemble';

  @override
  String get settingsAppearance => 'Apparence';

  @override
  String get settingsDarkMode => 'Mode sombre';

  @override
  String get settingsDarkModeSub => 'Plus reposant pour les yeux';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsPrivacy => 'Confidentialité';

  @override
  String get settingsHaptics => 'Retour haptique';

  @override
  String get settingsHapticsSub => 'Vibrations';

  @override
  String get settingsAnalytics => 'Analytique';

  @override
  String get settingsAnalyticsSub => 'Nous aider à améliorer';

  @override
  String get settingsCloudSync => 'Synchro cloud';

  @override
  String get settingsCloudSyncSub => 'Multi-appareils';

  @override
  String get settingsAccount => 'Compte';

  @override
  String get settingsChangePassword => 'Changer le mot de passe';

  @override
  String get settingsSignOut => 'Déconnexion';

  @override
  String get settingsDeleteAccount => 'Supprimer le compte';

  @override
  String get settingsProfileTap => 'Appuyez pour modifier le nom';

  @override
  String get settingsVersion => 'Version 1.0.0 • Fait avec ❤️';

  @override
  String selectOption(String label) {
    return 'Choisir $label';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get update => 'Mettre à jour';

  @override
  String get editProfile => 'Modifier le profil';

  @override
  String get displayName => 'Nom affiché';

  @override
  String get changePassword => 'Mot de passe';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get confirmPassword => 'Confirmer';

  @override
  String get signOutTitle => 'Se déconnecter ?';

  @override
  String get signOutBody => 'Vous devrez vous reconnecter pour votre contenu.';

  @override
  String get signOutAction => 'Déconnexion';

  @override
  String get deleteAccountTitle => 'Supprimer le compte ?';

  @override
  String get deleteAccountBody =>
      'Irréversible. Toutes vos données seront effacées.';

  @override
  String get deleteAction => 'Supprimer';

  @override
  String get toastProfileUpdated => 'Profil mis à jour';

  @override
  String get toastPasswordShort => 'Au moins 8 caractères';

  @override
  String get toastPasswordMismatch => 'Les mots de passe diffèrent';

  @override
  String get toastPasswordUpdated => 'Mot de passe mis à jour';

  @override
  String get toastAccountDeletion => 'Suppression demandée';

  @override
  String get toastDarkOn => 'Mode sombre activé';

  @override
  String get toastDarkOff => 'Mode sombre désactivé';

  @override
  String toastThemeApplied(String name) {
    return 'Tema: $name';
  }

  @override
  String toastLanguageApplied(String name) {
    return 'Idioma: $name';
  }

  @override
  String get goalsTitle => 'Mes objectifs';

  @override
  String get goalsWeeklySteps => 'Pas hebdomadaires';

  @override
  String goalsSteps(int count) {
    return '$count pasos';
  }

  @override
  String goalsDistanceKm(String km) {
    return 'Distancia: $km km';
  }

  @override
  String goalsStepsLabel(int count) {
    return 'Pasos: $count';
  }

  @override
  String goalsDeadline(String date) {
    return 'Fecha límite: $date';
  }

  @override
  String goalsRunMonth(String km) {
    return 'Courir $km km ce mois-ci';
  }

  @override
  String get goalsCategoryFitness => 'Fitness';

  @override
  String get goalsCategorySavings => 'Épargne';

  @override
  String get goalsCategoryReading => 'Lecture';

  @override
  String goalsSavingsMonth(String amount) {
    return 'Épargner $amount ce mois-ci';
  }

  @override
  String goalsReadingMonth(int count) {
    return 'Lire $count livres ce mois-ci';
  }

  @override
  String goalsSavedProgress(int current, int target) {
    return '$current / $target épargnés';
  }

  @override
  String goalsBooksProgress(int read, int total) {
    return '$read sur $total livres';
  }

  @override
  String get weekdayMon => 'Lun';

  @override
  String get weekdayTue => 'Mar';

  @override
  String get weekdayWed => 'Mer';

  @override
  String get weekdayThu => 'Jeu';

  @override
  String get weekdayFri => 'Ven';

  @override
  String get weekdaySat => 'Sam';

  @override
  String get weekdaySun => 'Dim';

  @override
  String get monthJan => 'janv.';

  @override
  String get monthFeb => 'févr.';

  @override
  String get monthMar => 'mar';

  @override
  String get monthApr => 'abr';

  @override
  String get monthMay => 'may';

  @override
  String get monthJun => 'jun';

  @override
  String get monthJul => 'jul';

  @override
  String get monthAug => 'ago';

  @override
  String get monthSep => 'sep';

  @override
  String get monthOct => 'oct';

  @override
  String get monthNov => 'nov';

  @override
  String get monthDec => 'dic';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeAmoled => 'AMOLED';

  @override
  String get langEnglish => 'Anglais';

  @override
  String get langSpanish => 'Espagnol';

  @override
  String get langFrench => 'Français';

  @override
  String get langHindi => 'Hindi';

  @override
  String get langJapanese => 'Japonais';

  @override
  String get settingsProfileDefault => 'Votre profil';
}
