import 'package:flutter/material.dart';
import 'package:flutter_application_1/Google_page.dart' hide HomePage;
import 'package:flutter_application_1/Whatsapp_page.dart';
import 'package:flutter_application_1/Facebook_page.dart';
import 'package:flutter_application_1/google_page.dart';
import 'package:flutter_application_1/gridview.dart';
import 'register_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'Facebook_page.dart';
import 'Google_page.dart' hide HomePage;
import 'Whatsapp_page.dart';
import 'stats_page.dart' hide HomePage;
import 'rewards_page.dart';
import 'goal_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    StatsPage(),
    RewardsPage(),
    GoalPage(),
    FacebookPage(),
    GooglePage(),
    WhatsappPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Stats",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Rewards"),
            BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Goal"),
          ],
        ),
      ),
    );
  }
}
