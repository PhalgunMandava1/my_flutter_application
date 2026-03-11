import 'package:flutter/material.dart';

class WhatsappPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Whatsapp")),
      body: Center(
        child: Text("Whatsapp Page", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
