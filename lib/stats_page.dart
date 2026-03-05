import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "STATS",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Day"),
              Tab(text: "Week"),
              Tab(text: "Month"),
            ],
          ),
        ),

        body: TabBarView(
          children: [

            Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 50,
                mainAxisSpacing: 50,
                children: [

                  statCard(
                    "Heart Rate",
                    "110 bpm",
                    "Healthy",
                    Colors.red,
                    Icons.monitor_heart,
                  ),

                  statCard(
                    "Sleep",
                    "8.5 h",
                    "Good",
                    Colors.purple,
                    Icons.bedroom_parent,
                  ),

                  statCard(
                    "Calories",
                    "789 kcal",
                    "Burned",
                    Colors.orange,
                    Icons.sports_gymnastics,
                  ),

                  statCard(
                    "Steps",
                    "1116",
                    "Today",
                    Colors.blueAccent,
                    Icons.directions_walk_sharp,
                  ),

                  statCard(
                    "Worktime",
                    "8 h",
                    "Active",
                    Colors.deepPurple,
                    Icons.work,
                  ),

                  statCard(
                    "Running",
                    "20 MIN",
                    "Workout",
                    Colors.green,
                    Icons.directions_run,
                  ),
                ],
              ),
            ),

            const Center(
              child: Text(
                "This is Week Page",
                style: TextStyle(fontSize: 20),
              ),
            ),

            const Center(
              child: Text(
                "This is Month Page",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget statCard(
    String title,
    String value,
    String bottomText,
    Color color,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Stack(
        children: [

          Positioned(
            top: 12,
            left: 12,
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: Icon(icon, color: Colors.white70, size: 30),
          ),

          Center(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Positioned(
            bottom: 12,
            right: 12,
            child: Text(
              bottomText,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
