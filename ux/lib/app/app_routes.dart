import 'package:flutter/material.dart';
import '../constants/route_paths.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/checkin/check_in_screen.dart';
import '../screens/planner/daily_screen.dart';
import '../screens/profile/profile_screen.dart';
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
import '../screens/planner/daily_calendar_screen.dart';
import '../screens/ai-bot/ai_bot_screen.dart';


class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RoutePaths.checkIn:
        return MaterialPageRoute(builder: (_) => const CheckInScreen());

      case RoutePaths.dailyPlanner:
        final args = settings.arguments as List<Map<String, dynamic>>?;
        return MaterialPageRoute(builder: (_) => DailyScreen(planOverride: args));
      case RoutePaths.mind:
        return MaterialPageRoute(builder: (_) => const MindScreen());

      case RoutePaths.body:
        return MaterialPageRoute(builder: (_) => const BodyScreen());

      case RoutePaths.spirituality:
        return MaterialPageRoute(builder: (_) => const SpiritualityScreen());

      case RoutePaths.ayurveda:
        return MaterialPageRoute(builder: (_) => const AyurvedaScreen());

      case RoutePaths.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case RoutePaths.satvikFood:
        return MaterialPageRoute(builder: (_) => const SatvikFoodScreen());

      case RoutePaths.musicRaga:
        return MaterialPageRoute(builder: (_) => const MusicRagaScreen());

      case RoutePaths.pooja:
        return MaterialPageRoute(builder: (_) => const PoojaScreen());

      case RoutePaths.astrology:
        return MaterialPageRoute(builder: (_) => const AstrologyScreen());

      case RoutePaths.calendar:
        return MaterialPageRoute(builder: (_) => const DailyCalendarScreen());

      case RoutePaths.aiBot:
        return MaterialPageRoute(builder: (_) => const AiBotScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}