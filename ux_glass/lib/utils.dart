import 'package:flutter/material.dart';

// --- Helper Functions ---
Color lightenColor(Color color, [double amount = .15]) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return hslLight.toColor();
}

Color darkenColor(Color color, [double amount = .15]) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return hslDark.toColor();
}

// --- Constants ---
// Sharper 3D effect for icons
const List<Shadow> iconShadows = [
  Shadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 0.5) // Reduced blur
];

// --- Time Greeting ---
String getTimeBasedGreeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) return 'Good Morning ☀️';
  if (hour < 17) return 'Good Afternoon 🌤️';
  return 'Good Evening 🌙';
}

// --- 3D AppBar Icon Widget (Sharper 3D) ---
Widget buildAppBarIcon({
  required IconData icon,
  required Color color,
  required String tooltip,
  required VoidCallback onPressed,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
    decoration: BoxDecoration(
      color: const Color(0xFFF3E5F5),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow( // Darker shadow for bottom-right
            color: Colors.purple.withOpacity(0.45), // Slightly more opaque
            offset: const Offset(2, 2), // Adjusted offset
            blurRadius: 1, // Minimal blur for sharpness
            spreadRadius: 0 // No spread
            ),
        BoxShadow( // Lighter shadow for top-left
            color: Colors.white.withOpacity(0.9),
            offset: const Offset(-2, -2), // Adjusted offset
            blurRadius: 1, // Minimal blur
            spreadRadius: 0
            ),
      ],
    ),
    child: IconButton(
      icon: Icon(icon, color: color, shadows: iconShadows),
      tooltip: tooltip,
      onPressed: onPressed,
      iconSize: 24,
    ),
  );
}