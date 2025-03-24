import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http_parser/http_parser.dart';

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
  String _text = "";
  TextEditingController _textController = TextEditingController();
  List<Message> _messages = [];
  bool _isLoading = false;

  // Audio recording
  late AudioRecorder _audioRecorder;
  bool _isRecording = false;
  String? _recordingPath;

  // API URLs
  final String _textApiUrl = "http://10.0.2.2:3000/chatbot/ask"; // Text endpoint
  final String _voiceApiUrl = "http://10.0.2.2:3000/chatbotvoice/ask"; // Voice endpoint

  @override
  void initState() {
    super.initState();
    _audioRecorder = AudioRecorder();
    _requestPermissions();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _requestPermissions() async {
    await Permission.microphone.request();
    await Permission.storage.request();
  }

  // Start recording audio
  Future<void> _startRecording() async {
    try {
      if (await Permission.microphone.request() != PermissionStatus.granted) {
        setState(() {
          _messages.add(Message(
              text: "Microphone permission denied",
              isUser: false
          ));
        });
        return;
      }

      // Prepare recording path
      final dir = await getTemporaryDirectory();
      final recordingPath = '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.wav';
      _recordingPath = recordingPath; // Store in the class variable

      // Check if recording is already in progress
      if (await _audioRecorder.isRecording()) {
        await _audioRecorder.stop();
      }

      // Configure and start recording
      await _audioRecorder.start(
        RecordConfig(
          encoder: AudioEncoder.wav,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: recordingPath, // Use the non-nullable local variable
      );

      setState(() {
        _isRecording = true;
      });

      // Show recording indicator in chat
      setState(() {
        _messages.add(Message(
            text: "Recording audio...",
            isUser: true,
            isLoading: true
        ));
      });
    } catch (e) {
      setState(() {
        _messages.add(Message(
            text: "Error starting recording: $e",
            isUser: false
        ));
      });
    }
  }

  // Stop recording and send audio to server
  Future<void> _stopRecording() async {
    try {
      if (!_isRecording) return;

      final path = await _audioRecorder.stop();
      setState(() {
        _isRecording = false;
      });

      // Remove the recording indicator
      if (_messages.isNotEmpty && _messages.last.isLoading) {
        setState(() {
          _messages.removeLast();
        });
      }

      if (path != null) {
        setState(() {
          _messages.add(Message(
              text: "Sending voice message...",
              isUser: true
          ));
        });

        await _sendVoiceMessage(path);
      }
    } catch (e) {
      setState(() {
        _messages.add(Message(
            text: "Error stopping recording: $e",
            isUser: false
        ));
      });
    }
  }

  // Send recorded audio to the server
  Future<void> _sendVoiceMessage(String audioPath) async {
    try {
      setState(() {
        _isLoading = true;
        _messages.add(Message(
            text: "Processing your voice message...",
            isUser: false,
            isLoading: true
        ));
      });

      final file = File(audioPath);
      if (!await file.exists()) {
        throw Exception("Recording file not found");
      }

      // Create multipart request
      var request = http.MultipartRequest('POST', Uri.parse(_voiceApiUrl));

      // Add file to request
      request.files.add(await http.MultipartFile.fromPath(
        'audio_file',
        file.path,
        contentType: MediaType('audio', 'wav'),
      ));

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      // Process response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        setState(() {
          _isLoading = false;
          // Remove loading message
          if (_messages.isNotEmpty && _messages.last.isLoading) {
            _messages.removeLast();
          }

          // If the backend returns the recognized query, display it
          if (data.containsKey('query')) {
            _messages.add(Message(
                text: "Voice query: ${data['query']}",
                isUser: true
            ));
          }

          // Display answer
          if (data.containsKey('answer')) {
            _messages.add(Message(
                text: data['answer'],
                isUser: false
            ));
          } else if (data.containsKey('error')) {
            _messages.add(Message(
                text: "Error: ${data['error']}",
                isUser: false
            ));
          } else {
            _messages.add(Message(
                text: "Received an unexpected response format",
                isUser: false
            ));
          }
        });
      } else {
        setState(() {
          _isLoading = false;
          // Remove loading message
          if (_messages.isNotEmpty && _messages.last.isLoading) {
            _messages.removeLast();
          }
          _messages.add(Message(
              text: "Server error: ${response.statusCode}",
              isUser: false
          ));
        });
      }

      // Clean up the audio file
      try {
        await file.delete();
      } catch (e) {
        print("Error deleting audio file: $e");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        // Remove loading message
        if (_messages.isNotEmpty && _messages.last.isLoading) {
          _messages.removeLast();
        }
        _messages.add(Message(
            text: "Error sending voice message: $e",
            isUser: false
        ));
      });
    }
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
        Uri.parse(_textApiUrl),
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
                  // Voice recording button only
                  IconButton(
                    icon: Icon(
                        _isRecording ? Icons.stop_circle : Icons.mic,
                        color: _isRecording ? Colors.red : Color(0xFF7261C6)
                    ),
                    onPressed: _isRecording ? _stopRecording : _startRecording,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "Write or Record to Ask Questions",
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