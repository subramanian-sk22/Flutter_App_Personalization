import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global appearance & language; persisted and listened to by [MaterialApp].
final appPreferences = AppPreferencesController();

class AppPreferencesController extends ChangeNotifier {
  static const _keyTheme = 'appearance_theme_v1';
  static const _keyLang = 'appearance_language_v1';
  static const _keyFocus = 'user_focus_v1';

  String _themeOption = 'System';
  String _languageLabel = 'English';
  int _savingsCurrent = 1847;
  int _studySeconds = 7200; // 120 minutes
  String _focus = 'Reading'; // Default to Reading

  String get themeOption => _themeOption;
  String get languageLabel => _languageLabel;
  int get savingsCurrent => _savingsCurrent;
  int get studyMinutes => _studySeconds ~/ 60;
  String get focus => _focus;

  ThemeMode get themeMode {
    switch (_themeOption) {
      case 'Light':
        return ThemeMode.light;
      case 'Dark':
      case 'AMOLED':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  bool get useAmoledDark => _themeOption == 'AMOLED';

  bool get darkModeSwitchValue =>
      _themeOption == 'Dark' || _themeOption == 'AMOLED';

  Locale get locale {
    switch (_languageLabel) {
      case 'Spanish':
        return const Locale('es');
      case 'French':
        return const Locale('fr');
        case 'Tamil':
        return const Locale('ta');
      case 'Hindi':
        return const Locale('hi');
      case 'Japanese':
        return const Locale('ja');
      default:
        return const Locale('en');
    }
  }

  Future<void> load() async {
    final p = await SharedPreferences.getInstance();
    _themeOption = p.getString(_keyTheme) ?? 'System';
    _languageLabel = p.getString(_keyLang) ?? 'English';
    _savingsCurrent = p.getInt('savings_v1') ?? 1847;
    final oldMins = p.getInt('study_v1') ?? 120;
    _studySeconds = p.getInt('study_sec_v1') ?? (oldMins * 60);
    _focus = p.getString(_keyFocus) ?? 'Reading';
    if (!const {'System', 'Light', 'Dark', 'AMOLED'}.contains(_themeOption)) {
      _themeOption = 'System';
    }
    if (!const {'English', 'Spanish', 'French', 'Tamil','Hindi', 'Japanese'}
        .contains(_languageLabel)) {
      _languageLabel = 'English';
    }
    _notifyAfterFrame();
  }

  /// Avoids calling [notifyListeners] while a route (e.g. Cupertino action sheet) is
  /// still tearing down — that can assert in inherited widgets when [MaterialApp] rebuilds.
  void _notifyAfterFrame() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (hasListeners) notifyListeners();
    });
  }

  Future<void> setThemeOption(String value) async {
    if (!const {'System', 'Light', 'Dark', 'AMOLED'}.contains(value)) return;
    _themeOption = value;
    (await SharedPreferences.getInstance()).setString(_keyTheme, value);
    _notifyAfterFrame();
  }

  Future<void> setLanguageLabel(String value) async {
    if (!const {'English', 'Spanish', 'French', 'Tamil','Hindi', 'Japanese'}
        .contains(value)) {
      return;
    }
    _languageLabel = value;
    (await SharedPreferences.getInstance()).setString(_keyLang, value);
    _notifyAfterFrame();
  }

  Future<void> setFocus(String value) async {
    // Assuming valid values are 'Reading', 'Fitness', 'Savings' or similar
    _focus = value;
    (await SharedPreferences.getInstance()).setString(_keyFocus, value);
    _notifyAfterFrame();
  }

  /// Maps to a dark scheme (Dark) or back to Light; System becomes Dark when on.
  Future<void> setDarkModeSwitch(bool enabled) async {
    if (enabled) {
      if (_themeOption == 'Light' || _themeOption == 'System') {
        await setThemeOption('Dark');
      }
    } else {
      if (_themeOption == 'Dark' || _themeOption == 'AMOLED') {
        await setThemeOption('Light');
      }
    }
  }

  Future<void> setSavingsCurrent(int value) async {
    _savingsCurrent = value;
    (await SharedPreferences.getInstance()).setInt('savings_v1', value);
    _notifyAfterFrame();
  }

  Future<void> addStudyMinutes(int mins) async {
    addStudySeconds(mins * 60);
  }

  Future<void> addStudySeconds(int secs) async {
    if (secs <= 0) return;
    _studySeconds += secs;
    final p = await SharedPreferences.getInstance();
    p.setInt('study_sec_v1', _studySeconds);
    p.setInt('study_v1', _studySeconds ~/ 60);
    _notifyAfterFrame();
  }
}

ThemeData buildAppLightTheme() {
  final base = ThemeData(
    useMaterial3: true,
    fontFamily: 'Georgia',
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3D5AFE),
      brightness: Brightness.light,
    ),
  );
  return base.copyWith(
    scaffoldBackgroundColor: const Color(0xFFF4F2EE),
  );
}

ThemeData buildAppDarkTheme() {
  final base = ThemeData(
    useMaterial3: true,
    fontFamily: 'Georgia',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3D5AFE),
      brightness: Brightness.dark,
    ),
  );
  return base.copyWith(
    scaffoldBackgroundColor: const Color(0xFF121218),
  );
}

ThemeData buildAppAmoledTheme() {
  final dark = buildAppDarkTheme();
  return dark.copyWith(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: dark.colorScheme.copyWith(surface: const Color(0xFF0A0A0A)),
  );
}
