import 'package:flutter/material.dart';

import 'EmailVerification.dart';
// import 'package:mommycareplusFE/pages/EmailVerification.dart';

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF9C6BFC);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // 5% of screen width
              vertical: 16.0,
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
                          'assets/images/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                // Illustration and title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/createAccount.jpg',
                      height: screenWidth * 0.30, // 35% of screen width
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        "Create an Account",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: screenWidth * 0.075, // Scaled font size
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // FULL NAME label
                const _LabelText(text: "Full Name"),
                const SizedBox(height: 8),
                _CustomTextField(
                  hintText: "Full name",
                  prefixIcon: Icons.person_outline,
                  primaryColor: primaryColor,
                ),
                const SizedBox(height: 20),

                // EMAIL label
                const _LabelText(text: "Email"),
                const SizedBox(height: 8),
                _CustomTextField(
                  hintText: "E-mail",
                  prefixIcon: Icons.alternate_email,
                  primaryColor: primaryColor,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                // PASSWORD label
                const _LabelText(text: "Password"),
                const SizedBox(height: 8),
                _CustomTextField(
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  primaryColor: primaryColor,
                ),
                const SizedBox(height: 20),

                // CONFIRM PASSWORD label
                const _LabelText(text: "Confirm Password"),
                const SizedBox(height: 8),
                _CustomTextField(
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  suffixIcon: Icons.visibility_off_outlined,
                  primaryColor: primaryColor,
                ),
                const SizedBox(height: 40),

                // SIGN UP button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle SIGN UP action
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailVerification()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Already have an account? Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Sign In screen
                        // Add verification logic here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailVerification()),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LabelText extends StatelessWidget {
  final String text;
  const _LabelText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: screenWidth * 0.04, // Scaled font size
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Color primaryColor;

  const _CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final fillColor = primaryColor.withOpacity(0.2);

    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontFamily: 'Inter',
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          color: Colors.black45,
          fontSize: screenWidth * 0.04, // Scaled font size
        ),
        prefixIcon: Icon(prefixIcon, color: primaryColor),
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: Colors.black45) : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
