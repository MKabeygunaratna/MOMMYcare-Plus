import 'package:flutter/material.dart';
import 'chatbot2.dart';

class ChatbotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF7261C6),
      appBar: AppBar(
        backgroundColor: Color(0xFF7261C6),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Prevent overflow
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05), // Moves image up
              CircleAvatar(
                radius: 160,
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/Robot 2.jpg', width: 180, height: 250),
              ),
              SizedBox(height: screenHeight * 0.07),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Text(
                  "I can answer any of your questions related to postpartum and pregnancy. Just ask here.",
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.08),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatbotScreen2()), // Navigate to NextScreen
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018 , horizontal: screenWidth * 0.15),
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
              SizedBox(height: screenHeight * 0.05), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
