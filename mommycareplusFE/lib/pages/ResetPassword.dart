import 'package:flutter/material.dart';

import 'EmailVerification.dart';

class ResetPassword extends StatelessWidget {
  final Color purpleColor = const Color(0xFF8474CB);

  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Back button and title
            Container(
              // height: 100,
              // width: double.infinity,
              decoration: BoxDecoration(
                color: purpleColor,
                borderRadius: const BorderRadius.only(
                  // bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              //  ),
              //   Padding(

              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add navigation logic if needed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailVerification()),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // color: purpleColor,
                    ),
                  ),
                ],
              ),
            ),
            // Purple wave
            // Container(
            //   height: 100,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: purpleColor,
            //     borderRadius: const BorderRadius.only(
            //       bottomLeft: Radius.circular(50),
            //       bottomRight: Radius.circular(50),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 60),
            // Password form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter New Password',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Your new password must be different from previously used password',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 50),
                  // Password field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: const Icon(Icons.lock, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: purpleColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Confirm password field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: const Icon(Icons.lock, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: purpleColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  // Continue button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your onPressed logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purpleColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'CONTINUE',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
