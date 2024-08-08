import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Help and Support'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Text('Help and support section.'),
      ),
    );
  }
}
