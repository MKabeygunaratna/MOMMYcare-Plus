import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:mommycareplusFE/pages/UserProvider.dart';
import 'package:provider/provider.dart';

class ChatbotScreen2 extends StatefulWidget {
  @override
  _ChatbotScreen2State createState() => _ChatbotScreen2State();
}

class _ChatbotScreen2State extends State<ChatbotScreen2> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = "";

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          setState(() => _text = result.recognizedWords);
        },
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.08),
          Center(
            child: Text(
              "Hi $userName",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: screenHeight * 0.1),
          Image.asset('assets/images/Robot 2.jpg',
              height: screenHeight * 0.35, width: screenWidth * 0.8, fit: BoxFit.contain),
          SizedBox(height: screenHeight * 0.08),
          const Text(
            "How Can I Help You?",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFF7261C6), width: 2),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.mic, color: _isListening ? Colors.red : Color(0xFF7261C6)),
                    onPressed: _isListening ? _stopListening : _startListening,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write or Speak to Ask Questions",
                        border: InputBorder.none,
                      ),
                      controller: TextEditingController(text: _text),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF7261C6)),
                    onPressed: () {
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


