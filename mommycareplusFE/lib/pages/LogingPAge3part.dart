import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

class LogingPAge3part extends StatelessWidget {
  const LogingPAge3part({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postpartum Period App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
      ),
      home: const PostpartumPeriodPage(),
    );
  }
}

class PostpartumPeriodPage extends StatelessWidget {
  const PostpartumPeriodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              // Title text
              const Text(
                'What is your\npostpartum period?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7B68EE),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 30),
              // Input field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF7B68EE), width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Postpartum period',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Mother and baby illustration
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background circle
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE6F0F5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Mother and baby image
                    Image.asset(
                      'assets/mother_baby.png', 
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ],
                ),
              ),
              // Next button
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle next button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7B68EE),
                    minimumSize: const Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}