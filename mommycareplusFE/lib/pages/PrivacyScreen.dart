import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(appBar: AppBar(title: Text("Privacy Policy")), body: Center(child: Text("We respect your privacy and are committed to protecting your personal data. This Privacy Policy explains how we collect, use, disclose, and protect your information when you use our app.")));
  }
}