import 'package:flutter/material.dart';

class ForgetPassword2 extends StatelessWidget {
  const ForgetPassword2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.deepPurple;
    final Color cardColor = Colors.white;
    final Color textColor = Colors.black87;
    final double borderRadius = 16.0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Forgot password",
                style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Reset Password",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[100],
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(Icons.help_outline, size: 40, color: Colors.deepPurple),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Please enter your email or phone number to receive a verification code",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: textColor),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Contact number", style: TextStyle(color: textColor)),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Contact number",
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              filled: true,
                              fillColor: Colors.deepPurple[50],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Request OTP on Email", style: TextStyle(color: textColor)),
                          ),
                          const SizedBox(height: 20),
                          // Since this is the second page, we might just show the SEND button
                          ElevatedButton(
                            onPressed: () {
                              // Perform send action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor.withOpacity(0.8), // Fixed here
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text("SEND"),
                          ),

                        ],
                      ),
                    ),
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
