import 'package:flutter/material.dart';
import '../Harish/profile/profile_provider.dart';
import 'package:provider/provider.dart';
import 'Harish/onboarding.dart';
import 'Harish/Const.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
void main() {
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Research Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'MyFont1',
      ),
      home: const OnboardingScreen(),
    );
  }
}
