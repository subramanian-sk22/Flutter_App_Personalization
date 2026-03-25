import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'app_preferences.dart';
import 'set_goals_page.dart';
import 'login_page.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appPreferences.load();
  runApp(const WelcomeApp());
}

// ════════════════════════════════════════════════════════════════════════════
//  APP ROOT
// ════════════════════════════════════════════════════════════════════════════
class WelcomeApp extends StatelessWidget {
  const WelcomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appPreferences,
      builder: (context, _) {
        return MaterialApp(
          onGenerateTitle: (ctx) => AppLocalizations.of(ctx).appTitle,
          debugShowCheckedModeBanner: false,
          theme: buildAppLightTheme(),
          darkTheme: appPreferences.useAmoledDark
              ? buildAppAmoledTheme()
              : buildAppDarkTheme(),
          themeMode: appPreferences.themeMode,
          locale: appPreferences.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: '/login',
          routes: {
            '/login':     (_) => const LoginPage(),
            '/':          (_) => const WelcomeScreen(),
            '/goals':     (_) => const SetGoalsPage(),
            '/explore':   (_) => const ExplorePage(),
            '/alerts':    (_) => const AlertsPage(),
            '/settings':  (_) => const SettingsPage(),
          },
        );
      },
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
//  SHARED NAVIGATION HELPER
// ════════════════════════════════════════════════════════════════════════════
void _push(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

// ════════════════════════════════════════════════════════════════════════════
//  SHARED COLORS (used across all pages)
// ════════════════════════════════════════════════════════════════════════════

// — Welcome palette —
const Color kDeep       = Color(0xFF0A0A14);
const Color kMid        = Color(0xFF12122A);
const Color kAccent     = Color(0xFFE8C87A);
const Color kAccentSoft = Color(0xFFF5E9B8);
const Color kPurple     = Color(0xFF7B5EA7);
const Color kBlue       = Color(0xFF3A7BD5);
const Color kSurface    = Color(0xFF1A1A30);
const Color kTextPrimary   = Color(0xFFF0ECE3);
const Color kTextSecondary = Color(0xFF9998AA);

// — Explore palette —
const _eBg      = Color(0xFFF9F5EE);
const _eInk     = Color(0xFF1A1208);
const _eInkMid  = Color(0xFF4A3F2F);
const _eInkLight= Color(0xFF9B8E7A);
const _eCream   = Color(0xFFF0E8D8);
const _eRust    = Color(0xFFD4603A);
const _eCobalt  = Color(0xFF2B4590);
const _eSage    = Color(0xFF4A7C59);
const _eMustard = Color(0xFFD4A017);
const _eCard    = Color(0xFFFFFFFF);

// — Alerts palette —
const _aBg       = Color(0xFF060810);
const _aSurface  = Color(0xFF0C0F1E);
const _aCard     = Color(0xFF10142A);
const _electric  = Color(0xFF4A9EFF);
const _violet    = Color(0xFF8B5CF6);
const _aRed      = Color(0xFFFF5252);
const _aAmber    = Color(0xFFFFAB40);
const _aGreen    = Color(0xFF69F0AE);
const _aTextPri  = Color(0xFFECF0FF);
const _aTextSec  = Color(0xFF5A6490);
const _aDivider  = Color(0xFF1A1F3A);

// — Settings accents (icons / profile card) —
const _sSlateMid = Color(0xFF4A5168);
const _sAccent   = Color(0xFF3D5AFE);
const _sRed      = Color(0xFFE53935);
const _sAmber    = Color(0xFFFFA000);


// ════════════════════════════════════════════════════════════════════════════
//  WELCOME SCREEN
// ════════════════════════════════════════════════════════════════════════════
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _orbitController;
  late AnimationController _entryController;
  late AnimationController _pulseController;
  late AnimationController _shimmerController;

  late Animation<double> _logoFade, _greetingFade, _cardFade, _buttonFade, _dividerScale;
  late Animation<Offset> _logoSlide, _greetingSlide, _cardSlide;

  String _selectedMood = '';
  String _userName = '';
  bool _showNameField = false;
  bool _nameEntered = false;
  final TextEditingController _nameController = TextEditingController();

  final List<_MoodOption> _moods = [
    _MoodOption('🌅', 'inspired', const Color(0xFFFF8C42)),
    _MoodOption('⚡', 'energized', const Color(0xFFFFD700)),
    _MoodOption('🌿', 'calm', const Color(0xFF56C596)),
    _MoodOption('🚀', 'focused', const Color(0xFF4DA8DA)),
    _MoodOption('✨', 'creative', const Color(0xFFAB87FF)),
  ];

  @override
  void initState() {
    super.initState();
    _orbitController   = AnimationController(vsync: this, duration: const Duration(seconds: 18))..repeat();
    _pulseController   = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200))..repeat(reverse: true);
    _shimmerController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..repeat();
    _entryController   = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));

    _logoFade    = CurvedAnimation(parent: _entryController, curve: const Interval(0.0, 0.35, curve: Curves.easeOut));
    _logoSlide   = Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _entryController, curve: const Interval(0.0, 0.35, curve: Curves.easeOutCubic)));
    _greetingFade  = CurvedAnimation(parent: _entryController, curve: const Interval(0.2, 0.55, curve: Curves.easeOut));
    _greetingSlide = Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero)
        .animate(CurvedAnimation(parent: _entryController, curve: const Interval(0.2, 0.55, curve: Curves.easeOutCubic)));
    _dividerScale  = CurvedAnimation(parent: _entryController, curve: const Interval(0.35, 0.6, curve: Curves.easeOut));
    _cardFade    = CurvedAnimation(parent: _entryController, curve: const Interval(0.45, 0.78, curve: Curves.easeOut));
    _cardSlide   = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _entryController, curve: const Interval(0.45, 0.78, curve: Curves.easeOutCubic)));
    _buttonFade  = CurvedAnimation(parent: _entryController, curve: const Interval(0.65, 1.0, curve: Curves.easeOut));

    _entryController.forward();
  }

  @override
  void dispose() {
    _orbitController.dispose(); _entryController.dispose();
    _pulseController.dispose(); _shimmerController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  String _greetingText(AppLocalizations l) {
    final h = DateTime.now().hour;
    if (h < 12) return l.goodMorning;
    if (h < 17) return l.goodAfternoon;
    return l.goodEvening;
  }

  String _moodLabel(AppLocalizations l, String id) {
    return switch (id) {
      'inspired' => l.moodInspired,
      'energized' => l.moodEnergized,
      'calm' => l.moodCalm,
      'focused' => l.moodFocused,
      'creative' => l.moodCreative,
      _ => id,
    };
  }

  String get _personalizedName =>
      _userName.isNotEmpty ? ', ${_userName.split(' ').first}' : '';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: kDeep,
      body: Stack(children: [
        const _AmbientBackground(),
        AnimatedBuilder(
          animation: _orbitController,
          builder: (_, __) => CustomPaint(
            painter: _OrbitPainter(_orbitController.value),
            size: MediaQuery.of(context).size,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(height: 20),

              // Logo
              FadeTransition(opacity: _logoFade,
                  child: SlideTransition(position: _logoSlide,
                      child: _AnimatedLogo(pulseCtrl: _pulseController))),

              const SizedBox(height: 36),

              // Greeting
              FadeTransition(opacity: _greetingFade,
                  child: SlideTransition(position: _greetingSlide,
                      child: Column(children: [
                        Text(_greetingText(l), style: const TextStyle(color: kTextSecondary, fontSize: 14, letterSpacing: 4)),
                        const SizedBox(height: 8),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: Text(l.welcomeWithName(_personalizedName),
                              key: ValueKey(_personalizedName),
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: kTextPrimary, fontSize: 36, fontWeight: FontWeight.w700, height: 1.1, letterSpacing: -0.5)),
                        ),
                      ]))),

              const SizedBox(height: 20),

              // Divider
              FadeTransition(opacity: _dividerScale,
                  child: ScaleTransition(scale: _dividerScale,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        _GoldDot(),
                        const SizedBox(width: 8),
                        Container(width: 60, height: 1,
                            decoration: BoxDecoration(gradient: LinearGradient(colors: [kAccent.withOpacity(0), kAccent]))),
                        const SizedBox(width: 8),
                        Container(width: 6, height: 6, decoration: const BoxDecoration(color: kAccent, shape: BoxShape.circle)),
                        const SizedBox(width: 8),
                        Container(width: 60, height: 1,
                            decoration: BoxDecoration(gradient: LinearGradient(colors: [kAccent, kAccent.withOpacity(0)]))),
                        const SizedBox(width: 8),
                        _GoldDot(),
                      ]))),

              const SizedBox(height: 32),

              // Name card
              FadeTransition(opacity: _cardFade,
                  child: SlideTransition(position: _cardSlide,
                      child: _NameCard(
                        controller: _nameController,
                        showField: _showNameField,
                        nameEntered: _nameEntered,
                        userName: _userName,
                        onTapReveal: () => setState(() => _showNameField = true),
                        onSubmit: (val) {
                          if (val.trim().isNotEmpty) setState(() {
                            _userName = val.trim(); _nameEntered = true; _showNameField = false;
                          });
                        },
                      ))),

              const SizedBox(height: 24),

              // Mood selector
              FadeTransition(opacity: _cardFade,
                  child: SlideTransition(position: _cardSlide,
                      child: _MoodSelector(moods: _moods, selected: _selectedMood,
                          moodLabel: _moodLabel,
                          onSelect: (m) => setState(() => _selectedMood = m)))),

              const SizedBox(height: 28),

              // Quick Start Grid — NOW WITH NAVIGATION
              FadeTransition(opacity: _cardFade,
                  child: SlideTransition(position: _cardSlide,
                      child: const _QuickStartGrid())),

              const SizedBox(height: 36),

              // CTA
              FadeTransition(opacity: _buttonFade,
                  child: _ShimmerButton(
                    shimmerCtrl: _shimmerController,
                    label: _nameEntered ? l.beginYourJourney : l.letsGetStarted,
                    onTap: () => _push(context, '/goals'),
                  )),

              const SizedBox(height: 16),

              FadeTransition(opacity: _buttonFade,
                  child: TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                    child: Text(l.alreadyHaveAccountSignIn,
                        style: const TextStyle(color: kTextSecondary, fontSize: 13)),
                  )),

              const SizedBox(height: 32),
            ]),
          ),
        ),
      ]),
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
//  WELCOME — Sub-widgets
// ════════════════════════════════════════════════════════════════════════════

class _AmbientBackground extends StatelessWidget {
  const _AmbientBackground();
  @override
  Widget build(BuildContext context) =>
      SizedBox.expand(child: CustomPaint(painter: _BgPainter(MediaQuery.of(context).size)));
}

class _BgPainter extends CustomPainter {
  final Size size;
  _BgPainter(this.size);
  @override
  void paint(Canvas canvas, Size sz) {
    canvas.drawRect(Rect.fromLTWH(0, 0, sz.width, sz.height),
        Paint()..shader = const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [kDeep, kMid, Color(0xFF0D0D1F)],
        ).createShader(Rect.fromLTWH(0, 0, sz.width, sz.height)));
    _glow(canvas, Offset(sz.width * .15, sz.height * .15), sz.width * .45, kPurple.withOpacity(.12));
    _glow(canvas, Offset(sz.width * .85, sz.height * .3),  sz.width * .4,  kBlue.withOpacity(.10));
    _glow(canvas, Offset(sz.width * .5,  sz.height * .75), sz.width * .5,  kAccent.withOpacity(.06));
  }
  void _glow(Canvas c, Offset center, double r, Color color) {
    c.drawCircle(center, r, Paint()..shader =
    RadialGradient(colors: [color, Colors.transparent]).createShader(Rect.fromCircle(center: center, radius: r)));
  }
  @override bool shouldRepaint(covariant CustomPainter _) => false;
}

class _OrbitPainter extends CustomPainter {
  final double t;
  _OrbitPainter(this.t);
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2, cy = size.height * 0.22;
    for (final cfg in [
      (r: 110.0, s: 1.0,   sz: 3.0, c: kAccent.withOpacity(.6)),
      (r: 150.0, s: -0.65, sz: 2.0, c: kBlue.withOpacity(.5)),
      (r: 85.0,  s: 1.4,   sz: 2.5, c: kPurple.withOpacity(.55)),
      (r: 175.0, s: 0.5,   sz: 1.8, c: kAccentSoft.withOpacity(.4)),
    ]) {
      final a = t * cfg.s * 2 * math.pi;
      canvas.drawCircle(Offset(cx + cfg.r * math.cos(a), cy + cfg.r * 0.38 * math.sin(a)),
          cfg.sz, Paint()..color = cfg.c);
    }
  }
  @override bool shouldRepaint(_OrbitPainter old) => old.t != t;
}

class _AnimatedLogo extends StatelessWidget {
  final AnimationController pulseCtrl;
  const _AnimatedLogo({required this.pulseCtrl});
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: pulseCtrl,
    builder: (_, __) => Transform.scale(
      scale: 0.96 + 0.04 * pulseCtrl.value,
      child: Container(width: 88, height: 88,
          decoration: BoxDecoration(shape: BoxShape.circle,
              gradient: const RadialGradient(colors: [Color(0xFF2A2A4A), kSurface]),
              border: Border.all(color: kAccent.withOpacity(.5), width: 1.5),
              boxShadow: [
                BoxShadow(color: kAccent.withOpacity(.18 + .08 * pulseCtrl.value), blurRadius: 32, spreadRadius: 4),
                BoxShadow(color: kPurple.withOpacity(.12), blurRadius: 20, spreadRadius: 2),
              ]),
          child: const Center(child: Text('✦', style: TextStyle(color: kAccent, fontSize: 34)))),
    ),
  );
}

class _GoldDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Container(width: 4, height: 4, decoration: const BoxDecoration(color: kAccent, shape: BoxShape.circle));
}

class _MoodOption {
  final String emoji, id;
  final Color color;
  const _MoodOption(this.emoji, this.id, this.color);
}

class _MoodSelector extends StatelessWidget {
  final List<_MoodOption> moods;
  final String selected;
  final String Function(AppLocalizations, String id) moodLabel;
  final ValueChanged<String> onSelect;
  const _MoodSelector({
    required this.moods,
    required this.selected,
    required this.moodLabel,
    required this.onSelect,
  });
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 14),
          child: Text(l.howAreYouFeeling,
              style: const TextStyle(color: kTextSecondary, fontSize: 13, letterSpacing: .5))),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: moods
              .map((m) => _MoodChip(
                    option: m,
                    label: moodLabel(l, m.id),
                    isSelected: selected == m.id,
                    onTap: () => onSelect(m.id),
                  ))
              .toList()),
    ]);
  }
}

class _MoodChip extends StatefulWidget {
  final _MoodOption option;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const _MoodChip({required this.option, required this.label, required this.isSelected, required this.onTap});
  @override State<_MoodChip> createState() => _MoodChipState();
}
class _MoodChipState extends State<_MoodChip> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;
  @override void initState() { super.initState();
  _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
  _scale = Tween(begin: 1.0, end: 0.88).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }
  @override void dispose() { _ctrl.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapDown: (_) => _ctrl.forward(), onTapUp: (_) { _ctrl.reverse(); widget.onTap(); },
    onTapCancel: () => _ctrl.reverse(),
    child: ScaleTransition(scale: _scale,
        child: AnimatedContainer(duration: const Duration(milliseconds: 250),
          width: 58,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              color: widget.isSelected ? widget.option.color.withOpacity(.18) : kSurface.withOpacity(.6),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: widget.isSelected ? widget.option.color.withOpacity(.7) : kTextSecondary.withOpacity(.15),
                  width: widget.isSelected ? 1.5 : 1),
              boxShadow: widget.isSelected ? [BoxShadow(color: widget.option.color.withOpacity(.2), blurRadius: 12, spreadRadius: 1)] : []),
          child: Column(children: [
            Text(widget.option.emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 5),
            Text(widget.label, style: TextStyle(
                color: widget.isSelected ? widget.option.color : kTextSecondary,
                fontSize: 9, fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w400, letterSpacing: .3)),
          ]),
        )),
  );
}

// Quick start grid with navigation
class _QuickStartGrid extends StatelessWidget {
  const _QuickStartGrid();
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final tiles = [
      _TileData('🎯', l.tileSetGoals, l.tileSetGoalsSub, '/goals'),
      _TileData('📚', l.tileExplore, l.tileExploreSub, '/explore'),
      _TileData('🔔', l.tileAlerts, l.tileAlertsSub, '/alerts'),
      _TileData('⚙️', l.tileSettings, l.tileSettingsSub, '/settings'),
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 14),
          child: Text(l.quickStart, style: const TextStyle(color: kTextSecondary, fontSize: 13, letterSpacing: .5))),
      GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.0,
          children: tiles.map((t) => _TileCard(tile: t)).toList()),
    ]);
  }
}

class _TileData {
  final String emoji, title, sub, route;
  const _TileData(this.emoji, this.title, this.sub, this.route);
}

class _TileCard extends StatefulWidget {
  final _TileData tile;
  const _TileCard({required this.tile});
  @override State<_TileCard> createState() => _TileCardState();
}
class _TileCardState extends State<_TileCard> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapDown: (_) => setState(() => _pressed = true),
    onTapUp: (_) { setState(() => _pressed = false); _push(context, widget.tile.route); },
    onTapCancel: () => setState(() => _pressed = false),
    child: AnimatedScale(scale: _pressed ? .94 : 1.0, duration: const Duration(milliseconds: 130),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: kSurface.withOpacity(.7),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: kTextSecondary.withOpacity(.12)),
          ),
          child: Row(children: [
            Text(widget.tile.emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(widget.tile.title, style: const TextStyle(color: kTextPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(widget.tile.sub, style: const TextStyle(color: kTextSecondary, fontSize: 10)),
                ])),
          ]),
        )),
  );
}

class _NameCard extends StatelessWidget {
  final TextEditingController controller;
  final bool showField, nameEntered;
  final String userName;
  final VoidCallback onTapReveal;
  final ValueChanged<String> onSubmit;
  const _NameCard({required this.controller, required this.showField, required this.nameEntered,
    required this.userName, required this.onTapReveal, required this.onSubmit});
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
        color: kSurface.withOpacity(.7), borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kAccent.withOpacity(.18), width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.3), blurRadius: 20, offset: const Offset(0, 8))]),
    child: AnimatedSwitcher(duration: const Duration(milliseconds: 400),
        child: nameEntered ? _NameConfirmed(userName: userName)
            : showField ? _NameInput(controller: controller, onSubmit: onSubmit)
            : _NamePrompt(onTap: onTapReveal)),
  );
}

class _NamePrompt extends StatelessWidget {
  final VoidCallback onTap;
  const _NamePrompt({required this.onTap});
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return GestureDetector(
        onTap: onTap,
        child: Row(children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: kAccent.withOpacity(.12), borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.person_outline, color: kAccent, size: 22)),
          const SizedBox(width: 16),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l.personalizeYourExperience,
                    style: const TextStyle(color: kTextPrimary, fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text(l.tapToTellName, style: const TextStyle(color: kTextSecondary, fontSize: 12)),
              ])),
          const Icon(Icons.arrow_forward_ios, color: kTextSecondary, size: 14),
        ]));
  }
}

class _NameInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmit;
  const _NameInput({required this.controller, required this.onSubmit});
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(l.whatShouldWeCallYou,
          style: const TextStyle(color: kTextPrimary, fontSize: 15, fontWeight: FontWeight.w600)),
      const SizedBox(height: 12),
      TextField(
        controller: controller,
        autofocus: true,
        style: const TextStyle(color: kTextPrimary, fontSize: 16),
        cursorColor: kAccent,
        decoration: InputDecoration(
          hintText: l.enterYourNameHint,
          hintStyle: TextStyle(color: kTextSecondary.withOpacity(.6)),
          filled: true, fillColor: kDeep.withOpacity(.5),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: kAccent.withOpacity(.3))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: kAccent.withOpacity(.3))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: kAccent, width: 1.5)),
          suffixIcon: IconButton(icon: const Icon(Icons.check_circle, color: kAccent), onPressed: () => onSubmit(controller.text)),
        ),
        onSubmitted: onSubmit),
    ]);
  }
}

class _NameConfirmed extends StatelessWidget {
  final String userName;
  const _NameConfirmed({required this.userName});
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Row(children: [
      Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: kAccent.withOpacity(.15), borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.waving_hand, color: kAccent, size: 22)),
      const SizedBox(width: 16),
      Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(l.helloUser(userName),
            style: const TextStyle(color: kTextPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 3),
        Text(l.wevePersonalized, style: const TextStyle(color: kTextSecondary, fontSize: 12)),
      ])),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(color: Colors.green.withOpacity(.15), borderRadius: BorderRadius.circular(20)),
          child: Row(children: [
            const Icon(Icons.check, color: Colors.greenAccent, size: 12),
            const SizedBox(width: 4),
            Text(l.setBadge, style: const TextStyle(color: Colors.greenAccent, fontSize: 11)),
          ])),
    ]);
  }
}

class _ShimmerButton extends StatelessWidget {
  final AnimationController shimmerCtrl;
  final String label;
  final VoidCallback onTap;
  const _ShimmerButton({required this.shimmerCtrl, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedBuilder(animation: shimmerCtrl,
        builder: (_, __) => Container(width: double.infinity, height: 56,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                    begin: Alignment(-1 + shimmerCtrl.value * 2, 0),
                    end: Alignment(1 + shimmerCtrl.value * 2, 0),
                    colors: const [Color(0xFFB8922A), kAccent, Color(0xFFF5E9B8), kAccent, Color(0xFFB8922A)],
                    stops: const [0.0, 0.35, 0.5, 0.65, 1.0]),
                boxShadow: [BoxShadow(color: kAccent.withOpacity(.3), blurRadius: 20, offset: const Offset(0, 6))]),
            child: Center(child: Text(label, style: const TextStyle(color: kDeep, fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: .5))))),
  );
}


// ════════════════════════════════════════════════════════════════════════════
//  EXPLORE PAGE
// ════════════════════════════════════════════════════════════════════════════
enum _ArticleTitleKey {
  hci,
  designSys,
  morning,
  indexFunds,
  neural,
  micro,
  habits,
  gpt,
}

String _articleTitle(AppLocalizations l, _ArticleTitleKey k) {
  return switch (k) {
    _ArticleTitleKey.hci => l.articleHciTitle,
    _ArticleTitleKey.designSys => l.articleDesignSysTitle,
    _ArticleTitleKey.morning => l.articleMorningTitle,
    _ArticleTitleKey.indexFunds => l.articleIndexTitle,
    _ArticleTitleKey.neural => l.articleNeuralTitle,
    _ArticleTitleKey.micro => l.articleMicroTitle,
    _ArticleTitleKey.habits => l.articleHabitsTitle,
    _ArticleTitleKey.gpt => l.articleGptTitle,
  };
}

String _exploreCategoryLabel(AppLocalizations l, String cat) {
  return switch (cat) {
    'All' => l.categoryAll,
    'Tech' => l.categoryTech,
    'Design' => l.categoryDesign,
    'Wellness' => l.categoryWellness,
    'Finance' => l.categoryFinance,
    'Science' => l.categoryScience,
    _ => cat,
  };
}

class _Article {
  final _ArticleTitleKey titleKey;
  final String category;
  final int readMins;
  final String emoji, author;
  final Color accent;
  bool saved;
  _Article({
    required this.titleKey,
    required this.category,
    required this.readMins,
    required this.emoji,
    required this.author,
    required this.accent,
    this.saved = false,
  });
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});
  @override State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _entryCtrl;
  String _activeCategory = 'All';
  final Stopwatch _stopwatch = Stopwatch();
  final _categories = ['All','Tech','Design','Wellness','Finance','Science'];

  final List<_Article> _featured = [
    _Article(titleKey: _ArticleTitleKey.hci, category: 'Tech', readMins: 6, emoji: '🖥️', author: 'A. Chen', accent: _eCobalt),
    _Article(titleKey: _ArticleTitleKey.designSys, category: 'Design', readMins: 4, emoji: '🎨', author: 'M. Patel', accent: _eRust),
    _Article(titleKey: _ArticleTitleKey.morning, category: 'Wellness', readMins: 5, emoji: '🌅', author: 'S. Okafor', accent: _eSage),
  ];

  final List<_Article> _latest = [
    _Article(titleKey: _ArticleTitleKey.indexFunds, category: 'Finance', readMins: 8, emoji: '📈', author: 'J. Rivera', accent: _eMustard),
    _Article(titleKey: _ArticleTitleKey.neural, category: 'Science', readMins: 7, emoji: '🧠', author: 'Dr. K. Lin', accent: _eCobalt),
    _Article(titleKey: _ArticleTitleKey.micro, category: 'Design', readMins: 3, emoji: '✨', author: 'T. Brooks', accent: _eRust),
    _Article(titleKey: _ArticleTitleKey.habits, category: 'Wellness', readMins: 5, emoji: '⚡', author: 'R. Nguyen', accent: _eSage),
    _Article(titleKey: _ArticleTitleKey.gpt, category: 'Tech', readMins: 9, emoji: '🤖', author: 'E. Walsh', accent: _eInkMid),
  ];

  List<_Article> get _filteredLatest => _activeCategory == 'All'
      ? _latest : _latest.where((a) => a.category == _activeCategory).toList();

  @override void initState() { 
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _stopwatch.start();
    _entryCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..forward(); 
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _stopwatch.start();
    } else {
      _stopwatch.stop();
      _syncTime();
    }
  }

  void _syncTime() {
    final secs = _stopwatch.elapsed.inSeconds;
    if (secs > 0) {
      appPreferences.addStudySeconds(secs);
      _stopwatch.reset();
      if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
        _stopwatch.start();
      }
    }
  }

  @override void dispose() { 
    WidgetsBinding.instance.removeObserver(this);
    _stopwatch.stop();
    _syncTime();
    _entryCtrl.dispose(); 
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: _eBg,
      body: SafeArea(
          child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
            child: FadeTransition(
                opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(0, .4)),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(children: [
                        _BackBtn(color: _eCream, iconColor: _eInk, borderColor: _eInkLight.withOpacity(.3)),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(color: _eInk, borderRadius: BorderRadius.circular(20)),
                            child: Row(children: [
                              const Icon(Icons.search, color: Colors.white, size: 14),
                              const SizedBox(width: 6),
                              Text(l.search,
                                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                            ])),
                      ]),
                      const SizedBox(height: 28),
                      Text(l.exploreTitle,
                          style: const TextStyle(
                              color: _eInk, fontSize: 40, fontWeight: FontWeight.w900, letterSpacing: -1.5, height: 1)),
                      const SizedBox(height: 6),
                      Text(l.exploreSubtitle, style: const TextStyle(color: _eInkLight, fontSize: 14)),
                    ])))),
        SliverToBoxAdapter(
            child: FadeTransition(
                opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(.15, .55)),
                child: Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 20),
                    child: SizedBox(
                        height: 38,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            itemCount: _categories.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 8),
                            itemBuilder: (_, i) {
                              final cat = _categories[i];
                              final active = cat == _activeCategory;
                              return GestureDetector(
                                  onTap: () => setState(() => _activeCategory = cat),
                                  child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: active ? _eInk : _eCream,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: active ? _eInk : _eInkLight.withOpacity(.25))),
                                      child: Text(_exploreCategoryLabel(l, cat),
                                          style: TextStyle(
                                              color: active ? Colors.white : _eInkMid,
                                              fontSize: 13,
                                              fontWeight: active ? FontWeight.w700 : FontWeight.w500))));
                            }))))),
        SliverToBoxAdapter(
            child: FadeTransition(
                opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(.25, .65)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                      child: Row(children: [
                        Container(
                            width: 3,
                            height: 18,
                            decoration:
                                BoxDecoration(color: _eRust, borderRadius: BorderRadius.circular(2))),
                        const SizedBox(width: 10),
                        Text(l.featured,
                            style: const TextStyle(color: _eInk, fontSize: 16, fontWeight: FontWeight.w800)),
                      ])),
                  SizedBox(
                      height: 200,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: _featured.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 14),
                          itemBuilder: (_, i) => _FeaturedCard(article: _featured[i]))),
                ]))),
        SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
                child: Row(children: [
                  Container(
                      width: 3,
                      height: 18,
                      decoration: BoxDecoration(color: _eCobalt, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(width: 10),
                  Text(l.latest,
                      style: const TextStyle(color: _eInk, fontSize: 16, fontWeight: FontWeight.w800)),
                  const Spacer(),
                  Text(l.articlesCount(_filteredLatest.length),
                      style: const TextStyle(color: _eInkLight, fontSize: 12)),
                ]))),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((ctx, i) {
                  final a = _filteredLatest[i];
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _LatestCard(article: a, onSave: () => setState(() => a.saved = !a.saved)));
                }, childCount: _filteredLatest.length))),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ])),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final _Article article;
  const _FeaturedCard({required this.article});
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Container(
        width: 260,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: article.accent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: article.accent.withOpacity(.3), blurRadius: 16, offset: const Offset(0, 6))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(article.emoji, style: const TextStyle(fontSize: 28)),
            const Spacer(),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: Colors.white.withOpacity(.2), borderRadius: BorderRadius.circular(20)),
                child: Text(l.readMinutes(article.readMins),
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600))),
          ]),
          const Spacer(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(color: Colors.white.withOpacity(.2), borderRadius: BorderRadius.circular(8)),
              child: Text(_exploreCategoryLabel(l, article.category),
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: .5))),
          const SizedBox(height: 8),
          Text(_articleTitle(l, article.titleKey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800, height: 1.3)),
          const SizedBox(height: 8),
          Text(l.byAuthor(article.author), style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 11)),
        ]));
  }
}

class _LatestCard extends StatefulWidget {
  final _Article article; final VoidCallback onSave;
  const _LatestCard({required this.article, required this.onSave});
  @override State<_LatestCard> createState() => _LatestCardState();
}
class _LatestCardState extends State<_LatestCard> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final a = widget.article;
    final readLine = '${l.readMinutes(a.readMins)}${l.readSuffix}';
    return GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
            scale: _pressed ? .97 : 1,
            duration: const Duration(milliseconds: 120),
            child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: _eCard,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: _eInk.withOpacity(.06), blurRadius: 12, offset: const Offset(0, 3))]),
                child: Row(children: [
                  Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                          color: a.accent.withOpacity(.1), borderRadius: BorderRadius.circular(14)),
                      child: Center(child: Text(a.emoji, style: const TextStyle(fontSize: 24)))),
                  const SizedBox(width: 14),
                  Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(_articleTitle(l, a.titleKey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: _eInk, fontSize: 13, fontWeight: FontWeight.w700, height: 1.3)),
                    const SizedBox(height: 5),
                    Row(children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                              color: a.accent.withOpacity(.1), borderRadius: BorderRadius.circular(6)),
                          child: Text(_exploreCategoryLabel(l, a.category),
                              style: TextStyle(color: a.accent, fontSize: 9, fontWeight: FontWeight.w700))),
                      const SizedBox(width: 8),
                      Text(readLine, style: const TextStyle(color: _eInkLight, fontSize: 10)),
                      const SizedBox(width: 8),
                      Text('• ${a.author}', style: const TextStyle(color: _eInkLight, fontSize: 10)),
                    ]),
                  ])),
                  const SizedBox(width: 8),
                  GestureDetector(
                      onTap: widget.onSave,
                      child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(a.saved ? Icons.bookmark : Icons.bookmark_outline,
                              key: ValueKey(a.saved),
                              color: a.saved ? a.accent : _eInkLight,
                              size: 20))),
                ]))));
  }
}


// ════════════════════════════════════════════════════════════════════════════
//  ALERTS PAGE
// ════════════════════════════════════════════════════════════════════════════
enum _AlertType { urgent, info, success, warning }

enum _AlertKind { goal, newArticle, savings, weekly, tech, streak, sync }

enum _AlertTimeId { m2, m18, h1, h3, h5, yesterday }

enum _AlertFilterTag { all, urgent, unread, info }

String _alertItemTitle(AppLocalizations l, _AlertKind k) {
  return switch (k) {
    _AlertKind.goal => l.alertGoalTitle,
    _AlertKind.newArticle => l.alertNewArticleTitle,
    _AlertKind.savings => l.alertSavingsTitle,
    _AlertKind.weekly => l.alertWeeklyTitle,
    _AlertKind.tech => l.alertTechTitle,
    _AlertKind.streak => l.alertStreakTitle,
    _AlertKind.sync => l.alertSyncTitle,
  };
}

String _alertItemBody(AppLocalizations l, _AlertKind k) {
  return switch (k) {
    _AlertKind.goal => l.alertGoalBody,
    _AlertKind.newArticle => l.alertNewArticleBody,
    _AlertKind.savings => l.alertSavingsBody,
    _AlertKind.weekly => l.alertWeeklyBody,
    _AlertKind.tech => l.alertTechBody,
    _AlertKind.streak => l.alertStreakBody,
    _AlertKind.sync => l.alertSyncBody,
  };
}

String _alertItemTime(AppLocalizations l, _AlertTimeId t) {
  return switch (t) {
    _AlertTimeId.m2 => l.time2m,
    _AlertTimeId.m18 => l.time18m,
    _AlertTimeId.h1 => l.time1h,
    _AlertTimeId.h3 => l.time3h,
    _AlertTimeId.h5 => l.time5h,
    _AlertTimeId.yesterday => l.timeYesterday,
  };
}

String _alertFilterLabel(AppLocalizations l, _AlertFilterTag f) {
  return switch (f) {
    _AlertFilterTag.all => l.filterAll,
    _AlertFilterTag.urgent => l.filterUrgent,
    _AlertFilterTag.unread => l.filterUnread,
    _AlertFilterTag.info => l.filterInfo,
  };
}

String _alertTypeLabel(AppLocalizations l, _AlertType type) {
  return switch (type) {
    _AlertType.urgent => l.alertTypeUrgent,
    _AlertType.info => l.alertTypeInfo,
    _AlertType.success => l.alertTypeSuccess,
    _AlertType.warning => l.alertTypeWarning,
  };
}

class _AlertItem {
  final _AlertKind kind;
  final _AlertTimeId timeId;
  final String icon;
  final _AlertType type;
  bool read, dismissed;
  _AlertItem({
    required this.kind,
    required this.timeId,
    required this.icon,
    required this.type,
    this.read = false,
    this.dismissed = false,
  });
  Color get color => switch (type) {
        _AlertType.urgent => _aRed,
        _AlertType.info => _electric,
        _AlertType.success => _aGreen,
        _AlertType.warning => _aAmber,
      };
}

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});
  @override State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> with SingleTickerProviderStateMixin {
  late AnimationController _entryCtrl;
  _AlertFilterTag _filter = _AlertFilterTag.all;
  static const _filters = _AlertFilterTag.values;

  final List<_AlertItem> _alerts = [
    _AlertItem(kind: _AlertKind.goal, timeId: _AlertTimeId.m2, icon: '🎯', type: _AlertType.urgent),
    _AlertItem(kind: _AlertKind.newArticle, timeId: _AlertTimeId.m18, icon: '📚', type: _AlertType.info),
    _AlertItem(kind: _AlertKind.savings, timeId: _AlertTimeId.h1, icon: '💰', type: _AlertType.success, read: true),
    _AlertItem(kind: _AlertKind.weekly, timeId: _AlertTimeId.h3, icon: '📋', type: _AlertType.warning),
    _AlertItem(kind: _AlertKind.tech, timeId: _AlertTimeId.h5, icon: '🤖', type: _AlertType.info, read: true),
    _AlertItem(kind: _AlertKind.streak, timeId: _AlertTimeId.yesterday, icon: '🔥', type: _AlertType.success, read: true),
    _AlertItem(kind: _AlertKind.sync, timeId: _AlertTimeId.yesterday, icon: '⚠️', type: _AlertType.warning),
  ];

  List<_AlertItem> get _filtered {
    switch (_filter) {
      case _AlertFilterTag.urgent:
        return _alerts.where((a) => a.type == _AlertType.urgent && !a.dismissed).toList();
      case _AlertFilterTag.unread:
        return _alerts.where((a) => !a.read && !a.dismissed).toList();
      case _AlertFilterTag.info:
        return _alerts.where((a) => a.type == _AlertType.info && !a.dismissed).toList();
      case _AlertFilterTag.all:
        return _alerts.where((a) => !a.dismissed).toList();
    }
  }
  int get _unreadCount => _alerts.where((a) => !a.read && !a.dismissed).length;

  @override void initState() { super.initState();
  _entryCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..forward(); }
  @override void dispose() { _entryCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: _aBg,
      body: Stack(children: [
        Positioned(
            top: -40,
            left: -40,
            child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [_electric.withOpacity(.07), Colors.transparent])))),
        Positioned(
            bottom: 200,
            right: -60,
            child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [_violet.withOpacity(.07), Colors.transparent])))),
        SafeArea(
            child: Column(children: [
          FadeTransition(
              opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(0, .45)),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                  child: Column(children: [
                    Row(children: [
                      _BackBtn(color: _aSurface, iconColor: _aTextPri),
                      const Spacer(),
                      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Text(l.alertsTitle,
                            style: const TextStyle(color: _aTextPri, fontSize: 18, fontWeight: FontWeight.w700)),
                        if (_unreadCount > 0)
                          Text(l.unreadCountBadge(_unreadCount),
                              style: const TextStyle(color: _electric, fontSize: 11, fontWeight: FontWeight.w500)),
                      ]),
                      const Spacer(),
                      GestureDetector(
                          onTap: () => setState(() {
                                for (final a in _alerts) {
                                  a.read = true;
                                }
                              }),
                          child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  color: _electric.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: _electric.withOpacity(.3))),
                              child: Text(l.readAll,
                                  style: const TextStyle(color: _electric, fontSize: 11, fontWeight: FontWeight.w600)))),
                    ]),
                    const SizedBox(height: 24),
                    Row(children: [
                      _AStatChip(
                          label: l.statTotal,
                          value: '${_alerts.where((a) => !a.dismissed).length}',
                          color: _aTextSec),
                      const SizedBox(width: 10),
                      _AStatChip(
                          label: l.statUrgent,
                          value:
                              '${_alerts.where((a) => a.type == _AlertType.urgent && !a.dismissed).length}',
                          color: _aRed),
                      const SizedBox(width: 10),
                      _AStatChip(label: l.statUnread, value: '$_unreadCount', color: _electric),
                      const SizedBox(width: 10),
                      _AStatChip(
                          label: l.statSuccess,
                          value:
                              '${_alerts.where((a) => a.type == _AlertType.success && !a.dismissed).length}',
                          color: _aGreen),
                    ]),
                  ]))),
          const SizedBox(height: 20),
          FadeTransition(
              opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(.2, .6)),
              child: SizedBox(
                  height: 36,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: _filters.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (_, i) {
                        final f = _filters[i];
                        final active = f == _filter;
                        final label = _alertFilterLabel(l, f);
                        return GestureDetector(
                            onTap: () => setState(() => _filter = f),
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                                decoration: BoxDecoration(
                                    color: active ? _electric.withOpacity(.15) : _aSurface,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color:
                                            active ? _electric.withOpacity(.6) : _aTextSec.withOpacity(.15))),
                                child: Text(label,
                                    style: TextStyle(
                                        color: active ? _electric : _aTextSec,
                                        fontSize: 12,
                                        fontWeight: active ? FontWeight.w700 : FontWeight.w500))));
                      }))),
          const SizedBox(height: 16),
          Divider(color: _aDivider, height: 1),
          const SizedBox(height: 4),
          Expanded(
              child: FadeTransition(
                  opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(.3, .9)),
                  child: _filtered.isEmpty
                      ? Center(
                          child: Column(mainAxisSize: MainAxisSize.min, children: [
                          const Text('✅', style: TextStyle(fontSize: 42)),
                          const SizedBox(height: 12),
                          Text(l.allClear,
                              style: const TextStyle(color: _aTextPri, fontSize: 18, fontWeight: FontWeight.w700)),
                          Text(l.noAlertsForFilter(_alertFilterLabel(l, _filter)),
                              style: const TextStyle(color: _aTextSec, fontSize: 13)),
                        ]))
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          itemCount: _filtered.length,
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (_, __) => const SizedBox(height: 2),
                          itemBuilder: (ctx, i) {
                            final alert = _filtered[i];
                            return _AlertTile(
                                alert: alert,
                                onRead: () => setState(() => alert.read = true),
                                onDismiss: () => setState(() => alert.dismissed = true));
                          }))),
        ])),
      ]),
    );
  }
}

class _AStatChip extends StatelessWidget {
  final String label, value; final Color color;
  const _AStatChip({required this.label, required this.value, required this.color});
  @override
  Widget build(BuildContext context) => Expanded(
      child: Container(padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(color: color.withOpacity(.08), borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withOpacity(.2))),
          child: Column(children: [
            Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(color: _aTextSec, fontSize: 10)),
          ])));
}

class _AlertTile extends StatefulWidget {
  final _AlertItem alert; final VoidCallback onRead, onDismiss;
  const _AlertTile({required this.alert, required this.onRead, required this.onDismiss});
  @override State<_AlertTile> createState() => _AlertTileState();
}
class _AlertTileState extends State<_AlertTile> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Offset> _slide;
  late Animation<double> _fade;
  @override void initState() { super.initState();
  _ctrl  = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  _slide = Tween<Offset>(begin: Offset.zero, end: const Offset(1.2, 0))
      .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInCubic));
  _fade  = Tween<double>(begin: 1, end: 0)
      .animate(CurvedAnimation(parent: _ctrl, curve: const Interval(.5, 1)));
  }
  @override void dispose() { _ctrl.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final a = widget.alert;
    return SlideTransition(
        position: _slide,
        child: FadeTransition(
            opacity: _fade,
            child: GestureDetector(
                onTap: widget.onRead,
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: a.read ? _aCard : _aCard.withBlue(45),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: a.read ? _aDivider : a.color.withOpacity(.25),
                            width: a.read ? 1 : 1.5)),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      if (!a.read)
                        Padding(
                            padding: const EdgeInsets.only(top: 6, right: 8),
                            child: Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: a.color))),
                      Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: a.color.withOpacity(.1), borderRadius: BorderRadius.circular(12)),
                          child: Center(child: Text(a.icon, style: const TextStyle(fontSize: 20)))),
                      const SizedBox(width: 12),
                      Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Expanded(
                              child: Text(_alertItemTitle(l, a.kind),
                                  style: TextStyle(
                                      color: _aTextPri,
                                      fontSize: 13,
                                      fontWeight: a.read ? FontWeight.w500 : FontWeight.w700))),
                          const SizedBox(width: 8),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(
                                  color: a.color.withOpacity(.12), borderRadius: BorderRadius.circular(6)),
                              child: Text(_alertTypeLabel(l, a.type),
                                  style: TextStyle(color: a.color, fontSize: 9, fontWeight: FontWeight.w700))),
                        ]),
                        const SizedBox(height: 4),
                        Text(_alertItemBody(l, a.kind),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: _aTextSec, fontSize: 12, height: 1.4)),
                        const SizedBox(height: 6),
                        Row(children: [
                          const Icon(Icons.access_time, color: _aTextSec, size: 11),
                          const SizedBox(width: 4),
                          Text(_alertItemTime(l, a.timeId),
                              style: const TextStyle(color: _aTextSec, fontSize: 10)),
                          const Spacer(),
                          GestureDetector(
                              onTap: () async {
                                await _ctrl.forward();
                                widget.onDismiss();
                              },
                              child: Text(l.dismiss,
                                  style: TextStyle(
                                      color: _aTextSec.withOpacity(.7),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600))),
                        ]),
                      ])),
                    ])))));
  }
}


// ════════════════════════════════════════════════════════════════════════════
//  SETTINGS PAGE
// ════════════════════════════════════════════════════════════════════════════
String _settingsThemeLabel(AppLocalizations l, String v) {
  return switch (v) {
    'System' => l.themeSystem,
    'Light' => l.themeLight,
    'Dark' => l.themeDark,
    'AMOLED' => l.themeAmoled,
    _ => v,
  };
}

String _settingsLanguageLabel(AppLocalizations l, String v) {
  return switch (v) {
    'English' => l.langEnglish,
    'Spanish' => l.langSpanish,
    'French' => l.langFrench,
    'Hindi' => l.langHindi,
    'Japanese' => l.langJapanese,
    _ => v,
  };
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {
  late AnimationController _entryCtrl;
  bool _pushNotifications = true, _emailDigest = false, _goalReminders = true,
      _weeklyReport = true, _haptics = true, _analytics = false, _syncCloud = true;
  String _displayName = '';

  @override void initState() { super.initState();
  _entryCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))..forward(); }
  @override void dispose() { _entryCtrl.dispose(); super.dispose(); }

  void _tapHaptic() { if (_haptics) HapticFeedback.selectionClick(); }

  void _toast(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  Future<void> _openEditProfile() async {
    _tapHaptic();
    final controller = TextEditingController(
      text: _displayName.isEmpty
          ? AppLocalizations.of(context).settingsProfileDefault
          : _displayName,
    );
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final dl = AppLocalizations.of(ctx);
        return AlertDialog(
          title: Text(dl.editProfile),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(labelText: dl.displayName),
            textCapitalization: TextCapitalization.words,
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(dl.cancel)),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(dl.save)),
          ],
        );
      },
    );
    if (ok == true && mounted) {
      final next = controller.text.trim();
      if (next.isNotEmpty) setState(() => _displayName = next);
      _toast(AppLocalizations.of(context).toastProfileUpdated);
    }
    controller.dispose();
  }

  Future<void> _openChangePassword() async {
    _tapHaptic();
    final p1 = TextEditingController();
    final p2 = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final dl = AppLocalizations.of(ctx);
        return AlertDialog(
          title: Text(dl.changePassword),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: p1,
                obscureText: true,
                decoration: InputDecoration(labelText: dl.newPassword),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: p2,
                obscureText: true,
                decoration: InputDecoration(labelText: dl.confirmPassword),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(dl.cancel)),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(dl.update)),
          ],
        );
      },
    );
    if (ok == true && mounted) {
      final l = AppLocalizations.of(context);
      if (p1.text.length < 8) {
        _toast(l.toastPasswordShort);
      } else if (p1.text != p2.text) {
        _toast(l.toastPasswordMismatch);
      } else {
        _toast(l.toastPasswordUpdated);
      }
    }
    p1.dispose();
    p2.dispose();
  }

  Future<void> _confirmSignOut() async {
    _tapHaptic();
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final dl = AppLocalizations.of(ctx);
        return AlertDialog(
          title: Text(dl.signOutTitle),
          content: Text(dl.signOutBody),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(dl.cancel)),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(dl.signOutAction)),
          ],
        );
      },
    );
    if (go == true && mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (r) => false);
    }
  }

  Future<void> _confirmDeleteAccount() async {
    _tapHaptic();
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final dl = AppLocalizations.of(ctx);
        return AlertDialog(
          title: Text(dl.deleteAccountTitle),
          content: Text(dl.deleteAccountBody),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(dl.cancel)),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(dl.deleteAction, style: const TextStyle(color: _sRed)),
            ),
          ],
        );
      },
    );
    if (go == true && mounted) _toast(AppLocalizations.of(context).toastAccountDeletion);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appPreferences,
      builder: (context, _) {
        final scheme = Theme.of(context).colorScheme;
        final l = AppLocalizations.of(context);
        return Scaffold(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    body: SafeArea(child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(child: FadeTransition(opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(0, .5)),
          child: Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(children: [
                _BackBtn(color: scheme.surface, iconColor: scheme.onSurface),
                const SizedBox(width: 16),
                Text(l.settingsTitle, style: TextStyle(color: scheme.onSurface, fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -.5)),
              ])))),
      const SliverToBoxAdapter(child: SizedBox(height: 24)),
      SliverToBoxAdapter(child: FadeTransition(opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(.1, .55)),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _openEditProfile,
                  borderRadius: BorderRadius.circular(20),
                  child: Ink(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(color: _sAccent, borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: _sAccent.withOpacity(.3), blurRadius: 20, offset: const Offset(0, 6))]),
                    child: Row(children: [
                      Container(width: 56, height: 56,
                          decoration: BoxDecoration(color: Colors.white.withOpacity(.2), shape: BoxShape.circle),
                          child: const Center(child: Text('👤', style: TextStyle(fontSize: 26)))),
                      const SizedBox(width: 16),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(_displayName.isEmpty ? l.settingsProfileDefault : _displayName,
                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 3),
                        Text(l.settingsProfileTap, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                      ])),
                      Container(padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(.15), borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14)),
                    ]),
                  ),
                ),
              )))),
      const SliverToBoxAdapter(child: SizedBox(height: 24)),
      _SSection(title: l.settingsFitness, icon: '🏃', ctrl: _entryCtrl, interval: const Interval(.12, .58)),
      _SGroup(ctrl: _entryCtrl, interval: const Interval(.15, .62), children: [
        _SNav(icon: Icons.directions_run, iconColor: const Color(0xFF2ECC71), title: l.settingsStepGoals, titleColor: null,
            onTap: () { _tapHaptic(); Navigator.pushNamed(context, '/goals'); }),
        _SDivider(),
        _SNav(icon: Icons.explore_outlined, iconColor: const Color(0xFF6200EA), title: l.settingsExploreArticles, titleColor: null,
            onTap: () { _tapHaptic(); Navigator.pushNamed(context, '/explore'); }),
      ]),
      const SliverToBoxAdapter(child: SizedBox(height: 20)),
      _SSection(title: l.settingsNotifications, icon: '🔔', ctrl: _entryCtrl, interval: const Interval(.2, .6)),
      _SGroup(ctrl: _entryCtrl, interval: const Interval(.25, .65), children: [
        _SToggle(icon: Icons.notifications_active_outlined, iconColor: _sAccent, title: l.settingsPush, subtitle: l.settingsPushSub, value: _pushNotifications,
            onChanged: (v) { _tapHaptic(); setState(() => _pushNotifications = v); }),
        _SDivider(),
        _SToggle(icon: Icons.email_outlined, iconColor: const Color(0xFF00897B), title: l.settingsEmailDigest, subtitle: l.settingsEmailDigestSub, value: _emailDigest,
            onChanged: (v) { _tapHaptic(); setState(() => _emailDigest = v); }),
        _SDivider(),
        _SToggle(icon: Icons.flag_outlined, iconColor: _sAmber, title: l.settingsGoalReminders, subtitle: l.settingsGoalRemindersSub, value: _goalReminders,
            onChanged: (v) { _tapHaptic(); setState(() => _goalReminders = v); }),
        _SDivider(),
        _SToggle(icon: Icons.bar_chart_outlined, iconColor: const Color(0xFF6200EA), title: l.settingsWeeklyReport, subtitle: l.settingsWeeklyReportSub, value: _weeklyReport,
            onChanged: (v) { _tapHaptic(); setState(() => _weeklyReport = v); }),
      ]),
      const SliverToBoxAdapter(child: SizedBox(height: 20)),
      _SSection(title: l.settingsAppearance, icon: '🎨', ctrl: _entryCtrl, interval: const Interval(.35, .75)),
      _SGroup(ctrl: _entryCtrl, interval: const Interval(.4, .8), children: [
        _SToggle(icon: Icons.dark_mode_outlined, iconColor: scheme.onSurface, title: l.settingsDarkMode, subtitle: l.settingsDarkModeSub, value: appPreferences.darkModeSwitchValue,
            onChanged: (v) async {
          _tapHaptic();
          await appPreferences.setDarkModeSwitch(v);
          if (context.mounted) _toast(v ? l.toastDarkOn : l.toastDarkOff);
        }),
        _SDivider(),
        _SSelect(icon: Icons.palette_outlined, iconColor: const Color(0xFFE91E63), title: l.settingsTheme,
            value: _settingsThemeLabel(l, appPreferences.themeOption),
            options: const ['System','Light','Dark','AMOLED'],
            displayForOption: (o) => _settingsThemeLabel(l, o),
            onChanged: (v) async {
          _tapHaptic();
          await appPreferences.setThemeOption(v);
          if (context.mounted) {
            final loc = AppLocalizations.of(context);
            _toast(loc.toastThemeApplied(_settingsThemeLabel(loc, v)));
          }
        }),
        _SDivider(),
        _SSelect(icon: Icons.language_outlined, iconColor: const Color(0xFF00BCD4), title: l.settingsLanguage,
            value: _settingsLanguageLabel(l, appPreferences.languageLabel),
            options: const ['English','Spanish','French','Tamil','Hindi','Japanese'],
            displayForOption: (o) => _settingsLanguageLabel(l, o),
            onChanged: (v) async {
          _tapHaptic();
          await appPreferences.setLanguageLabel(v);
          if (context.mounted) {
            final loc = AppLocalizations.of(context);
            _toast(loc.toastLanguageApplied(_settingsLanguageLabel(loc, v)));
          }
        }),
      ]),
      const SliverToBoxAdapter(child: SizedBox(height: 20)),
      _SSection(title: l.settingsPrivacy, icon: '🔒', ctrl: _entryCtrl, interval: const Interval(.5, .85)),
      _SGroup(ctrl: _entryCtrl, interval: const Interval(.55, .9), children: [
        _SToggle(icon: Icons.vibration_outlined, iconColor: const Color(0xFF00897B), title: l.settingsHaptics, subtitle: l.settingsHapticsSub, value: _haptics,
            onChanged: (v) => setState(() => _haptics = v)),
        _SDivider(),
        _SToggle(icon: Icons.analytics_outlined, iconColor: _sSlateMid, title: l.settingsAnalytics, subtitle: l.settingsAnalyticsSub, value: _analytics,
            onChanged: (v) { _tapHaptic(); setState(() => _analytics = v); }),
        _SDivider(),
        _SToggle(icon: Icons.cloud_sync_outlined, iconColor: _sAccent, title: l.settingsCloudSync, subtitle: l.settingsCloudSyncSub, value: _syncCloud,
            onChanged: (v) { _tapHaptic(); setState(() => _syncCloud = v); }),
      ]),
      const SliverToBoxAdapter(child: SizedBox(height: 20)),
      _SSection(title: l.settingsAccount, icon: '⚙️', ctrl: _entryCtrl, interval: const Interval(.6, .95)),
      _SGroup(ctrl: _entryCtrl, interval: const Interval(.65, 1.0), children: [
        _SNav(icon: Icons.lock_reset_outlined, iconColor: _sAmber, title: l.settingsChangePassword, titleColor: null, onTap: _openChangePassword),
        _SDivider(),
        _SNav(icon: Icons.logout_outlined, iconColor: _sSlateMid, title: l.settingsSignOut, titleColor: null, onTap: _confirmSignOut),
        _SDivider(),
        _SNav(icon: Icons.delete_forever_outlined, iconColor: _sRed, title: l.settingsDeleteAccount, titleColor: _sRed, onTap: _confirmDeleteAccount),
      ]),
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.all(24),
          child: Center(child: Text(l.settingsVersion,
              style: TextStyle(color: scheme.onSurface.withValues(alpha: 0.55), fontSize: 11))))),
    ])),
        );
      },
    );
  }
}

class _SSection extends StatelessWidget {
  final String title, icon; final AnimationController ctrl; final Interval interval;
  const _SSection({required this.title, required this.icon, required this.ctrl, required this.interval});
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SliverToBoxAdapter(child: FadeTransition(
        opacity: CurvedAnimation(parent: ctrl, curve: interval),
        child: Padding(padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
            child: Row(children: [
              Text(icon, style: const TextStyle(fontSize: 14)), const SizedBox(width: 8),
              Text(title, style: TextStyle(color: cs.onSurface.withValues(alpha: 0.65), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: .5)),
            ]))));
  }
}

class _SGroup extends StatelessWidget {
  final List<Widget> children; final AnimationController ctrl; final Interval interval;
  const _SGroup({required this.children, required this.ctrl, required this.interval});
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SliverToBoxAdapter(child: FadeTransition(
        opacity: CurvedAnimation(parent: ctrl, curve: interval),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                decoration: BoxDecoration(color: cs.surface, borderRadius: BorderRadius.circular(18),
                    boxShadow: [BoxShadow(color: cs.shadow.withValues(alpha: 0.07), blurRadius: 12, offset: const Offset(0, 3))]),
                child: Column(children: children)))));
  }
}

class _SToggle extends StatelessWidget {
  final IconData icon; final Color iconColor; final String title, subtitle;
  final bool value; final ValueChanged<bool> onChanged;
  const _SToggle({required this.icon, required this.iconColor, required this.title,
    required this.subtitle, required this.value, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(children: [
          Container(padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: iconColor, size: 18)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(color: cs.onSurface, fontSize: 14, fontWeight: FontWeight.w600)),
            Text(subtitle, style: TextStyle(color: cs.onSurface.withValues(alpha: 0.58), fontSize: 11)),
          ])),
          CupertinoSwitch(value: value, onChanged: onChanged, activeColor: cs.primary, trackColor: cs.outline.withValues(alpha: 0.35)),
        ]));
  }
}

class _SSelect extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final List<String> options;
  final String Function(String option) displayForOption;
  final ValueChanged<String> onChanged;
  const _SSelect({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.options,
    required this.displayForOption,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context);
    return GestureDetector(
      onTap: () => showCupertinoModalPopup(
          context: context,
          builder: (sheetCtx) => CupertinoActionSheet(
              title: Text(l.selectOption(title)),
              actions: options
                  .map((o) => CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(sheetCtx);
                        WidgetsBinding.instance.addPostFrameCallback((_) => onChanged(o));
                      },
                      child: Text(displayForOption(o),
                          style: TextStyle(
                              color: o == value ? cs.primary : cs.onSurface,
                              fontWeight: o == value ? FontWeight.w700 : FontWeight.w400))))
                  .toList(),
              cancelButton: CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(sheetCtx), child: Text(l.cancel)))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: iconColor, size: 18)),
            const SizedBox(width: 14),
            Expanded(
                child: Text(title, style: TextStyle(color: cs.onSurface, fontSize: 14, fontWeight: FontWeight.w600))),
            Text(value, style: TextStyle(color: cs.onSurface.withValues(alpha: 0.65), fontSize: 13)),
            const SizedBox(width: 6),
            Icon(Icons.arrow_forward_ios, color: cs.onSurface.withValues(alpha: 0.45), size: 12),
          ])));
  }
}

class _SNav extends StatelessWidget {
  final IconData icon; final Color iconColor; final Color? titleColor; final String title; final VoidCallback onTap;
  const _SNav({required this.icon, required this.iconColor, required this.title, required this.titleColor, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(onTap: onTap,
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(children: [
              Container(padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
                  child: Icon(icon, color: iconColor, size: 18)),
              const SizedBox(width: 14),
              Expanded(child: Text(title, style: TextStyle(color: titleColor ?? cs.onSurface, fontSize: 14, fontWeight: FontWeight.w600))),
              Icon(Icons.arrow_forward_ios, color: cs.onSurface.withValues(alpha: 0.45), size: 12),
            ])));
  }
}

class _SDivider extends StatelessWidget {
  @override Widget build(BuildContext context) =>
      Padding(padding: const EdgeInsets.only(left: 58), child: Divider(color: Theme.of(context).dividerColor, height: 1));
}


// ════════════════════════════════════════════════════════════════════════════
//  SHARED BACK BUTTON
// ════════════════════════════════════════════════════════════════════════════
class _BackBtn extends StatelessWidget {
  final Color color, iconColor;
  final Color? borderColor;
  const _BackBtn({required this.color, required this.iconColor, this.borderColor});
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => Navigator.maybePop(context),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Icon(Icons.arrow_back_ios_new, color: iconColor, size: 16),
    ),
  );
}