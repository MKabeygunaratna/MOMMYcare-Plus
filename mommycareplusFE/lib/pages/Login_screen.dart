import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/ForgotPasswordNew.dart';
import 'package:mommycareplusFE/pages/signup.dart';
import 'home.dart';
import 'Access_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(  // Wrap the entire body inside SingleChildScrollView
        child: Column(
          children: [
            // Top Section (removed Container, keeping internal data)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenSize.height * 0.04),
                  Text(
                    'Hello!',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.09,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Welcome to MOMMYcare+',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Image.asset(
                    'assets/images/loginImage.png',
                    height: screenSize.height * 0.2,
                    width: screenSize.width * 0.3,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            // Login Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8474CB),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'E-mail',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>ForgotPasswordNew())
                        );

                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Color(0xFF8474CB)),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  SizedBox(
                    width: double.infinity,
                    height: screenSize.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AccessScreen1()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8474CB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1, endIndent: 10),
                      ),
                      Text('or login with', style: TextStyle(color: Colors.grey[800])),
                      Expanded(
                        child: Divider(color: Colors.grey,thickness: 1,indent: 10),
                      )
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          // Google login logic
                        },
                        child: Image.asset(
                          'assets/images/google.png',
                          height: screenSize.height * 0.1,
                          width: screenSize.width * 0.2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Facebook login logic
                        },
                        child: Image.asset(
                          'assets/images/facebook.png',
                          height: screenSize.height * 0.1,
                          width: screenSize.width * 0.2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Instagram login logic
                        },
                        child: Image.asset(
                          'assets/images/instagram.png',
                          height: screenSize.height * 0.1,
                          width: screenSize.width * 0.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signup()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Color(0xFF8474CB)),
                        ),
                      ),
                    ],
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
