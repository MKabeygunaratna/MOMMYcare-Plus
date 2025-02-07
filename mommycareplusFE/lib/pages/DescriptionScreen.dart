import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(appBar: AppBar(title: Text("Terms of Use")), body: Center(child: Text("These Terms of Use govern your access and use of our mobile application and services")));
  }
}