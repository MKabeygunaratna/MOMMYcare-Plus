import 'package:flutter/material.dart';

class ChatbotScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 60), // Added space to push text to the top
          // Greeting
          const Center(
            child: Text(
              "Hi Manilka",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 80),

          Image.asset('assets/images/Robot 2.jpg', height: 300),
          const SizedBox(height: 60),
          // Helper Text
          const Text(
            "How Can I Help You?",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          // Text Input Field Styled Like a Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFF7261C6), width: 2),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
          const SizedBox(height: 40),
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

