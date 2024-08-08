import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF176AAC),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to ET-AL Research Assistant',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Your companion for efficient research using AI and Google Scholar.',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset('lib/Images/logo.png', height: 340), // App logo or illustration
            const SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }
}
