import 'package:flutter/material.dart';

class QAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Interactive Q&A'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Text('Q&A interface for the paper.'),
      ),
    );
  }
}
