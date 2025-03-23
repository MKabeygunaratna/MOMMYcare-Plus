import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:mommycareplusFE/pages/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotScreen2 extends StatefulWidget {
  @override
  _ChatbotScreen2State createState() => _ChatbotScreen2State();
}

class Message {
  final String text;
  final bool isUser;
  final bool isLoading;

  Message({required this.text, required this.isUser, this.isLoading = false});
}

class _ChatbotScreen2State extends State<ChatbotScreen2> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = "";
  TextEditingController _textController = TextEditingController();
  List<Message> _messages = [];
  bool _isLoading = false;

  // Update this URL to your NestJS server address
  final String _apiUrl = "http://10.0.2.2:3000/chatbot/ask"; // For Android emulator
  // Use this for iOS simulator or real device testing with your computer's IP
  // final String _apiUrl = "http://192.168.x.x:3000/chatbot/ask";

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
          setState(() {
            _text = result.recognizedWords;
            _textController.text = _text;
          });
        },
      );
    } else {
      setState(() {
        _messages.add(Message(
            text: "Speech recognition not available on this device.",
            isUser: false
        ));
      });
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  Future<void> _sendMessage() async {
    if (_textController.text.trim().isEmpty) return;

    final messageText = _textController.text.trim();
    setState(() {
      _messages.add(Message(text: messageText, isUser: true));
      _textController.clear();
      _text = "";
      _isLoading = true;
      _messages.add(Message(text: "Loading...", isUser: false, isLoading: true));
    });

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'query': messageText}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        setState(() {
          _isLoading = false;
          // Remove the loading message
          if (_messages.isNotEmpty && _messages.last.isLoading) {
            _messages.removeLast();
          }

          if (data.containsKey('answer')) {
            _messages.add(Message(text: data['answer'], isUser: false));
          } else if (data.containsKey('error')) {
            _messages.add(Message(text: "Error: ${data['error']}", isUser: false));
          } else {
            _messages.add(Message(text: "Received an unexpected response format", isUser: false));
          }
        });
      } else {
        setState(() {
          _isLoading = false;
          // Remove the loading message
          if (_messages.isNotEmpty && _messages.last.isLoading) {
            _messages.removeLast();
          }
          _messages.add(Message(
              text: "Server error: ${response.statusCode}",
              isUser: false
          ));
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        // Remove the loading message
        if (_messages.isNotEmpty && _messages.last.isLoading) {
          _messages.removeLast();
        }
        _messages.add(Message(
            text: "Connection error: $e",
            isUser: false
        ));
      });
    }
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
        title: Text(
          "Chat with MommyCare",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          Center(
            child: Text(
              "Hi $userName",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
            ),
          ),
          // Chat messages
          Expanded(
            child: _messages.isEmpty
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Robot 2.jpg',
                    height: screenHeight * 0.3, width: screenWidth * 0.8, fit: BoxFit.contain),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  "How Can I Help You?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            )
                : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 12,
                      left: message.isUser ? 50 : 0,
                      right: message.isUser ? 0 : 50,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: message.isUser ? Color(0xFF7261C6) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: message.isLoading
                        ? Center(child: CircularProgressIndicator(color: Colors.black38))
                        : Text(
                      message.text,
                      style: TextStyle(
                        color: message.isUser ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "Write or Speak to Ask Questions",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _text = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF7261C6)),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
        ],
      ),
    );
  }
}