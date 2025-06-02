import 'package:flutter/material.dart';
import 'utils.dart'; // Import helpers
import 'models/plant_model.dart';

// --- TrackerCard (Updated with Left Purple Line) ---
class TrackerCard extends StatelessWidget {
  final Widget child;
  const TrackerCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E5F5),
        borderRadius: BorderRadius.circular(20.0),
        border: Border(
          left: BorderSide(color: Colors.purple.withOpacity(0.7), width: 6.0),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.purple.withOpacity(0.20),
              offset: const Offset(6, 6),
              blurRadius: 12,
              spreadRadius: 1),
          BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: const Offset(-6, -6),
              blurRadius: 12,
              spreadRadius: 1),
        ],
      ),
      child: child,
    );
  }
}

// --- MiniBarChart ---
class MiniBarChart extends StatelessWidget {
  final List<Color> colors;
  final List<double> heights;
  final double barWidth;
  final double spacing;

  MiniBarChart({
    super.key,
    required this.colors,
    required this.heights,
    this.barWidth = 7.0,
    this.spacing = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    assert(colors.length == heights.length);
    return SizedBox(
      height: 35,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(colors.length, (index) {
            final color = colors[index];
            return Container(
                width: barWidth,
                height: 30 * heights[index],
                margin: EdgeInsets.only(left: spacing),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [lightenColor(color), darkenColor(color)]),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1, 1),
                          blurRadius: 1)
                    ]));
          })),
    );
  }
}

// --- SegmentedBarChart ---
class SegmentedBarChart extends StatelessWidget {
  final List<Color> colors;
  final double height;
  SegmentedBarChart({super.key, required this.colors, this.height = 15.0});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: -1),
              BoxShadow(
                  color: Colors.white54,
                  offset: Offset(-1, -1),
                  blurRadius: 2,
                  spreadRadius: -1)
            ]),
        clipBehavior: Clip.antiAlias,
        child: Row(
            children: colors
                .map((color) => Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                          lightenColor(color, 0.05),
                          darkenColor(color, 0.05)
                        ])))))
                .toList()));
  }
}

// --- Individual Card Widgets ---

class BurnoutTrackerCard extends StatelessWidget {
  const BurnoutTrackerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return TrackerCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        const Icon(Icons.local_fire_department,
            color: Colors.orange, shadows: iconShadows),
        const SizedBox(width: 8),
        const Expanded(
            child: Text('Burnout Tracker',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        MiniBarChart(colors: [
          Colors.purple[600]!, Colors.purple[500]!, Colors.purple[400]!,
          Colors.purple[300]!, Colors.purple[600]!, Colors.purple[400]!,
          Colors.purple[600]!
        ], heights: const [
          0.8, 0.6, 0.4, 0.7, 0.9, 0.5, 0.8
        ]),
      ]),
      const SizedBox(height: 4),
      Text('Current Score: 68% (High)',
          style: TextStyle(color: Colors.grey[700], fontSize: 14)),
    ]));
  }
}

class HappinessTrackerCard extends StatelessWidget {
  HappinessTrackerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return TrackerCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [
        Icon(Icons.sentiment_satisfied,
            color: Colors.orange, shadows: iconShadows),
        SizedBox(width: 8),
        Text('Happiness Tracker',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
      ]),
      const SizedBox(height: 8),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              7,
              (index) => const Icon(Icons.sentiment_satisfied,
                  color: Colors.orange, size: 28, shadows: iconShadows))),
      Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text('Last 7 days',
              style: TextStyle(color: Colors.grey[700], fontSize: 14))),
    ]));
  }
}

class MoodTrackerCard extends StatelessWidget {
  const MoodTrackerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return TrackerCard(
        child: Row(children: [
      const Icon(Icons.sentiment_neutral,
          color: Colors.orange, shadows: iconShadows, size: 40),
      const SizedBox(width: 16),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Mood Tracker',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        const SizedBox(height: 6),
        Row(children: [
          Text("Today's Mood: ",
              style: TextStyle(fontSize: 15, color: Colors.grey[700])),
          const Icon(Icons.sentiment_neutral,
              color: Colors.orange, shadows: iconShadows, size: 18),
          const Text(" Neutral",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
        ]),
      ])),
    ]));
  }
}

class TodayEnergyCard extends StatelessWidget {
  TodayEnergyCard({super.key});
  @override
  Widget build(BuildContext context) {
    return TrackerCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [
        Icon(Icons.calendar_today,
            color: Colors.purple, size: 20, shadows: iconShadows),
        SizedBox(width: 8),
        Text("Today's Energy",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
      ]),
      const SizedBox(height: 8),
      Row(children: [
        Text('Morning: High ',
            style: TextStyle(color: Colors.grey[700], fontSize: 14)),
        const Icon(Icons.wb_sunny,
            color: Colors.orange, size: 20, shadows: iconShadows),
        const SizedBox(width: 8),
        Expanded(
            child: SegmentedBarChart(colors: [
          Colors.purple[200]!, Colors.purple[200]!, Colors.purple[300]!,
          Colors.purple[300]!, Colors.purple[400]!, Colors.purple[600]!,
          Colors.purple[400]!, Colors.purple[300]!, Colors.purple[300]!,
          Colors.purple[200]!, Colors.purple[200]!
        ])),
      ]),
    ]));
  }
}
class AiRitualCard extends StatelessWidget {
  const AiRitualCard({super.key});
  @override
  Widget build(BuildContext context) {
    return TrackerCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        const Icon(Icons.lightbulb_outline,
            color: Colors.purple, shadows: iconShadows),
        const SizedBox(width: 8),
        const Expanded(
            child: Text('AI Ritual Suggestion',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis)),
        MiniBarChart(colors: [
          Colors.purple[300]!, Colors.purple[600]!, Colors.purple[600]!,
          Colors.purple[300]!, Colors.purple[600]!, Colors.purple[600]!,
          Colors.purple[600]!
        ], heights: const [
          0.7, 1.0, 1.0, 0.7, 1.0, 1.0, 1.0
        ]),
      ]),
      const SizedBox(height: 4),
      Text('10-min Pranayama for Balance',
          style: TextStyle(color: Colors.grey[700], fontSize: 14)),
    ]));
  }
}

class TodayPlannerCard extends StatelessWidget {
  const TodayPlannerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return TrackerCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        const Icon(Icons.check_circle_outline,
            color: Colors.green, shadows: iconShadows),
        const SizedBox(width: 8),
        const Expanded(
            child: Text("Today's Planner",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis)),
        MiniBarChart(colors: [
          Colors.pink[200]!, Colors.orange[300]!, Colors.yellow[600]!,
          Colors.blueGrey[300]!
        ], heights: const [
          0.5, 0.8, 1.0, 0.4
        ]),
      ]),
      const SizedBox(height: 4),
      Text('Yoga, Journal, Bhajan Ready',
          style: TextStyle(color: Colors.grey[700], fontSize: 14)),
    ]));
  }
}

class ConsistencyTrackerCard extends StatelessWidget {
  const ConsistencyTrackerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return TrackerCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [
        Icon(Icons.bar_chart, color: Colors.purple, shadows: iconShadows),
        SizedBox(width: 8),
        Text('Consistency Tracker',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
      ]),
      const SizedBox(height: 4),
      Text('Journal: 3 days | Flow: 2 days',
          style: TextStyle(color: Colors.grey[700], fontSize: 14)),
    ]));
  }
}


class MeditationSessionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final VoidCallback onTap;

  const MeditationSessionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 60,
                    width: 60,
                    color: Colors.grey[200],
                    child: const Icon(Icons.spa, size: 30, color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black54)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressGardenStrip extends StatelessWidget {
  final List<Plant> plants;
  final Function(String plantType) onPlantTap;

  const ProgressGardenStrip({
    super.key,
    required this.plants,
    required this.onPlantTap,
  });

  String _getPlantAssetPath(String plantTypeId, PlantGrowthStage stage) {
    switch (plantTypeId) {
      case 'consistency_flower':
        switch (stage) {
          case PlantGrowthStage.SEEDLING:
            return 'assets/images/garden/flower_seedling.png';
          case PlantGrowthStage.SPROUT:
            return 'assets/images/garden/flower_sprout.png';
          case PlantGrowthStage.BUD:
            return 'assets/images/garden/flower_bud.png';
          case PlantGrowthStage.BLOOM:
            return 'assets/images/garden/flower_bloom.png';
        }
      case 'milestone_bush':
        switch (stage) {
          case PlantGrowthStage.SEEDLING:
            return 'assets/images/garden/bush_seedling.png';
          case PlantGrowthStage.SPROUT:
            return 'assets/images/garden/bush_sprout.png';
          default:
            return 'assets/images/garden/bush_default.png';
        }
      default:
        return 'assets/images/garden/placeholder.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.lightGreen[100],
        border: Border(
          bottom: BorderSide(color: Colors.brown[300]!, width: 4),
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: plants.asMap().entries.map((entry) {
          int index = entry.key;
          Plant plant = entry.value;

          return Positioned(
            left: (index * 80.0) + 20.0,
            bottom: 5,
            child: GestureDetector(
              onTap: () => onPlantTap(plant.typeId),
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  _getPlantAssetPath(plant.typeId, plant.currentStage),
                  height: plant.currentStage == PlantGrowthStage.BLOOM ? 80 : 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
