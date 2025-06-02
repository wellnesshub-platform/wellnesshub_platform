import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For chat icon
import 'home_screen.dart';
import 'planner_screen.dart';
import 'journal_screen.dart';
import 'music_screen.dart';
import 'profile_screen.dart';
import 'auth_service.dart';
import 'utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final AuthService _authService = AuthService();

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    PlannerScreen(),
    JournalScreen(),
    MusicScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => buildAppBarIcon(
            icon: Icons.menu,
            color: Colors.white,
            tooltip: 'Open Menu',
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(children: [
          Image.asset('assets/app_logo.png', height: 30,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.spa, color: Colors.white, shadows: iconShadows,)),
          const SizedBox(width: 10),
          const Text('Wellness Hub'),
        ]),
        centerTitle: false,
        actions: [
          buildAppBarIcon(
            icon: Icons.notifications_active,
            color: Colors.yellowAccent[700]!,
            tooltip: 'Notifications',
            onPressed: () {},
          ),
          buildAppBarIcon(
            icon: Icons.settings_suggest,
            color: Colors.lightBlueAccent[400]!,
            tooltip: 'Settings',
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.purple[300]!, Colors.purple[600]!])),
              child: const Text('Menu',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: iconShadows)),
            ),
            ListTile(
                leading: const Icon(Icons.music_note, shadows: iconShadows),
                title: const Text('Raga'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                leading: const Icon(Icons.spa, shadows: iconShadows),
                title: const Text('Yoga'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                leading: const Icon(Icons.restaurant, shadows: iconShadows),
                title: const Text('Food'),
                onTap: () => Navigator.pop(context)),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout,
                  color: Colors.redAccent, shadows: iconShadows),
              title: const Text('Sign Out', style: TextStyle(color: Colors.redAccent)),
              onTap: () async {
                await _authService.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, shadows: iconShadows),
              label: 'Home',
              activeIcon: Icon(Icons.home, shadows: iconShadows)),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined, shadows: iconShadows),
              label: 'Planner',
              activeIcon: Icon(Icons.calendar_today, shadows: iconShadows)),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined, shadows: iconShadows),
              label: 'Journal',
              activeIcon: Icon(Icons.book, shadows: iconShadows)),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note_outlined, shadows: iconShadows),
              label: 'Music',
              activeIcon: Icon(Icons.music_note, shadows: iconShadows)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, shadows: iconShadows),
              label: 'Profile',
              activeIcon: Icon(Icons.person, shadows: iconShadows)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[600],
        unselectedItemColor: Colors.purple[200],
        selectedIconTheme: IconThemeData(size: 28, color: Colors.deepPurple[600]),
        unselectedIconTheme: IconThemeData(size: 24, color: Colors.purple[200]),
        backgroundColor: const Color(0xFFE6E0F8),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        showUnselectedLabels: true,
      ),
      // --- ADDED FLOATING AI CHAT BOT ---
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement AI Chat Bot functionality
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('AI Chat Bot pressed!')),
          );
        },
        backgroundColor: Colors.purple[600],
        tooltip: 'AI Chat',
        elevation: 8.0, // Similar elevation to other 3D elements
         shape: CircleBorder( // Add a slight border/highlight if desired
            side: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.0)
        ),
        child: const Icon(
          FontAwesomeIcons.robot, // Using a robot icon for chat
          color: Colors.white,
          shadows: iconShadows, // Apply 3D shadow
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Position
    );
  }
}