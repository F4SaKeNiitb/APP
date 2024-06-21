import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

final _secondcolor = Colors.purple.shade100;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurpleAccent.shade700,
        child: Center(
            child: CircleAvatar(
              backgroundColor: _secondcolor,
              radius: 150,
              child: const Icon(
          Icons.panorama_photosphere,
          color: Colors.black,
          size: 170,
        ))),
      ),
    );
  }
}
