import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'app_preferences.dart';
import 'l10n/app_localizations.dart';

// ══════════════════════════════════════════════════════════
//  SETTINGS PAGE
//  Soft warm white + deep slate — calm, organized, trusted
// ══════════════════════════════════════════════════════════

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appPreferences.load();
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appPreferences,
      builder: (context, _) {
        return MaterialApp(
          onGenerateTitle: (ctx) => AppLocalizations.of(ctx).appTitle,
          debugShowCheckedModeBanner: false,
          theme: buildAppLightTheme(),
          darkTheme: appPreferences.useAmoledDark ? buildAppAmoledTheme() : buildAppDarkTheme(),
          themeMode: appPreferences.themeMode,
          locale: appPreferences.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const SettingsPage(),
        );
      },
    );
  }
}

// ─── Palette (accent icons / profile card) ───────────────
const _slateMid = Color(0xFF4A5168);
const _accent = Color(0xFF3D5AFE);
const _red = Color(0xFFE53935);
const _amber = Color(0xFFFFA000);

// ─── Page ─────────────────────────────────────────────────
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {
  late AnimationController _entryCtrl;

  // Toggles
  bool _pushNotifications = true;
  bool _emailDigest = false;
  bool _goalReminders = true;
  bool _weeklyReport = true;
  bool _haptics = true;
  bool _analytics = false;
  bool _syncCloud = true;

  @override
  void initState() {
    super.initState();
    _entryCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))..forward();
  }

  @override
  void dispose() { _entryCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appPreferences,
      builder: (context, _) {
        final scheme = Theme.of(context).colorScheme;
        return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Header ──
            SliverToBoxAdapter(
              child: FadeTransition(
                opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(0, 0.5)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.maybePop(context),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: scheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [BoxShadow(color: scheme.shadow.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 2))],
                          ),
                          child: Icon(Icons.arrow_back_ios_new, color: scheme.onSurface, size: 16),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text('Settings', style: TextStyle(color: scheme.onSurface, fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
                    ],
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // ── Profile Card ──
            SliverToBoxAdapter(
              child: FadeTransition(
                opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(0.1, 0.55)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: _accent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: _accent.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 6))],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(child: Text('👤', style: TextStyle(fontSize: 26))),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Your Profile', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800)),
                              SizedBox(height: 3),
                              Text('Manage account details', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // ── Notifications ──
            _SectionHeader(title: 'Notifications', icon: '🔔', entryCtrl: _entryCtrl, interval: const Interval(0.2, 0.6)),
            _SettingsGroup(
              entryCtrl: _entryCtrl,
              interval: const Interval(0.25, 0.65),
              children: [
                _ToggleTile(
                  icon: Icons.notifications_active_outlined,
                  iconColor: _accent,
                  title: 'Push Notifications',
                  subtitle: 'Alerts and updates',
                  value: _pushNotifications,
                  onChanged: (v) => setState(() => _pushNotifications = v),
                ),
                _Divider(),
                _ToggleTile(
                  icon: Icons.email_outlined,
                  iconColor: const Color(0xFF00897B),
                  title: 'Email Digest',
                  subtitle: 'Weekly summary',
                  value: _emailDigest,
                  onChanged: (v) => setState(() => _emailDigest = v),
                ),
                _Divider(),
                _ToggleTile(
                  icon: Icons.flag_outlined,
                  iconColor: _amber,
                  title: 'Goal Reminders',
                  subtitle: 'Daily nudges',
                  value: _goalReminders,
                  onChanged: (v) => setState(() => _goalReminders = v),
                ),
                _Divider(),
                _ToggleTile(
                  icon: Icons.bar_chart_outlined,
                  iconColor: const Color(0xFF6200EA),
                  title: 'Weekly Report',
                  subtitle: 'Progress overview',
                  value: _weeklyReport,
                  onChanged: (v) => setState(() => _weeklyReport = v),
                ),
              ],
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // ── Appearance ──
            _SectionHeader(title: 'Appearance', icon: '🎨', entryCtrl: _entryCtrl, interval: const Interval(0.35, 0.75)),
            _SettingsGroup(
              entryCtrl: _entryCtrl,
              interval: const Interval(0.4, 0.8),
              children: [
                _ToggleTile(
                  icon: Icons.dark_mode_outlined,
                  iconColor: scheme.onSurface,
                  title: 'Dark Mode',
                  subtitle: 'Easier on the eyes',
                  value: appPreferences.darkModeSwitchValue,
                  onChanged: (v) async {
                    await appPreferences.setDarkModeSwitch(v);
                  },
                ),
                _Divider(),
                _SelectTile(
                  icon: Icons.palette_outlined,
                  iconColor: const Color(0xFFE91E63),
                  title: 'Theme',
                  value: appPreferences.themeOption,
                  options: const ['System', 'Light', 'Dark', 'AMOLED'],
                  onChanged: (v) => appPreferences.setThemeOption(v),
                ),
                _Divider(),
                _SelectTile(
                  icon: Icons.language_outlined,
                  iconColor: const Color(0xFF00BCD4),
                  title: 'Language',
                  value: appPreferences.languageLabel,
                  options: const ['English', 'Spanish', 'French', 'Tamil', 'Hindi', 'Japanese'],
                  onChanged: (v) => appPreferences.setLanguageLabel(v),
                ),
              ],
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // ── Privacy ──
            _SectionHeader(title: 'Privacy & Data', icon: '🔒', entryCtrl: _entryCtrl, interval: const Interval(0.5, 0.85)),
            _SettingsGroup(
              entryCtrl: _entryCtrl,
              interval: const Interval(0.55, 0.9),
              children: [
                _ToggleTile(
                  icon: Icons.vibration_outlined,
                  iconColor: const Color(0xFF00897B),
                  title: 'Haptic Feedback',
                  subtitle: 'Touch vibrations',
                  value: _haptics,
                  onChanged: (v) => setState(() => _haptics = v),
                ),
                _Divider(),
                _ToggleTile(
                  icon: Icons.analytics_outlined,
                  iconColor: _slateMid,
                  title: 'Analytics',
                  subtitle: 'Help us improve',
                  value: _analytics,
                  onChanged: (v) => setState(() => _analytics = v),
                ),
                _Divider(),
                _ToggleTile(
                  icon: Icons.cloud_sync_outlined,
                  iconColor: _accent,
                  title: 'Cloud Sync',
                  subtitle: 'Sync across devices',
                  value: _syncCloud,
                  onChanged: (v) => setState(() => _syncCloud = v),
                ),
              ],
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // ── Danger Zone ──
            _SectionHeader(title: 'Account', icon: '⚙️', entryCtrl: _entryCtrl, interval: const Interval(0.6, 0.95)),
            _SettingsGroup(
              entryCtrl: _entryCtrl,
              interval: const Interval(0.65, 1.0),
              children: [
                _NavTile(icon: Icons.lock_reset_outlined, iconColor: _amber, title: 'Change Password', onTap: () {}),
                _Divider(),
                _NavTile(icon: Icons.logout_outlined, iconColor: _slateMid, title: 'Sign Out', onTap: () {}),
                _Divider(),
                _NavTile(icon: Icons.delete_forever_outlined, iconColor: _red, title: 'Delete Account', titleColor: _red, onTap: () {}),
              ],
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Text('Version 1.0.0 • Made with ❤️',
                      style: TextStyle(color: scheme.onSurface.withValues(alpha: 0.55), fontSize: 11)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
      },
    );
  }
}

// ─── Section Header ───────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title, icon;
  final AnimationController entryCtrl;
  final Interval interval;
  const _SectionHeader({required this.title, required this.icon, required this.entryCtrl, required this.interval});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SliverToBoxAdapter(
      child: FadeTransition(
        opacity: CurvedAnimation(parent: entryCtrl, curve: interval),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
          child: Row(children: [
            Text(icon, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 8),
            Text(title, style: TextStyle(color: cs.onSurface.withValues(alpha: 0.65), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
          ]),
        ),
      ),
    );
  }
}

// ─── Settings Group ───────────────────────────────────────
class _SettingsGroup extends StatelessWidget {
  final List<Widget> children;
  final AnimationController entryCtrl;
  final Interval interval;
  const _SettingsGroup({required this.children, required this.entryCtrl, required this.interval});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SliverToBoxAdapter(
      child: FadeTransition(
        opacity: CurvedAnimation(parent: entryCtrl, curve: interval),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: cs.surface,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: cs.shadow.withValues(alpha: 0.07), blurRadius: 12, offset: const Offset(0, 3))],
            ),
            child: Column(children: children),
          ),
        ),
      ),
    );
  }
}

// ─── Toggle Tile ──────────────────────────────────────────
class _ToggleTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title, subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _ToggleTile({required this.icon, required this.iconColor, required this.title,
    required this.subtitle, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyle(color: cs.onSurface, fontSize: 14, fontWeight: FontWeight.w600)),
          Text(subtitle, style: TextStyle(color: cs.onSurface.withValues(alpha: 0.58), fontSize: 11)),
        ])),
        CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: cs.primary,
          trackColor: cs.outline.withValues(alpha: 0.35),
        ),
      ]),
    );
  }
}

// ─── Select Tile ──────────────────────────────────────────
class _SelectTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title, value;
  final List<String> options;
  final ValueChanged<String> onChanged;
  const _SelectTile({required this.icon, required this.iconColor, required this.title,
    required this.value, required this.options, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => showCupertinoModalPopup(
        context: context,
        builder: (sheetCtx) => CupertinoActionSheet(
          title: Text('Select $title'),
          actions: options.map((o) => CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(sheetCtx);
              WidgetsBinding.instance.addPostFrameCallback((_) => onChanged(o));
            },
            child: Text(o, style: TextStyle(color: o == value ? cs.primary : cs.onSurface, fontWeight: o == value ? FontWeight.w700 : FontWeight.w400)),
          )).toList(),
          cancelButton: CupertinoActionSheetAction(onPressed: () => Navigator.pop(sheetCtx), child: const Text('Cancel')),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text(title, style: TextStyle(color: cs.onSurface, fontSize: 14, fontWeight: FontWeight.w600))),
          Text(value, style: TextStyle(color: cs.onSurface.withValues(alpha: 0.65), fontSize: 13)),
          const SizedBox(width: 6),
          Icon(Icons.arrow_forward_ios, color: cs.onSurface.withValues(alpha: 0.45), size: 12),
        ]),
      ),
    );
  }
}

// ─── Nav Tile ─────────────────────────────────────────────
class _NavTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Color? titleColor;
  final VoidCallback onTap;
  const _NavTile({required this.icon, required this.iconColor, required this.title,
    this.titleColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text(title, style: TextStyle(color: titleColor ?? cs.onSurface, fontSize: 14, fontWeight: FontWeight.w600))),
          Icon(Icons.arrow_forward_ios, color: cs.onSurface.withValues(alpha: 0.45), size: 12),
        ]),
      ),
    );
  }
}

// ─── Divider ──────────────────────────────────────────────
class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 58),
    child: Divider(color: Theme.of(context).dividerColor, height: 1),
  );
}
