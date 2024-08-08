import 'package:flutter/material.dart';

class PaperSubmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text('Submit Your Research Paper'),
      ),
      body: Center(
        child: Text('Paper submission interface.'),
      ),
    );
  }
}
