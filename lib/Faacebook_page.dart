import 'package:flutter/material.dart';

class FacebookPage extends StatelessWidget {
  const FacebookPage({super.key});

  void showFacebookDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Facebook"),
          content: const Text("Do you want to open the details page?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // close dialog

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsPage(),
                  ),
                );
              },
              child: const Text("Open"),
            ),
          ],
        );
      },
    );
  }

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
            showFacebookDialog(context);
          },
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Facebook Details Page",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
