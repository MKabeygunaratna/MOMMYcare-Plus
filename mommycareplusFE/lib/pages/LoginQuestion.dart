import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Question 01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginQuestionPage(),
    );
  }
}

class LoginQuestionPage extends StatelessWidget {
  const LoginQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Optional: You can wrap with a Scaffold + SafeArea to handle the page layout.
    return Scaffold(
      backgroundColor: Colors.white, // Adjust background color if needed
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              // Adjust mainAxisAlignment / crossAxisAlignment as needed
              children: [
                const SizedBox(height: 40), // Spacer for top padding
                // Main Illustration
                Image.asset(
                  "assets/image 8.png",
                  width: 459,
                  height: 575,
                ),
                const SizedBox(height: 20),
                // The question text
                const Text(
                  "What do  you want me \nto call you?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30),
                
                // "Name" input placeholder
                Stack(
                  children: [
                    Container(
                      width: 346,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    ),
                    // You can replace this Text with a TextField if you want actual input
                    const Positioned(
                      left: 15,
                      top: 12,
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),

                // Arrow image
                // (Note: The height = 0 in your code suggests maybe it's invisible or
                //  not sized properly. Adjust as needed.)
                const SizedBox(height: 20),
                Image.asset(
                  "assets/Arrow 2.png",
                  width: 100,
                  height: 30, // or any height you prefer
                ),

                // Ellipse images
                const SizedBox(height: 20),
                Image.asset(
                  "assets/Ellipse 36.png",
                  width: 61,
                  height: 67,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  "assets/Ellipse 37.png",
                  width: 104,
                  height: 127,
                ),

                // NEXT button
                const SizedBox(height: 40),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/Rectangle 86.png",
                          width: 174.3813934326172,
                          height: 48.39201354980469,
                        ),
                        const Text(
                          "NEXT",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 40), // Extra space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}