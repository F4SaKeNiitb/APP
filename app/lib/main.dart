import 'package:flutter/material.dart';
import 'package:app/Harish/home.dart';
import 'package:app/Harish/profile/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:app/Harish/user/login.dart';
void main() {
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
      home: LoginPage(),
    );
  }
}
