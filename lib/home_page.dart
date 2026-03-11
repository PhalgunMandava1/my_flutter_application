import 'package:flutter/material.dart';
import 'google_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.facebook),
              title: const Text("Facebook App"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.g_mobiledata),
              title: const Text("Google"),
              onTap: () {
                Navigator.pop(context); // close bottom sheet
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GooglePage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text("Whatsapp"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showOptions(context);
          },
          child: const Text("Open Bottom Sheet"),
        ),
      ),
    );
  }
}
