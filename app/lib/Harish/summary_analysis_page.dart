import 'package:flutter/material.dart';

class SummaryAnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Summary and Analysis'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Text('Summary and analysis of the paper.'),
      ),
    );
  }
}
