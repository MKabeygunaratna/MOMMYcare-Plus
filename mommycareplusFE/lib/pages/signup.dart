import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/Login_screen.dart';

class signup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF8474CB),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevents unwanted stretching
          children: [
            // Purple Header Section
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.2,
              color: const Color(0xFF8474CB),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.06,
                  vertical: screenSize.height * 0.02,
                ),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,color: Colors.white,size: 28),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              height:screenSize.height,
              decoration: const BoxDecoration(
                color: Color(0xFFE8E4E4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.08,
                vertical: screenSize.height * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create An Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  _buildTextField('Full Name', Icons.person),
                  SizedBox(height: screenSize.height * 0.025),
                  _buildTextField('E-mail', Icons.email),
                  SizedBox(height: screenSize.height * 0.025),
                  _buildTextField('Password', Icons.lock, isPassword: true),
                  SizedBox(height: screenSize.height * 0.025),
                  _buildTextField('Confirm Password', Icons.visibility_off, isPassword: true),
                  SizedBox(height: screenSize.height * 0.05),
                  SizedBox(
                    width: double.infinity,
                    height: screenSize.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8474CB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.04),

                  // "or login with" with horizontal lines
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1, endIndent: 10),
                      ),
                      Text('or login with', style: TextStyle(color: Colors.grey[800])),
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1, indent: 10),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialIcon('assets/images/google.png'),
                      _buildSocialIcon('assets/images/facebook.png'),
                      _buildSocialIcon('assets/images/instagram.png'),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Sign In',
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

  Widget _buildTextField(String label, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
  Widget _buildSocialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: Image.asset(
        assetPath,
        height: 60,
        width: 60,
      ),
    );
  }
}

