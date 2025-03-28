import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/home.dart';
import 'package:provider/provider.dart';
import 'DoctorProvider.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController contactController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    contactController = TextEditingController();

    // Delayed execution to ensure the context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDoctorData();
    });
  }
  void _loadDoctorData(){
    final doctorProvider = Provider.of<DoctorProvider>(context,listen: false);
    nameController.text = doctorProvider.name;
    emailController.text = doctorProvider.email;
    contactController.text = doctorProvider.contactNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image at the top
                  Image.asset(
                    'assets/images/patient-doctor.jpg',
                    width: 300,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),

                  // Title
                  const Text(
                    "Doctor’s Details",
                    style: TextStyle(
                      color: Color(0xFF8778CF),
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Input fields
                  buildTextField("Name", nameController, TextInputType.text,(value){
                    if(value == null || value.trim().isEmpty){
                      return " Name cannot be empty";
                    }
                    if(!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)){
                      return"Only letters and spaces are allowed";
                    }
                    return null;
                  }),
                  const SizedBox(height: 25),
                  buildTextField("Email", emailController, TextInputType.emailAddress,(value){
                    if(value == null|| value.trim().isEmpty){
                      return "Email cannot be empty";
                    }
                    if(!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)){
                      return"Enter a valid email address";
                    }
                    return null;
                  }),
                  const SizedBox(height: 25),
                  buildTextField("Contact Number", contactController, TextInputType.phone,(value){
                    if(value == null || value.trim().isEmpty){
                      return "Contact number cannot be empty";
                    }
                    if(!RegExp(r'^\d{10,}$').hasMatch(value)){
                      return"Enter a valid 10 digit phone number";
                    }
                    return null;
                  }),
                  const SizedBox(height: 60),

                  // Done button
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
                        doctorProvider.updateDoctor(
                          name:nameController.text,
                          email:emailController.text,
                          contactNumber:contactController.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(), // Navigate to Profile Page
                          ),
                        );
                      }
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
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, TextInputType inputType,String? Function(String?)? validator) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validator,
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
  String? validateName(String?value){
    if(value == null || value.trim().isEmpty){
      return"Name is required";
    }
    return null;
  }
  String? validateEmail(String?value){
    if(value == null || value.trim().isEmpty){
      return"Name is required";
    }
    return null;
  }
  String? validateContact(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Contact number is required";
    }
    final contactRegex = RegExp(r"^[0-9]{10,}$");
    if (!contactRegex.hasMatch(value)) {
      return "Enter a valid contact number (at least 10 digits)";
    }
    return null;
  }


}