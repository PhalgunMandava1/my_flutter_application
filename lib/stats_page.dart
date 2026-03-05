import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text("Share"),
              onTap: () {
                Navigator.pop(sheetContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Share button opened")),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.link),
              title: const Text("Get link"),
              onTap: () {
                Navigator.pop(sheetContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Link generated")),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit name"),
              onTap: () {
                Navigator.pop(sheetContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Edit name clicked")),
                );

              },
            ),

            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("Delete collection"),
              onTap: () {
                Navigator.pop(sheetContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Collection deleted")),
                );
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
      appBar: AppBar(
        title: const Text("Home"),
      ),

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
