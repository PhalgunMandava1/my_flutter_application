import 'package:flutter/material.dart';

class GooglePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google")),
      body: Center(
        child: Text("Google Page", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
