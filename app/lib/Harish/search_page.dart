import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Search for Papers'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Text('Search and scrape Google Scholar for papers.'),
      ),
    );
  }
}
