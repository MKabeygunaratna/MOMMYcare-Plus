import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SampleHomePage.dart';
import 'GuardianProvider.dart';

class GuardianDetailsScreen extends StatelessWidget {
  GuardianDetailsScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final guardianProvider = Provider.of<GuardianProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/guardian_image.jpg',
                width: screenWidth * 0.8,
                height: screenHeight * 0.3,
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.02),
              const Text(
                "Guardian’s Details",
                style: TextStyle(
                  color: Color(0xFF8778CF),
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              buildTextField("Name", nameController, TextInputType.text),
              SizedBox(height: screenHeight * 0.03),
              buildTextField("Email", emailController, TextInputType.emailAddress),
              SizedBox(height: screenHeight * 0.03),
              buildTextField("Contact Number", contactController, TextInputType.phone),
              SizedBox(height: screenHeight * 0.06),
              ElevatedButton(
                onPressed: () {
                  // Update GuardianProvider with new details
                  guardianProvider.updateGuardian(
                    nameController.text,
                    emailController.text,
                    contactController.text,
                  );

                  // Navigate to Home Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7261C6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: screenHeight * 0.02),
                ),
                child: const Text(
                  "DONE",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, TextInputType inputType) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF7261C6), width: 2),
        ),
      ),
    );
  }
}
