import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SampleHomePage.dart';

class GuardianDetailsScreen extends StatelessWidget {
  GuardianDetailsScreen({super.key}); // Constructor

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image at the top
                Image.asset(
                  'assets/images/guardian_image.jpg',
                  width: 300,
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),

                // Title
                const Text(
                  "Guardian’s Details",
                  style: TextStyle(
                    color: Color(0xFF8778CF),
                    fontSize: 28,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 50),

                // Input fields
                buildTextField("Name", nameController, TextInputType.text),
                const SizedBox(height: 25),
                buildTextField("Email", emailController, TextInputType.emailAddress),
                const SizedBox(height: 25),
                buildTextField("Contact Number", contactController, TextInputType.phone),
                const SizedBox(height: 60),


                // Done button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Home Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(
                        guardianName: nameController.text,
                        guardianEmail: emailController.text,
                        guardianContact: contactController.text,
                      )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7261C6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  ),
                  child: const Text(
                    "DONE",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          )

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
