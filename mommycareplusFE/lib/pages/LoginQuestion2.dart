import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Question 02',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginQuestionTwo(),
    );
  }
}

class LoginQuestionTwo extends StatelessWidget {
  const LoginQuestionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Page Title
                const Text(
                  "What is your age?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 40),
                // Illustration
                Image.asset(
                  "assets/image 11.png", // Adjust the file name/path if needed
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),
                // "Age" input field
                Container(
                  width: 300,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  // Replace with an actual TextField if you want user input
                  child: const Center(
                    child: Text(
                      "Age",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // NEXT button
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate or perform an action
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/Rectangle 86.png",
                        width: 174,
                        height: 48,
                        fit: BoxFit.fill,
                      ),
                      const Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}