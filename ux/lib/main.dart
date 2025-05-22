import 'package:flutter/material.dart';
import 'constants/route_paths.dart';
import 'app/app_routes.dart';

void main() => runApp(const WellnessHubApp());

class WellnessHubApp extends StatelessWidget {
  const WellnessHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellness Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0E0B1F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF944B00),
          secondary: Colors.orangeAccent,
        ),
      ),
      initialRoute: RoutePaths.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}