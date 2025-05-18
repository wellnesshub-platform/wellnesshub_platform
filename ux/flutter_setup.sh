#!/bin/bash

mkdir -p lib/{app,screens/home,services,models,widgets,utils}

touch lib/main.dart
cat <<EOF > lib/main.dart
import 'package:flutter/material.dart';
import 'app/routes.dart';
import 'app/theme.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const WellnessApp());
}

class WellnessApp extends StatelessWidget {
  const WellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellness Hub',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
EOF

touch lib/app/theme.dart
touch lib/app/routes.dart
touch lib/screens/home/home_screen.dart
touch lib/screens/home/home_viewmodel.dart
touch lib/services/api_service.dart
touch lib/services/config.dart
touch lib/models/daily_plan.dart
touch lib/widgets/custom_button.dart
touch lib/utils/logger.dart

echo "✅ Flutter lib/ structure created successfully."
