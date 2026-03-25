import 'package:flutter/material.dart';
import 'app_preferences.dart';

// ══════════════════════════════════════════════════════════
//  EXPLORE PAGE
//  Warm cream + ink — editorial magazine feel
// ══════════════════════════════════════════════════════════

void main() => runApp(const _App());

class _App extends StatelessWidget {
  const _App();
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: const ExplorePage(),
  );
}

// ─── Palette ──────────────────────────────────────────────
const _bg = Color(0xFFF9F5EE);
const _ink = Color(0xFF1A1208);
const _inkMid = Color(0xFF4A3F2F);
const _inkLight = Color(0xFF9B8E7A);
const _cream = Color(0xFFF0E8D8);
const _rust = Color(0xFFD4603A);
const _cobalt = Color(0xFF2B4590);
const _sage = Color(0xFF4A7C59);
const _mustard = Color(0xFFD4A017);
const _cardBg = Color(0xFFFFFFFF);

// ─── Model ────────────────────────────────────────────────
class _Article {
  final String title, category, readTime, emoji, author;
  final Color accent;
  bool saved;
  _Article({required this.title, required this.category, required this.readTime,
    required this.emoji, required this.author, required this.accent, this.saved = false});
}

// ─── Page ─────────────────────────────────────────────────
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _entryCtrl;
  String _activeCategory = 'All';
  final Stopwatch _stopwatch = Stopwatch();

  final _categories = ['All', 'Tech', 'Design', 'Wellness', 'Finance', 'Science'];

  final List<_Article> _featured = [
    _Article(title: 'The Future of Human-Computer Interaction', category: 'Tech', readTime: '6 min', emoji: '🖥️', author: 'A. Chen', accent: _cobalt),
    _Article(title: 'Design Systems That Scale With Your Team', category: 'Design', readTime: '4 min', emoji: '🎨', author: 'M. Patel', accent: _rust),
    _Article(title: 'Morning Rituals of High Performers', category: 'Wellness', readTime: '5 min', emoji: '🌅', author: 'S. Okafor', accent: _sage),
  ];

  final List<_Article> _latest = [
    _Article(title: 'Index Funds vs Active Portfolio Management', category: 'Finance', readTime: '8 min', emoji: '📈', author: 'J. Rivera', accent: _mustard),
    _Article(title: 'Neural Plasticity and Learning New Skills', category: 'Science', readTime: '7 min', emoji: '🧠', author: 'Dr. K. Lin', accent: _cobalt),
    _Article(title: 'Micro-interactions: Small Details, Big Impact', category: 'Design', readTime: '3 min', emoji: '✨', author: 'T. Brooks', accent: _rust),
    _Article(title: 'Building Habits That Actually Stick', category: 'Wellness', readTime: '5 min', emoji: '⚡', author: 'R. Nguyen', accent: _sage),
    _Article(title: 'GPT-5 and the Reasoning Revolution', category: 'Tech', readTime: '9 min', emoji: '🤖', author: 'E. Walsh', accent: _inkMid),
  ];

  List<_Article> get _filteredLatest => _activeCategory == 'All'
      ? _latest
      : _latest.where((a) => a.category == _activeCategory).toList();

  @override
  void initState() {
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

  @override
  void dispose() { 
    WidgetsBinding.instance.removeObserver(this);
    _stopwatch.stop();
    _syncTime();
    _entryCtrl.dispose(); 
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Header ──
            SliverToBoxAdapter(
              child: FadeTransition(
                opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(0, 0.4)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.maybePop(context),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: _cream,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: _inkLight.withOpacity(0.3)),
                              ),
                              child: const Icon(Icons.arrow_back_ios_new, color: _ink, size: 16),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: _ink,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(children: [
                              Icon(Icons.search, color: Colors.white, size: 14),
                              SizedBox(width: 6),
                              Text('Search', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      const Text('Explore', style: TextStyle(color: _ink, fontSize: 40, fontWeight: FontWeight.w900, letterSpacing: -1.5, height: 1)),
                      const SizedBox(height: 6),
                      const Text('Curated reads, just for you', style: TextStyle(color: _inkLight, fontSize: 14, letterSpacing: 0.2)),
                    ],
                  ),
                ),
              ),
            ),

            // ── Category Pills ──
            SliverToBoxAdapter(
              child: FadeTransition(
                opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(0.15, 0.55)),
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
                              color: active ? _ink : _cream,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active ? _ink : _inkLight.withOpacity(0.25)),
                            ),
                            child: Text(cat, style: TextStyle(
                              color: active ? Colors.white : _inkMid,
                              fontSize: 13, fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                            )),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            // ── Featured Section ──
            SliverToBoxAdapter(
              child: FadeTransition(
                opacity: CurvedAnimation(parent: _entryCtrl, curve: const Interval(0.25, 0.65)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                      child: Row(children: [
                        Container(width: 3, height: 18, decoration: BoxDecoration(color: _rust, borderRadius: BorderRadius.circular(2))),
                        const SizedBox(width: 10),
                        const Text('Featured', style: TextStyle(color: _ink, fontSize: 16, fontWeight: FontWeight.w800)),
                      ]),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: _featured.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 14),
                        itemBuilder: (_, i) => _FeaturedCard(article: _featured[i]),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Latest Section ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
                child: Row(children: [
                  Container(width: 3, height: 18, decoration: BoxDecoration(color: _cobalt, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(width: 10),
                  const Text('Latest', style: TextStyle(color: _ink, fontSize: 16, fontWeight: FontWeight.w800)),
                  const Spacer(),
                  Text('${_filteredLatest.length} articles', style: const TextStyle(color: _inkLight, fontSize: 12)),
                ]),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (ctx, i) {
                    final article = _filteredLatest[i];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _LatestCard(
                        article: article,
                        onSave: () => setState(() => article.saved = !article.saved),
                      ),
                    );
                  },
                  childCount: _filteredLatest.length,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}

// ─── Featured Card ────────────────────────────────────────
class _FeaturedCard extends StatelessWidget {
  final _Article article;
  const _FeaturedCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: article.accent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: article.accent.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(article.emoji, style: const TextStyle(fontSize: 28)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
              child: Text(article.readTime, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
            ),
          ]),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
            child: Text(article.category, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
          ),
          const SizedBox(height: 8),
          Text(article.title,
              maxLines: 2, overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800, height: 1.3)),
          const SizedBox(height: 8),
          Text('by ${article.author}', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11)),
        ],
      ),
    );
  }
}

// ─── Latest Card ──────────────────────────────────────────
class _LatestCard extends StatefulWidget {
  final _Article article;
  final VoidCallback onSave;
  const _LatestCard({required this.article, required this.onSave});

  @override
  State<_LatestCard> createState() => _LatestCardState();
}

class _LatestCardState extends State<_LatestCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _cardBg,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: _ink.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 3))],
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: widget.article.accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(child: Text(widget.article.emoji, style: const TextStyle(fontSize: 24))),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.article.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: _ink, fontSize: 13, fontWeight: FontWeight.w700, height: 1.3)),
                    const SizedBox(height: 5),
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: widget.article.accent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(widget.article.category, style: TextStyle(color: widget.article.accent, fontSize: 9, fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(width: 8),
                      Text('${widget.article.readTime} read', style: const TextStyle(color: _inkLight, fontSize: 10)),
                      const SizedBox(width: 8),
                      Text('• ${widget.article.author}', style: const TextStyle(color: _inkLight, fontSize: 10)),
                    ]),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: widget.onSave,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    widget.article.saved ? Icons.bookmark : Icons.bookmark_outline,
                    key: ValueKey(widget.article.saved),
                    color: widget.article.saved ? widget.article.accent : _inkLight,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
