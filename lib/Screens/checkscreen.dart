import 'package:flames/Screens/resultScreen.dart';
import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {
  final String imageScreen;
  CheckScreen({required this.imageScreen, super.key});

  final TextEditingController yourNameController = TextEditingController();

  final TextEditingController crushNameController = TextEditingController();

  String? calculateFlames(String yourName, String yourCrushName) {
    Map<int, String> flamesResult = {
      0: 'assets/friendss.png',
      1: 'assets/loverss.png',
      2: 'assets/affections.png',
      3: 'assets/marriages.png',
      4: 'assets/ememys.png',
      5: 'assets/sibilings.png'
    };

    String yourNameLower = yourName.replaceAll(' ', '').toLowerCase();
    String yourCrushNameLower = yourCrushName.replaceAll(' ', '').toLowerCase();

    for (int i = 0; i < yourNameLower.length; i++) {
      String letter = yourNameLower[i];
      if (yourCrushNameLower.contains(letter)) {
        yourNameLower = yourNameLower.replaceFirst(letter, '');
        yourCrushNameLower = yourCrushNameLower.replaceFirst(letter, '');
        i--;
      }
    }
    int remainLetters = yourNameLower.length + yourCrushNameLower.length;
    if (remainLetters == 0) {
      return "Undefined";
    }
    int resultIndex = remainLetters % flamesResult.length;
    // if (resultIndex == 0) {
    //   resultIndex = flamesResult.length - 1;
    // }
    return flamesResult[resultIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 103, 151),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(imageScreen, height: 450),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  controller: yourNameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Your Name...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  controller: crushNameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Your Crush Name...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              FloatingActionButton(
                onPressed: () {
                  String yourName = yourNameController.text.trim();
                  String yourCrushName = crushNameController.text.trim();

                  if (yourName.isNotEmpty && yourCrushName.isNotEmpty) {
                    String? flamesResult =
                        calculateFlames(yourName, yourCrushName);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultScreen(result: flamesResult!),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter names properly !"),
                      ),
                    );
                  }
                },
                child: Image.asset(
                  "assets/heartbutton.png",
                  height: 30,
                  width: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
