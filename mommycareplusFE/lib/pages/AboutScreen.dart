import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(appBar: AppBar(title: Text("MOMMYCare+")), body: Center(child: Text("About MOMMYCare+")));
  }
}