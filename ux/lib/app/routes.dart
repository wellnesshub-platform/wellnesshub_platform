import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/pillars/mind_screen.dart';
import '../screens/pillars/body_screen.dart';
import '../screens/pillars/spirituality_screen.dart';
import '../screens/pillars/ayurveda_screen.dart';
import '../screens/pillars/satvik_food_screen.dart';
import '../screens/pillars/music_raga_screen.dart';
import '../screens/pillars/pooja_screen.dart';
import '../screens/pillars/astrology_screen.dart';
import '../screens/pillars/vastu_screen.dart';
import '../screens/pillars/journal_screen.dart';
import '../screens/pillars/dharma_screen.dart';
import '../screens/pillars/reminders_screen.dart';
import '../screens/pillars/daily_planner_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/daily-planner':
        return MaterialPageRoute(builder: (_) => const DailyPlannerScreen());
      case '/mind':
        return MaterialPageRoute(builder: (_) => const MindScreen());
      case '/body':
        return MaterialPageRoute(builder: (_) => const BodyScreen());
      case '/spirituality':
        return MaterialPageRoute(builder: (_) => const SpiritualityScreen());
      case '/ayurveda':
        return MaterialPageRoute(builder: (_) => const AyurvedaScreen());
      case '/satvik-food':
        return MaterialPageRoute(builder: (_) => const SatvikFoodScreen());
      case '/music-raga':
        return MaterialPageRoute(builder: (_) => const MusicRagaScreen());
      case '/pooja':
        return MaterialPageRoute(builder: (_) => const PoojaScreen());
      case '/astrology':
        return MaterialPageRoute(builder: (_) => const AstrologyScreen());
      case '/vastu':
        return MaterialPageRoute(builder: (_) => const VastuScreen());
      case '/journal':
        return MaterialPageRoute(builder: (_) => const JournalScreen());
      case '/dharma':
        return MaterialPageRoute(builder: (_) => const DharmaScreen());
      case '/reminders':
        return MaterialPageRoute(builder: (_) => const RemindersScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}