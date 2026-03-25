import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:pedometer/pedometer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';

import 'app_preferences.dart';
import 'l10n/app_localizations.dart';

class SetGoalsPage extends StatefulWidget {
  const SetGoalsPage({super.key});

  @override
  State<SetGoalsPage> createState() => _SetGoalsPageState();
}

enum _GoalKind { fitness, savings, reading }

class _SetGoalsPageState extends State<SetGoalsPage> {
  static const double _kmPerStep = 0.0008;
  static const int _dailyStepTarget = 8000;

  late Stream<StepCount> _stepStream;
  int _steps = 0;
  double _distanceKm = 0;

  int _screenSeconds = 0;
  Timer? _productivityTimer;

  Map<String, int> _dailySteps = {
    "Mon": 0,
    "Tue": 0,
    "Wed": 0,
    "Thu": 0,
    "Fri": 0,
    "Sat": 0,
    "Sun": 0,
  };

  late final List<_Goal> _goals;

  double get _monthlyTargetKm {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    return daysInMonth * _dailyStepTarget * _kmPerStep;
  }

  String _formatMoney(int dollars) {
    return NumberFormat.simpleCurrency(
      locale: appPreferences.locale.toString(),
      decimalDigits: 0,
    ).format(dollars);
  }

  void _applyGoalStrings(AppLocalizations l) {
    final deadline = _monthDeadlineLabel(l);
    _goals[0].title = l.goalsRunMonth(_monthlyTargetKm.toStringAsFixed(0));
    _goals[0].category = l.goalsCategoryFitness;
    _goals[0].deadline = deadline;

    _goals[1].title = l.goalsSavingsMonth(_formatMoney(_goals[1].savingsTarget));
    _goals[1].category = l.goalsCategorySavings;
    _goals[1].deadline = deadline;

    _goals[2].title = l.goalsReadingMonth(_goals[2].booksTarget);
    _goals[2].category = l.goalsCategoryReading;
    _goals[2].deadline = deadline;
  }

  @override
  void initState() {
    super.initState();
    _goals = [
      _Goal(
        kind: _GoalKind.fitness,
        title: '',
        category: '',
        deadline: '',
        color: const Color(0xFF2ECC71),
        icon: '🏃',
        steps: 0,
        distance: 0,
        savingsCurrent: 0,
        savingsTarget: 2500,
        booksRead: 0,
        booksTarget: 0,
      ),
      _Goal(
        kind: _GoalKind.savings,
        title: '',
        category: '',
        deadline: '',
        color: const Color(0xFFE6A23C),
        icon: '💰',
        steps: 0,
        distance: 0,
        savingsCurrent: 1847,
        savingsTarget: 2500,
        booksRead: 0,
        booksTarget: 0,
      ),
      _Goal(
        kind: _GoalKind.reading,
        title: '',
        category: '',
        deadline: '',
        color: const Color(0xFF6C7CE7),
        icon: '📚',
        steps: 0,
        distance: 0,
        savingsCurrent: 0,
        savingsTarget: 0,
        booksRead: 3,
        booksTarget: 5,
      ),
    ];
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      initPedometer();
    }

    _productivityTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _screenSeconds++;
      });
    });
  }

  @override
  void dispose() {
    _productivityTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _applyGoalStrings(AppLocalizations.of(context));
  }

  String _monthDeadlineLabel(AppLocalizations l) {
    final end = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    final month = switch (end.month) {
      1 => l.monthJan,
      2 => l.monthFeb,
      3 => l.monthMar,
      4 => l.monthApr,
      5 => l.monthMay,
      6 => l.monthJun,
      7 => l.monthJul,
      8 => l.monthAug,
      9 => l.monthSep,
      10 => l.monthOct,
      11 => l.monthNov,
      _ => l.monthDec,
    };
    return '$month ${end.day}';
  }

  String _weekdayLabel(AppLocalizations l, String key) {
    return switch (key) {
      'Mon' => l.weekdayMon,
      'Tue' => l.weekdayTue,
      'Wed' => l.weekdayWed,
      'Thu' => l.weekdayThu,
      'Fri' => l.weekdayFri,
      'Sat' => l.weekdaySat,
      'Sun' => l.weekdaySun,
      _ => key,
    };
  }

  void initPedometer() async {
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      try {
        if (await Permission.activityRecognition.request().isGranted) {
          _stepStream = Pedometer.stepCountStream;
          _stepStream.listen(onStepUpdate).onError(onStepError);
        } else {
          debugPrint('Activity recognition permission denied');
        }
      } catch (e) {
        debugPrint('Pedometer not supported on this platform: $e');
      }
    }
  }

  void onStepUpdate(StepCount event) {
    setState(() {
      _steps = event.steps;
      _distanceKm = _steps * _kmPerStep;

      _goals[0].steps = _steps;
      _goals[0].distance = _distanceKm;
      _applyGoalStrings(lookupAppLocalizations(appPreferences.locale));

      final today = _getToday();
      _dailySteps[today] = _steps;
    });
  }

  void onStepError(Object error) {
    debugPrint('Step error: $error');
  }

  String _getToday() {
    const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return days[DateTime.now().weekday - 1];
  }

  Future<void> _editGoalDialog(_Goal g) async {
    final isSavings = g.kind == _GoalKind.savings;
    final ctrl = TextEditingController(
      text: isSavings ? appPreferences.savingsCurrent.toString() : appPreferences.studyMinutes.toString(),
    );

    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isSavings ? 'Update Savings' : 'Update Study Time'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: isSavings ? 'Enter amount saved' : 'Enter time studied (mins)',
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, ctrl.text), child: const Text('Save')),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      final val = int.tryParse(result);
      if (val != null) {
        if (isSavings) {
          appPreferences.setSavingsCurrent(val);
        } else {
          appPreferences.addStudyMinutes(val - appPreferences.studyMinutes);
        }
      }
    }
  }


  double _goalProgress(_Goal g) {
    return switch (g.kind) {
      _GoalKind.fitness =>
        (g.distance / _monthlyTargetKm).clamp(0.0, 1.0),
      _GoalKind.savings =>
        (appPreferences.savingsCurrent / g.savingsTarget).clamp(0.0, 1.0),
      _GoalKind.reading =>
        (appPreferences.studyMinutes / g.booksTarget).clamp(0.0, 1.0),
    };
  }

  Widget _buildGoalCard(AppLocalizations l, _Goal g) {
    return GestureDetector(
      onTap: g.kind != _GoalKind.fitness ? () => _editGoalDialog(g) : null,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF122018),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: g.color.withValues(alpha: 0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              Text(g.icon, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 10),
              Text(
                g.category,
                style: TextStyle(
                  color: g.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            g.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...switch (g.kind) {
            _GoalKind.fitness => [
              Text(
                l.goalsStepsLabel(g.steps),
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                l.goalsDistanceKm(g.distance.toStringAsFixed(2)),
                style: const TextStyle(color: Colors.white),
              ),
            ],
            _GoalKind.savings => [
              Text(
                '${_formatMoney(appPreferences.savingsCurrent)} / ${_formatMoney(g.savingsTarget)}',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
            _GoalKind.reading => [
              Text(
                l.goalsBooksProgress(appPreferences.studyMinutes, g.booksTarget),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          },
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: _goalProgress(g),
              minHeight: 8,
              backgroundColor: Colors.grey.shade800,
              color: g.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.goalsDeadline(g.deadline),
            style: const TextStyle(color: Colors.white54, fontSize: 13),
          ),
        ],
      ),
    ));
  }


  String _formatDuration(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  Widget _buildStatColumn(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final studyMins = appPreferences.studyMinutes;

    return Scaffold(
      backgroundColor: const Color(0xFF060F0A),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              l.goalsTitle,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF16251C),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF2ECC71).withValues(alpha: 0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn('Screen Time', _formatDuration(_screenSeconds), const Color(0xFF2ECC71)),
                  _buildStatColumn('Study Time', '$studyMins MIN', const Color(0xFFE6A23C)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 180,
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 75,
                      startDegreeOffset: 270,
                      sections: [
                        PieChartSectionData(
                          value: _distanceKm,
                          color: _goals[0].color,
                          title: '',
                          radius: 10,
                        ),
                        PieChartSectionData(
                          value: (_monthlyTargetKm - _distanceKm).clamp(0.0, double.infinity),
                          color: Colors.grey.shade800,
                          title: '',
                          radius: 10,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l.goalsDistanceKm(_distanceKm.toStringAsFixed(2)),
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        l.goalsSteps(_steps),
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l.goalsWeeklySteps,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: BarChart(
                BarChartData(
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final days = _dailySteps.keys.toList();
                          final i = value.toInt();
                          if (i < 0 || i >= days.length) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            _weekdayLabel(l, days[i]),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: _dailySteps.values
                      .toList()
                      .asMap()
                      .entries
                      .map((e) => BarChartGroupData(
                            x: e.key,
                            barRods: [
                              BarChartRodData(
                                toY: e.value.toDouble(),
                                color: _goals[0].color,
                                width: 14,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: AnimatedBuilder(
                animation: appPreferences,
                builder: (context, child) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    itemCount: _goals.length,
                    itemBuilder: (context, index) {
                      return _buildGoalCard(l, _goals[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Goal {
  final _GoalKind kind;
  String title;
  String category;
  String deadline;
  Color color;
  String icon;
  int steps;
  double distance;
  int savingsCurrent;
  int savingsTarget;
  int booksRead;
  int booksTarget;

  _Goal({
    required this.kind,
    required this.title,
    required this.category,
    required this.deadline,
    required this.color,
    required this.icon,
    required this.steps,
    required this.distance,
    required this.savingsCurrent,
    required this.savingsTarget,
    required this.booksRead,
    required this.booksTarget,
  });
}
