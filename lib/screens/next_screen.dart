import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5D9F2),
      body: Center(
        child: Text(
          "Welcome to the Next Screen!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
