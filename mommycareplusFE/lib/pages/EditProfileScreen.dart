import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'Profile_Provider.dart';
import 'GuardianProvider.dart';
import 'DoctorProvider.dart';
import 'UserProvider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController postpartumController;
  late TextEditingController guardianNameController;
  late TextEditingController guardianContactController;
  late TextEditingController babyNameController;
  late TextEditingController guardianEmailController;
  late TextEditingController doctorNameController;
  late TextEditingController doctorEmailController;
  late TextEditingController doctorContactController;
  late TextEditingController locationController;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with data from providers
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    final guardianProvider = Provider.of<GuardianProvider>(context, listen: false);
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context,listen: false);



    nameController = TextEditingController(text: userProvider.name);
    ageController = TextEditingController(text: userProvider.age);
    postpartumController = TextEditingController(text: userProvider.postpartum);
    babyNameController = TextEditingController(text: profileProvider.babyName);
    locationController = TextEditingController(text: profileProvider.location);
    _imageFile = profileProvider.profileImage;

    guardianNameController = TextEditingController(text: guardianProvider.name);
    guardianContactController = TextEditingController(text: guardianProvider.contactNumber);
    guardianEmailController = TextEditingController(text: guardianProvider.email);

    doctorNameController = TextEditingController(text: doctorProvider.name);
    doctorEmailController = TextEditingController(text: doctorProvider.email);
    doctorContactController = TextEditingController(text: doctorProvider.contactNumber);
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    postpartumController.dispose();
    guardianNameController.dispose();
    guardianContactController.dispose();
    babyNameController.dispose();
    guardianEmailController.dispose();
    doctorNameController.dispose();
    doctorEmailController.dispose();
    doctorContactController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future<void> requestPermissions() async {
    await Permission.camera.request();
    await Permission.photos.request();
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Pick from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Take a Photo"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveChanges() {

    if(_formKey.currentState!.validate()){
      final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
      final guardianProvider = Provider.of<GuardianProvider>(context, listen: false);
      final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
      final userProvider = Provider.of<UserProvider>(context,listen: false);


      userProvider.updateUser(
        name:nameController.text,
        age: ageController.text,
        postpartum: postpartumController.text,
      );

      // Update profile data
      profileProvider.updateProfile(
        babyName: babyNameController.text,
        location: locationController.text,
        profileImage: _imageFile,
      );

      // Update guardian data
      guardianProvider.updateGuardian(
        name: guardianNameController.text,
        contactNumber: guardianContactController.text,
        email: guardianEmailController.text,
      );

      // Update doctor data
      doctorProvider.updateDoctor(
        name: doctorNameController.text,
        email: doctorEmailController.text,
        contactNumber: doctorContactController.text,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF7261C6),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.15,
                          backgroundImage: _imageFile != null
                              ? FileImage(_imageFile!) as ImageProvider
                              : const AssetImage("assets/images/profile.jpeg"),
                        ),
                        GestureDetector(
                          onTap: () => _showImagePickerOptions(context),
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.camera_alt, color: Color(0xFF7261C6), size: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Change Photo",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),

                  buildTextField("Name", Icons.person, nameController, TextInputType.text,_validateName),
                  const SizedBox(height: 30),
                  buildTextField("Age", Icons.person, ageController, TextInputType.text,_validateAge),
                  const SizedBox(height: 30),
                  buildTextField("Postpartum Period", Icons.person, postpartumController, TextInputType.text,_validatePeriod),
                  const SizedBox(height: 30),
                  buildTextField("Guardian's Name", Icons.person, guardianNameController, TextInputType.text,_validateName),
                  const SizedBox(height: 30),
                  buildTextField("Guardian's Contact Number", Icons.phone, guardianContactController, TextInputType.phone,_validatePhone),
                  const SizedBox(height: 30),
                  buildTextField("Baby's Name", Icons.child_care, babyNameController, TextInputType.text,_validateName),
                  const SizedBox(height: 30),
                  buildTextField("Guardian's Email", Icons.email, guardianEmailController, TextInputType.emailAddress,_validateEmail),
                  const SizedBox(height: 30),
                  buildTextField("Doctor's Name", Icons.person_2, doctorNameController, TextInputType.text,_validateName),
                  const SizedBox(height: 30),
                  buildTextField("Doctor's Email", Icons.medical_services, doctorEmailController, TextInputType.emailAddress,_validateEmail),
                  const SizedBox(height: 30),
                  buildTextField("Doctor's Contact Number", Icons.phone, doctorContactController, TextInputType.phone,_validatePhone),
                  const SizedBox(height: 30),
                  buildTextField("Location", Icons.place, locationController, TextInputType.text,_validateName),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _saveChanges,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7261C6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015, horizontal: screenWidth * 0.015),
                    ),
                    child: const Text(
                      "UPDATE",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            )

        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, TextEditingController controller, TextInputType inputType,String? Function(String?)? validator) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w300,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w300,
          fontSize: 20,
          color: Colors.black,
        ),
        prefixIcon: Icon(icon, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF6F42C1), width: 2.5),
        ),
      ),
      validator: validator,
    );
  }

  String? _validateName(String? value) => RegExp(r"^[a-zA-Z\s]+$").hasMatch(value ?? '') ? null : 'Only letter and spaces are allowed';

  String? _validateAge(String? value) => (value != null && int.tryParse(value) != null && int.parse(value) > 0) ? null : 'Enter a valid age';

  String? _validatePhone(String? value) => RegExp(r"^\d{10}$").hasMatch(value ?? '') ? null : 'Enter a valid 10-digit phone number';

  String? _validateEmail(String? value) => RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value ?? '') ? null : 'Enter a valid email';

  String? _validatePeriod(String? value) => (value != null && int.tryParse(value) != null && int.parse(value) > 0) ? null : 'Enter a valid postpartum period';
}