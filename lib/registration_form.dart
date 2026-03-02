import 'package:flutter/material.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          centerTitle: true,
        ),

        bottomNavigationBar: Material(
          color: Colors.black,
          child: TabBar(
            tabs: [
              _buildTab(Icons.person, "Profile", Colors.blue),
              _buildTab(Icons.settings, "Settings", Colors.greenAccent),
            ],
          ),
        ),

        body: TabBarView(
          children: [

            ListView(
              padding: const EdgeInsets.all(12),
              children: [

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://picsum.photos/500/300",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Name"),
                        subtitle: Text("Your Name"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text("example@gmail.com"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Phone"),
                        subtitle: Text("Number"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                
              ],
            ),

            ListView(
              padding: const EdgeInsets.all(12),
              children: [
                Card(
                  elevation: 4,
                  child: Column(
                    children: [

                      const ListTile(
                        leading: Icon(Icons.notifications),
                        title: Text("Notifications"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const Divider(),

                      const ListTile(
                        leading: Icon(Icons.lock),
                        title: Text("Privacy"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const Divider(),

                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Logged out successfully"),
                            ),
                          );
                        },
                        child: const ListTile(
                          leading: Icon(Icons.logout),
                          title: Text("Logout"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(IconData icon, String text, Color color) {
    return Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: color,
            child: Icon(icon, size: 16, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}