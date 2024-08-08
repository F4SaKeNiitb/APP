import 'package:flutter/material.dart';

class LatexEditorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text('LaTeX Code Generation'),
      ),
      body: Center(
        child: Text('Generate and edit LaTeX code.'),
      ),
    );
  }
}
