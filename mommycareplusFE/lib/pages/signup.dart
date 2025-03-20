import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/home.dart';
import 'package:mommycareplusFE/pages/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top right circle logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: screenWidth * 0.15, // 15% of screen width
                      height: screenWidth * 0.15,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],

                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.08,
                  vertical: screenSize.height * 0.04,
                ),
                child: Form(
                  key: _formKey,
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
                      _buildTextField('Full Name', Icons.person,_fullNameController),
                      SizedBox(height: screenSize.height * 0.025),
                      _buildTextField('E-mail', Icons.email,_emailController,isEmail: true),
                      SizedBox(height: screenSize.height * 0.025),
                      _buildTextField('Password', Icons.lock,_passwordController, isPassword: true),
                      SizedBox(height: screenSize.height * 0.025),
                      _buildTextField('Confirm Password', Icons.visibility_off,_confirmPasswordController, isPassword: true),
                      SizedBox(height: screenSize.height * 0.05),
                      SizedBox(
                        width: double.infinity,
                        height: screenSize.height * 0.06,
                        child: ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState?.validate()?? false){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            }
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
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextEditingController controller, {bool isPassword = false,bool isEmail =false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isEmail? TextInputType.emailAddress: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value){
        if(value==null || value.isEmpty){
          return'$label cannot be empty';
        }
        if(isEmail && !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)){
          return'Please enter a valid email';
        }
        if (isPassword && value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        if (label == 'Confirm Password' && value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
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
