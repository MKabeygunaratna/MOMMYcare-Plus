import 'package:flutter/material.dart';
import 'chatbot2.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7261C6), // Purple background
      body: SafeArea(
        child: SingleChildScrollView( // Prevent overflow
          child: Column(
            children: [
              const SizedBox(height: 50), // Moves image up
              CircleAvatar(
                radius: 160,
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/Robot 2.jpg', width: 180, height: 250),
              ),
              const SizedBox(height: 70),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Providing The Best Solution",
                  style: TextStyle(
                    fontSize: 32, // Slightly reduced size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "I can answer any of your questions related to postpartum and pregnancy. Just ask here.",
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 80),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatbotScreen2()), // Navigate to NextScreen
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "GET STARTED",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
