import 'package:flutter/material.dart' show BoxDecoration, BoxShape, BuildContext, Color, Colors, Column, Container, CrossAxisAlignment, EdgeInsets, Expanded, FontWeight, Icon, IconData, Icons, MainAxisAlignment, Offset, Padding, Row, Shadow, SizedBox, StatelessWidget, Text, TextAlign, TextStyle, Widget;


class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF176AAC), // Set the background color
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60,),
          const Text(
            'Key Features',
            style: TextStyle(
              fontSize: 35, // Increased font size
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
          const SizedBox(height: 40), // Added more space between title and features
          FeatureItem(
            icon: Icons.question_answer_outlined,
            iconColor: Colors.greenAccent,
            title: 'Interactive Paper Q&A',
            description: 'Ask questions about your research paper and get answers in real time.',
          ),
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

          
          const SizedBox(height: 170,)
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
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:const TextStyle(
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
                const SizedBox(height: 5),
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
