// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Bienvenida personalizada';

  @override
  String get goodMorning => 'Buenos días';

  @override
  String get goodAfternoon => 'Buenas tardes';

  @override
  String get goodEvening => 'Buenas noches';

  @override
  String welcomeWithName(String name) {
    return 'Bienvenido$name';
  }

  @override
  String get howAreYouFeeling => '¿Cómo te sientes hoy?';

  @override
  String get moodInspired => 'Inspirado';

  @override
  String get moodEnergized => 'Con energía';

  @override
  String get moodCalm => 'En calma';

  @override
  String get moodFocused => 'Enfocado';

  @override
  String get moodCreative => 'Creativo';

  @override
  String get quickStart => 'Inicio rápido';

  @override
  String get tileSetGoals => 'Metas';

  @override
  String get tileSetGoalsSub => 'Sigue tu progreso';

  @override
  String get tileExplore => 'Explorar';

  @override
  String get tileExploreSub => 'Selección para ti';

  @override
  String get tileAlerts => 'Alertas';

  @override
  String get tileAlertsSub => 'Mantente al día';

  @override
  String get tileSettings => 'Ajustes';

  @override
  String get tileSettingsSub => 'Personaliza la app';

  @override
  String get beginYourJourney => 'Comienza tu camino';

  @override
  String get letsGetStarted => 'Empecemos';

  @override
  String get alreadyHaveAccountSignIn => '¿Ya tienes cuenta? Inicia sesión';

  @override
  String get personalizeYourExperience => 'Personaliza tu experiencia';

  @override
  String get tapToTellName => 'Toca para decirnos tu nombre';

  @override
  String get whatShouldWeCallYou => '¿Cómo te llamamos?';

  @override
  String get enterYourNameHint => 'Escribe tu nombre…';

  @override
  String helloUser(String userName) {
    return '¡Hola, $userName! 👋';
  }

  @override
  String get wevePersonalized => 'Hemos personalizado tu experiencia';

  @override
  String get setBadge => 'Listo';

  @override
  String get exploreTitle => 'Explorar';

  @override
  String get exploreSubtitle => 'Lecturas seleccionadas para ti';

  @override
  String get search => 'Buscar';

  @override
  String get featured => 'Destacados';

  @override
  String get latest => 'Recientes';

  @override
  String articlesCount(int count) {
    return '$count artículos';
  }

  @override
  String readMinutes(int n) {
    return '$n min';
  }

  @override
  String get readSuffix => ' de lectura';

  @override
  String byAuthor(String author) {
    return 'por $author';
  }

  @override
  String get categoryAll => 'Todos';

  @override
  String get categoryTech => 'Tecnología';

  @override
  String get categoryDesign => 'Diseño';

  @override
  String get categoryWellness => 'Bienestar';

  @override
  String get categoryFinance => 'Finanzas';

  @override
  String get categoryScience => 'Ciencia';

  @override
  String get articleHciTitle =>
      'El futuro de la interacción humano-computadora';

  @override
  String get articleDesignSysTitle =>
      'Sistemas de diseño que escalan con tu equipo';

  @override
  String get articleMorningTitle => 'Rituales matutinos de alto rendimiento';

  @override
  String get articleIndexTitle =>
      'Fondos indexados vs gestión activa de cartera';

  @override
  String get articleNeuralTitle =>
      'Plasticidad neural y aprendizaje de nuevas habilidades';

  @override
  String get articleMicroTitle =>
      'Microinteracciones: pequeños detalles, gran impacto';

  @override
  String get articleHabitsTitle => 'Crear hábitos que realmente perduran';

  @override
  String get articleGptTitle => 'GPT-5 y la revolución del razonamiento';

  @override
  String get alertsTitle => 'Alertas';

  @override
  String unreadCountBadge(int count) {
    return '$count sin leer';
  }

  @override
  String get readAll => 'Marcar leídas';

  @override
  String get statTotal => 'Total';

  @override
  String get statUrgent => 'Urgente';

  @override
  String get statUnread => 'Sin leer';

  @override
  String get statSuccess => 'Éxito';

  @override
  String get filterAll => 'Todas';

  @override
  String get filterUrgent => 'Urgentes';

  @override
  String get filterUnread => 'Sin leer';

  @override
  String get filterInfo => 'Info';

  @override
  String get allClear => '¡Todo listo!';

  @override
  String noAlertsForFilter(String filter) {
    return 'No hay alertas de $filter';
  }

  @override
  String get dismiss => 'Descartar';

  @override
  String get alertTypeUrgent => 'Urgente';

  @override
  String get alertTypeInfo => 'Info';

  @override
  String get alertTypeSuccess => 'Éxito';

  @override
  String get alertTypeWarning => 'Aviso';

  @override
  String get alertGoalTitle => 'La meta se acerca';

  @override
  String get alertGoalBody =>
      'Tu meta de running del mes vence en 3 días. Vas al 62%.';

  @override
  String get alertNewArticleTitle => 'Nuevo artículo';

  @override
  String get alertNewArticleBody =>
      '«Plasticidad neural y aprendizaje» se ha añadido a tu lista.';

  @override
  String get alertSavingsTitle => '¡Hito de ahorro!';

  @override
  String get alertSavingsBody =>
      'Has alcanzado el 75% de tu meta de ahorro de 5.000 \$. ¡Genial!';

  @override
  String get alertWeeklyTitle => 'Recordatorio semanal';

  @override
  String get alertWeeklyBody =>
      'No olvides actualizar el progreso de tus metas esta semana.';

  @override
  String get alertTechTitle => '3 artículos nuevos en Tecnología';

  @override
  String get alertTechBody => 'Hemos seleccionado temas según tus intereses.';

  @override
  String get alertStreakTitle => '¡Racha mantenida! 🔥';

  @override
  String get alertStreakBody => 'Llevas 7 días seguidos. ¡Sigue así!';

  @override
  String get alertSyncTitle => 'Error al sincronizar ajustes';

  @override
  String get alertSyncBody =>
      'No se pudieron sincronizar tus preferencias. Toca para reintentar.';

  @override
  String get time2m => 'hace 2 min';

  @override
  String get time18m => 'hace 18 min';

  @override
  String get time1h => 'hace 1 h';

  @override
  String get time3h => 'hace 3 h';

  @override
  String get time5h => 'hace 5 h';

  @override
  String get timeYesterday => 'Ayer';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsFitness => 'Fitness';

  @override
  String get settingsStepGoals => 'Pasos y distancia';

  @override
  String get settingsExploreArticles => 'Explorar artículos';

  @override
  String get settingsNotifications => 'Notificaciones';

  @override
  String get settingsPush => 'Notificaciones push';

  @override
  String get settingsPushSub => 'Avisos y novedades';

  @override
  String get settingsEmailDigest => 'Resumen por correo';

  @override
  String get settingsEmailDigestSub => 'Resumen semanal';

  @override
  String get settingsGoalReminders => 'Recordatorios de metas';

  @override
  String get settingsGoalRemindersSub => 'Pequeños empujones diarios';

  @override
  String get settingsWeeklyReport => 'Informe semanal';

  @override
  String get settingsWeeklyReportSub => 'Resumen de progreso';

  @override
  String get settingsAppearance => 'Apariencia';

  @override
  String get settingsDarkMode => 'Modo oscuro';

  @override
  String get settingsDarkModeSub => 'Más cómodo para la vista';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsPrivacy => 'Privacidad y datos';

  @override
  String get settingsHaptics => 'Respuesta háptica';

  @override
  String get settingsHapticsSub => 'Vibración al tocar';

  @override
  String get settingsAnalytics => 'Analíticas';

  @override
  String get settingsAnalyticsSub => 'Ayúdanos a mejorar';

  @override
  String get settingsCloudSync => 'Sincronización en la nube';

  @override
  String get settingsCloudSyncSub => 'Entre dispositivos';

  @override
  String get settingsAccount => 'Cuenta';

  @override
  String get settingsChangePassword => 'Cambiar contraseña';

  @override
  String get settingsSignOut => 'Cerrar sesión';

  @override
  String get settingsDeleteAccount => 'Eliminar cuenta';

  @override
  String get settingsProfileTap => 'Toca para editar el nombre';

  @override
  String get settingsVersion => 'Versión 1.0.0 • Hecho con ❤️';

  @override
  String selectOption(String label) {
    return 'Seleccionar $label';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get update => 'Actualizar';

  @override
  String get editProfile => 'Editar perfil';

  @override
  String get displayName => 'Nombre para mostrar';

  @override
  String get changePassword => 'Cambiar contraseña';

  @override
  String get newPassword => 'Nueva contraseña';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get signOutTitle => '¿Cerrar sesión?';

  @override
  String get signOutBody =>
      'Tendrás que volver a entrar para ver tu contenido personalizado.';

  @override
  String get signOutAction => 'Cerrar sesión';

  @override
  String get deleteAccountTitle => '¿Eliminar cuenta?';

  @override
  String get deleteAccountBody =>
      'No se puede deshacer. Se borrarán todos tus datos.';

  @override
  String get deleteAction => 'Eliminar';

  @override
  String get toastProfileUpdated => 'Perfil actualizado';

  @override
  String get toastPasswordShort =>
      'La contraseña debe tener al menos 8 caracteres';

  @override
  String get toastPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get toastPasswordUpdated => 'Contraseña actualizada';

  @override
  String get toastAccountDeletion => 'Solicitud de borrado enviada';

  @override
  String get toastDarkOn => 'Modo oscuro activado';

  @override
  String get toastDarkOff => 'Modo oscuro desactivado';

  @override
  String toastThemeApplied(String name) {
    return 'Tema: $name';
  }

  @override
  String toastLanguageApplied(String name) {
    return 'Idioma: $name';
  }

  @override
  String get goalsTitle => 'Mis metas';

  @override
  String get goalsWeeklySteps => 'Pasos semanales';

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
    return 'Correr $km km este mes';
  }

  @override
  String get goalsCategoryFitness => 'Fitness';

  @override
  String get goalsCategorySavings => 'Ahorro';

  @override
  String get goalsCategoryReading => 'Lectura';

  @override
  String goalsSavingsMonth(String amount) {
    return 'Ahorra $amount este mes';
  }

  @override
  String goalsReadingMonth(int count) {
    return 'Lee $count libros este mes';
  }

  @override
  String goalsSavedProgress(int current, int target) {
    return '$current / $target ahorrados';
  }

  @override
  String goalsBooksProgress(int read, int total) {
    return '$read de $total libros';
  }

  @override
  String get weekdayMon => 'Lun';

  @override
  String get weekdayTue => 'Mar';

  @override
  String get weekdayWed => 'Mié';

  @override
  String get weekdayThu => 'Jue';

  @override
  String get weekdayFri => 'Vie';

  @override
  String get weekdaySat => 'Sáb';

  @override
  String get weekdaySun => 'Dom';

  @override
  String get monthJan => 'ene';

  @override
  String get monthFeb => 'feb';

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
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeAmoled => 'AMOLED';

  @override
  String get langEnglish => 'Inglés';

  @override
  String get langSpanish => 'Español';

  @override
  String get langFrench => 'Francés';

  @override
  String get langHindi => 'Hindi';

  @override
  String get langJapanese => 'Japonés';

  @override
  String get settingsProfileDefault => 'Tu perfil';
}
