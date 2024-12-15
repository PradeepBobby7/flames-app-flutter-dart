import 'dart:async';

import 'package:flames/Screens/Homescreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), ()=> Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const Homescreen()),),);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 103, 151),
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Center(
          child: Image.asset("assets/flames.png"),
        ),
      ),
    );
  }
}
