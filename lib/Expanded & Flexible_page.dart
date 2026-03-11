import 'package:flutter/material.dart';

void main() {
  runApp(const ExpandedWidgetExample());
}

class ExpandedWidgetExample extends StatelessWidget {
  const ExpandedWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded & Flexible_page'),
      ),
      body: Column(
        children: <Widget>[
          // A fixed-size widget
          Container(
            height: 100,
            color: Colors.red,
            child: const Center(child: Text('Fixed Height Container')),
          ),
          
          // This Expanded widget takes up the remaining space
          Expanded(
            flex: 2, // Takes up 2/3 of remaining space
            child: Container(
              color: Colors.blue,
              child: const Center(child: Text('Expanded (Flex 2)')),
            ),
          ),

          // This Expanded widget takes up the remaining space
          Expanded(
            flex: 1, // Takes up 1/3 of remaining space
            child: Container(
              color: Colors.green,
              child: const Center(child: Text('Expanded (Flex 1)')),
            ),
          ),
        ],
      ),
    );
    Row(
  children: <Widget>[
    Flexible(
      flex: 2,
      fit: FlexFit.tight, // Forces the container to fill the 2/3 space
      child: Container(
        color: Colors.red,
        height: 100,
      ),
    ),
    Flexible(
      flex: 1,
      fit: FlexFit.loose, // Allows the container to be its preferred size within the 1/3 space
      child: Container(
        color: Colors.blue,
        height: 100,
        // The container's width will be based on its content, not forced to fill the entire 1/3 space
      ),
    ),
  ],
);
}
}
