import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/features/intro_screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long loading process to mimic fetching data
    Timer(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroOverboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Customize your splash screen UI here
        body: Column(
      children: [
        const SizedBox(
          height: 80.0,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(ImageApp.logoImage),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(ImageApp.minkumImage),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'نشكركم على وعيكم واهتمامكم ',
          style: TextStyle(fontSize: 23),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 80,
        ),
        const Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
      ],
    ));
  }
}
