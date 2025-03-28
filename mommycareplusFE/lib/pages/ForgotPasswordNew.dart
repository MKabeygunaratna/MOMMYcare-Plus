import 'package:flutter/material.dart';
import 'EmailVerification.dart';

class ForgotPasswordNew extends StatefulWidget {
  const ForgotPasswordNew({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordNew> createState() => _ForgotPasswordNewState();
}
class _ForgotPasswordNewState extends State<ForgotPasswordNew>{
  static const Color myColor = Color(0xFF8474CB);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool isButtonEnabled = false;

  String? _validateEmail(String? value){
    if(value == null || value.isEmpty){
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if(!emailRegex.hasMatch(value)){
      return 'Enter a valid email';
    }
    return null;
  }
  void _checkeButtonState(){
    setState(() {
      isButtonEnabled = _formKey.currentState?.validate()?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: screenHeight * 0.2,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: TopClipper(),
                    child: Container(
                      height: screenHeight * 0.2,
                      color: myColor,
                    ),
                  ),
                  ClipPath(
                    clipper: SecondClipper(),
                    child: Container(
                      height: screenHeight * 0.2,
                      color: const Color(0xFF9C8FEF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03, horizontal: screenWidth * 0.05
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Forgot your password?',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: myColor,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Let’s reset it!',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Please enter the email address that is linked to your account',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: _validateEmail,
                        onChanged: (value)=> _checkeButtonState(),
                      ),
                      SizedBox(height: screenHeight * 0.2),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
                        child: SizedBox(
                          height: screenHeight * 0.07,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isButtonEnabled? () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      EmailVerification()),
                                );
                              }
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 5,
                            ),
                            child: Text(
                              'RESET PASSWORD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
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
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.9,
        size.width * 0.5, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.5, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SecondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.8,
        size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.4, size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
