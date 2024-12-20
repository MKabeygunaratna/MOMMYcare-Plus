import 'package:flutter/material.dart';

class ForgetPassword1 extends StatelessWidget {
  const ForgetPassword1({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.deepPurple;
    const Color textColor = Colors.black87;
    const Color white  =  Colors.white;

    return Scaffold(
      backgroundColor:white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color:white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
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
              // Instruction Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Please enter your email or phone number to receive a verification code",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
              ),

              const SizedBox(height: 0),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Image.asset(
                            "assets/images/icon-concept-about-forg.png",
                            fit: BoxFit.contain,
                          ),
                        ),

              // Email Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: const TextStyle(color:primaryColor),
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
              // Request OTP Text
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Request OTP on Phone Number",
                    style: TextStyle(color: textColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forget_password_2');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text("Forgot password",
                      style: TextStyle(fontWeight: FontWeight.bold,color: white)),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
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
                      child: const Text("SEND",
                      style: TextStyle(fontWeight: FontWeight.bold,color: white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
