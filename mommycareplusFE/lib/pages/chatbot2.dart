import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/UserProvider.dart';
import 'package:provider/provider.dart';

class ChatbotScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserProvider>(context).name;
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.08), // Added space to push text to the top
          // Greeting with dynamic username
          Center(
            child: Text(
              "Hi $userName",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: screenHeight * 0.1),

          Image.asset('assets/images/Robot 2.jpg', height: screenHeight * 0.35, width: screenWidth * 0.8, fit: BoxFit.contain),
          SizedBox(height: screenHeight * 0.08),
          // Helper Text
          const Text(
            "How Can I Help You?",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          // Text Input Field Styled Like a Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFF7261C6), width: 2),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: Icon(Icons.emoji_emotions_outlined, color: Color(0xFF7261C6)),
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write To Ask Questions",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF7261C6)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Screen")),
      body: const Center(
        child: Text(
          "You have navigated to a new screen!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}