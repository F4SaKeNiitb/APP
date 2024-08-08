import 'package:app/Harish/ChatBot.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'package:url_launcher/url_launcher.dart';
import 'function.dart';

// generates the search screen while scraping data from google scholar
// void main() => runApp(const QA_App()); 

class QA_Screen extends StatefulWidget {
  const QA_Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QA_ScreenState createState() => _QA_ScreenState();
}

class _QA_ScreenState extends State<QA_Screen> {
  final TextEditingController _urlController = TextEditingController();
  bool _isLoading = false;

  fetchdata(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
  } 

  // // Function to make the API call
  // Future<void> hitApi(String query) async {
  //   final response = await http.get(Uri.parse('http://127.0.0.1:5000/initialize?query='+query));
  //   if (response.statusCode == 200) {
  //     print('API call successful: ${response.body}');
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // // Function to navigate to the next page
  // void navigateToNextPage(BuildContext context) {
  //   Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => ChatPage()),
  //               );
  // }

  // // Combined function to handle both API call and navigation
  // Future<void> handleButtonPress(BuildContext context, String query) async {
  //   await hitApi(query);
  //   navigateToNextPage(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('GLOBAL RAG'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Enter the Research Paper or Topic',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (query) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage(query: query)),
                  );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage(query: _urlController.text)),
                  );
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
  

