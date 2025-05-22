import 'package:flutter/material.dart';
import '../../constants/route_paths.dart';
import 'home_screen_item.dart';

class HomeScreenItemGrid extends StatelessWidget {
  const HomeScreenItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _buildItem(context, Icons.psychology, 'Mind', RoutePaths.mind),
      _buildItem(context, Icons.fitness_center, 'Body', RoutePaths.body),
      _buildItem(context, Icons.spa, 'Spirituality', RoutePaths.spirituality),
      _buildItem(context, Icons.local_florist, 'Ayurveda', RoutePaths.ayurveda),
      _buildItem(context, Icons.restaurant, 'Satvik', RoutePaths.satvikFood),
      _buildItem(context, Icons.music_note, 'Raga', RoutePaths.musicRaga),
      _buildItem(context, Icons.local_fire_department, 'Pooja', RoutePaths.pooja),
      _buildItem(context, Icons.auto_awesome, 'Astrology', RoutePaths.astrology),
      _buildItem(context, Icons.house, 'Vastu', RoutePaths.vastu),
      _buildItem(context, Icons.book, 'Journal', RoutePaths.journal),
      _buildItem(context, Icons.menu_book, 'Dharma', RoutePaths.dharma),
      _buildItem(context, Icons.notifications_active, 'Reminders', RoutePaths.reminders),
    ];

    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 4,
      mainAxisSpacing: 20,
      crossAxisSpacing: 16,
      children: items,
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String label, String route) {
    return HomeScreenItem(
      icon: icon,
      label: label,
      onTap: () => Navigator.pushNamed(context, route),
    );
  }
}