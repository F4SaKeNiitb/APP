import 'package:flutter/material.dart';


class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF000a63), // Set the background color
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Key Features',
            style: TextStyle(
              fontSize: 28, // Increased font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Color.fromARGB(128, 0, 0, 0),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30), // Added more space between title and features
          FeatureItem(
            icon: Icons.lightbulb_outline,
            iconColor: Colors.yellowAccent,
            title: 'AI-Powered Insights',
            description: 'Get smart recommendations and summaries for your research using LLM.',
          ),
          FeatureItem(
            icon: Icons.search,
            iconColor: Colors.cyanAccent,
            title: 'Google Scholar Integration',
            description: 'Search and find relevant papers directly from Google Scholar.',
          ),
          FeatureItem(
            icon: Icons.bookmark_border,
            iconColor: Colors.greenAccent,
            title: 'Save and Organize',
            description: 'Bookmark and categorize papers for easy access and review.',
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  FeatureItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
            child: Icon(icon, size: 40, color: iconColor),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 2,
                        color: Color.fromARGB(128, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9), // Slightly transparent for contrast
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
