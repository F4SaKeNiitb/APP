import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Summarizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SummarizerPage(),
    );
  }
}

class SummarizerPage extends StatefulWidget {
  @override
  _SummarizerPageState createState() => _SummarizerPageState();
}

class _SummarizerPageState extends State<SummarizerPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summarizer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: _searchText.isEmpty
                  ? Center(child: Text("Type something to search"))
                  : ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Search Result ${index + 1}"),
                          subtitle: Text("Result for '$_searchText'"),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
