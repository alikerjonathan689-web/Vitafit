

import ' package:flutter/material.dart';
void main() {
  runApp(const VitaFitApp());
}

class VitaFitApp extends StatelessWidget {
  const VitaFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VitaFit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.greenAccent,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  bool _isMusicPlaying = false; // Background music track toggle

  // The 6 main screens from your detailed project layout
  final List<Widget> _screens = [
    const Center(child: Text('🏠 Home Dashboard\n\nDaily Workouts & Fitness Goals', textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
    const Center(child: Text('💪 Workout Plans\n\nGym/Home Routines & Exercise Library', textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
    const Center(child: Text('📍 GPS Track Activity\n\nLive Running, Walking, & Cycling Logs', textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
    const Center(child: Text('🥗 Nutrition Hub\n\nFood Tracker, Calories & Daily Challenges', textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
    const Center(child: Text('📈 Transformation Progress\n\nWeight Tracking & History Analytics', textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
    const Center(child: Text('👤 User Profile\n\nAccount Details, Settings & Premium ($3/mo)', textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VitaFit', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // Background Motivation Music Control Button
          IconButton(
            icon: Icon(_isMusicPlaying ? Icons.music_note : Icons.music_off, color: Colors.greenAccent),
            onPressed: () {
              setState(() {
                _isMusicPlaying = !_isMusicPlaying;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(_isMusicPlaying ? '🎵 Playing Motivation Music...' : '🔇 Music Paused.')),
              );
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Allows showing more than 3 items neatly
        backgroundColor: const Color(0xFF1E1E1E),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workouts'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Track'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Nutrition'),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Progress'),
        ],
      ),
    );
  }
}
