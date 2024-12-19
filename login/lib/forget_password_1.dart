import 'package:flutter/material.dart';

class ForgetPassword1 extends StatelessWidget {
  const ForgetPassword1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adjust colors as per your brand or the image
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
                          // Placeholder for the question mark icon/image
                          // Replace with your actual image or icon
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
                            child: Text("Email", style: TextStyle(color: textColor)),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Email",
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
                            child: Text("Request OTP on Phone Number", style: TextStyle(color: textColor)),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate to second page
                              Navigator.pushNamed(context, '/forget_password_2');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple
                              , // Use this instead
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text("Forgot password"),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Perform send action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple
                              , // Use this instead
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
