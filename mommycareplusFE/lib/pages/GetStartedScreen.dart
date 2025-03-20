import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/SampleHomePage.dart';
import 'Login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: screenHeight * 0.1),
            const Text(
              'MOMMYcare+',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6D43C5),
              ),
            ),
             SizedBox(height: screenHeight * 0.06),
            Center(
              child: Image.asset(
                'assets/images/Splash_screen.png',
                width: screenWidth * 0.7,
                height: screenWidth * 0.7,
                fit: BoxFit.contain, // Ensures the whole image is visible
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Text(
              'Every Mom Deserves to\nFeel Her Best',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'postnobillscolombo',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF6D43C5),
              ),
            ),
             SizedBox(height: screenHeight * 0.1),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6D43C5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height:  screenHeight * 0.05,),
          ],
        ),

      )

    );
  }
}
