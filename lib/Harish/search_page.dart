import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'package:url_launcher/url_launcher.dart';


class ScholarSearchScreen extends StatefulWidget {
  const ScholarSearchScreen({super.key});

  @override
  _ScholarSearchScreenState createState() => _ScholarSearchScreenState();
}

class _ScholarSearchScreenState extends State<ScholarSearchScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _urlController = TextEditingController();
  bool _isLoading = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _searchGoogleScholar(String query) async {
    setState(() {
      _isLoading = true;
    });

    List<Map<String, String>> results = [];
    try {
      final searchUrl =
          Uri.parse('https://scholar.google.com/scholar?q=$query');
      final response = await http.get(searchUrl, headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
      });

      if (response.statusCode == 200) {
        final document = html_parser.parse(response.body);
        final articles = document.getElementsByClassName('gs_r gs_or gs_scl');

        for (var article in articles) {
          final titleElement = article.querySelector('h3')?.text ?? 'No Title';
          final snippetElement =
              article.querySelector('.gs_rs')?.text ?? 'No Snippet';
          final linkElement =
              article.querySelector('a')?.attributes['href'] ?? 'No Link';

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
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(searchResults: results),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            _isTextFieldFocused = false;
          });
        },
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFF176AAC)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFFD0E0ED),
                        radius: 50,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Colors.white, Colors.blueAccent],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'lib/Images/google_scholar.png',
                            height: 40,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isTextFieldFocused = hasFocus;
                      if (hasFocus) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                    });
                  },
                  child: TextField(
                    controller: _urlController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter search term or URL",
                      hintStyle:
                          TextStyle(color: Colors.grey[600], fontSize: 16.0),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                      suffixIcon: _urlController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                _urlController.clear();
                                setState(() {});
                              },
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_urlController.text.isNotEmpty) {
                      _searchGoogleScholar(_urlController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: const Color(0xFF8E44AD),
                    elevation: 10,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        )
                      : const Text(
                          'Search',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Search Results Screen
class SearchResultsScreen extends StatelessWidget {
  final List<Map<String, String>> searchResults;

  const SearchResultsScreen({super.key, required this.searchResults});

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Results',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF176AAC),
        elevation: 10,
      ),
      body: Container(
        color: const Color(0xFF176AAC),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: searchResults.isEmpty
              ? const Center(
                  child: Text(
                    'No results found.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              : ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final result = searchResults[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        title: Text(
                          result['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              result['snippet']!,
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Citations: ${result['citations']}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        onTap: () => _launchURL(Uri.parse(result['link']!)),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
