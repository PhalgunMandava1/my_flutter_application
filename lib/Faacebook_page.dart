import 'package:flutter/material.dart';

class FacebookPage extends StatelessWidget {
  const FacebookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facebook"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Open Details Page"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FacebookPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
