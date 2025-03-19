import 'package:flutter/material.dart';
import 'Reset_password_screen.dart';

class EmailVerification extends StatefulWidget {
  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}
class _EmailVerificationState extends State<EmailVerification>{
  static const Color myColor = Color(0xFF8474CB);
  final List<TextEditingController> _controllers = List.generate(4,(index) => TextEditingController());
  final List<FocusNode>_focusNodes = List.generate(4, (index) => FocusNode());

  void _onChanged(String value, int index){
    if(value.isNotEmpty){
      if(index < 3){
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
      else{
        _focusNodes[index].unfocus();
      }
    }
  }
  bool get isOtpComplete => _controllers.every((controller) =>controller.text.length == 1);


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
                        vertical: screenHeight * 0.03, horizontal: screenWidth * 0.05),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Get Your Code',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: myColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Please enter the 4-digit code that was sent to your email address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                      (index) => Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEE8F8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLength: 1,
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                      onChanged: (value){
                        _onChanged(value, index);
                        setState(() {});
                      },
                      onSubmitted: (_)=> setState(() {}),
                      onTap: () => setState(() {}),
                      onEditingComplete: () => setState(() {}),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
              child: SizedBox(
                height: screenHeight * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isOtpComplete? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetPassword()),
                    );
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
                    'VERIFY AND PROCEED',
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
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.9, size.width * 0.5, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.5, size.width, size.height * 0.7);
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
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.8, size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.4, size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}