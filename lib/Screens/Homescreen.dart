import 'package:flames/Screens/checkscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String? selectOption;

  final Map<String, String> selectOptions = {
    "Male": "assets/Boy.png",
    "Female": "assets/girl.png",
    "Others": "assets/others.png"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 103, 151),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/bggirl.gif",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Are you?",
                  style: GoogleFonts.passionOne(
                    fontSize: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                ...selectOptions.keys.map(
                  (options) => buildOptions(options),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15)),
                onPressed: selectOption != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckScreen(
                              imageScreen: selectOptions[selectOption]!,
                            ),
                          ),
                        );
                      }
                    : null,
                child: const Icon(
                  Icons.favorite,
                  size: 40,
                )),
          )
        ],
      ),
    );
  }

//this fuction perform Male Female and other all gender build within this one fuction
  Widget buildOptions(String options) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20)),
        height: 80,
        width: 200,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectOption = options;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: options,
                groupValue: selectOption,
                onChanged: (value) {
                  setState(() {
                    selectOption = value.toString();
                  });
                },
              ),
              Text(
                options,
                style: GoogleFonts.ubuntu(
                    fontSize: 40,
                    color: const Color.fromARGB(255, 246, 103, 151),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
