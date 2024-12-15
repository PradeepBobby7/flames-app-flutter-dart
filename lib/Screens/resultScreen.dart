import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  const ResultScreen({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/space.gif',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(result),
          )
        ],
      ),
    );
  }
}
