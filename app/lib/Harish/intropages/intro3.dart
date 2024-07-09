import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF000a63), // Set the background color
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          const Text(
            'Getting Started',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Image.asset('lib/Images/search_illustration.png', height: 200), // Example illustration
                ),
                const Text(
                  'Use the search page to look up papers or topics on Google Scholar. Our AI assistant helps you analyze and summarize findings efficiently.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle getting started action
                  },
                  icon: const Icon(Icons.search, color: Colors.white),
                  label: const Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.yellowAccent, // Button color
                    // onPrimary: Color(0xFF000a63), // Text color on button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
