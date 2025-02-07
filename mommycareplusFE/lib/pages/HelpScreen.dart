import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(appBar: AppBar(title: Text("Help Center")), body: Center(child: Text("We are here to help you")));
  }
}