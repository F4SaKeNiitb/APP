import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'package:url_launcher/url_launcher.dart';

// generates the search screen while scraping data from google scholar
// void main() => runApp(const ScholarSearchApp()); 

class ScholarSearchApp extends StatelessWidget {
  const ScholarSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Google Scholar Search',
      home: ScholarSearchScreen(),
    );
  }
}

class ScholarSearchScreen extends StatefulWidget {
  const ScholarSearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScholarSearchScreenState createState() => _ScholarSearchScreenState();
}

class _ScholarSearchScreenState extends State<ScholarSearchScreen> {
  final TextEditingController _urlController = TextEditingController();
  bool _isLoading = false;
  List<Map<String, String>> _searchResults = [];

  Future<void> _searchGoogleScholar(String query) async {
    setState(() {
      _isLoading = true;
      _searchResults = [];
    });

    try {
      final searchUrl = Uri.parse('https://scholar.google.com/scholar?q=$query');
      final response = await http.get(searchUrl, headers: {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
    });


      if (response.statusCode == 200) {
        final document = html_parser.parse(response.body);
        final articles = document.getElementsByClassName('gs_r gs_or gs_scl');



        List<Map<String, String>> results = [];

        for (var article in articles) {
          final titleElement = article.querySelector('h3')?.text ?? 'No Title';
          final snippetElement = article.querySelector('.gs_rs')?.text ?? 'No Snippet';
          final linkElement = article.querySelector('a')?.attributes['href'] ?? 'No Link';

          String citationCount = '0';
          final citationElement = article.querySelector('.gs_fl.gs_flb');
          if (citationElement != null) {
            final citationLinks = citationElement.querySelectorAll('a');
            for (var link in citationLinks) {
              final linkText = link.text;
              if (linkText.contains('Cited by')) {

                final match = RegExp(r'Cited by (\d+)').firstMatch(linkText);
                citationCount = match?.group(1) ?? '0';
                break; 
              }
            }
          }

          results.add({
            'title': titleElement,
            'snippet': snippetElement,
            'link': linkElement.startsWith('/')
                ? 'https://scholar.google.com$linkElement'
                : linkElement,
            'citations': citationCount,
          });
        }

        setState(() {
          _searchResults = results;
        });
      } 
    } 
    finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
@override

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Google Scholar Search'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _urlController,
            decoration: const InputDecoration(
              labelText: 'Enter search term or URL',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (query) {
              _searchGoogleScholar(query);
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _searchGoogleScholar(_urlController.text);
            },
            child: const Text('Search'),
          ),
          const SizedBox(height: 16),
          _isLoading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: _searchResults.isEmpty
                      ? const Center(child: Text('No results found.'))
                      : ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            final result = _searchResults[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                title: Text(
                                  result['title'] ?? 'No Title',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 6, 108, 191), 
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(result['snippet'] ?? 'No Snippet'),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      'Citations: ${result['citations']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  final stringUrl = result['link'] ?? '';
                                  final finalUrl = Uri.parse(stringUrl);
                                  _launchURL(finalUrl);
                                },
                              ),
                            );
                          },
                        ),
                ),
        ],
      ),
    ),
  );
}


  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}