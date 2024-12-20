import 'package:flutter/material.dart';

class ForgetPassword2 extends StatelessWidget {
  const ForgetPassword2({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.deepPurple;
    const Color textColor = Colors.black87;
    const Color white = Colors.white;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Header Text
              const Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              
              const SizedBox(height: 0),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Image.asset(
                            "assets/images/icon-concept-about-forg.png",
                            fit: BoxFit.contain,
                          ),
                        ),

              // Instruction Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Please enter your email or phone number to receive a verification code",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
              ),
              const SizedBox(height: 20),
              // Contact Number Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
  "Contact number",
  style: TextStyle(
    color: Colors.black87,
     fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
 ),

                    const SizedBox(height: 5),
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Contact number",
                        hintStyle: const TextStyle(color: primaryColor,),
                        filled: true,
                        fillColor: primaryColor.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Request OTP on Email Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Request OTP on Email",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Send Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Perform send action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "SEND",
                    style: TextStyle(fontWeight: FontWeight.bold,color: white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
