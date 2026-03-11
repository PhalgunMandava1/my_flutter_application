import 'package:flutter/material.dart';
import 'google_page.dart';

class GooglePage extends StatelessWidget {
  const GooglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),

      body: Center(
        child: ElevatedButton(
          child: const Text("Open Google Page"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GooglePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}