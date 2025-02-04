import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentGuardianName;
  final String currentGuardianContact;
  final String currentBabyName;
  final String currentGuardianEmail;
  final String currentDoctorEmail;
  final String currentLocation;
  final File? currentImage;

  EditProfileScreen({
    required this.currentName,
    required this.currentGuardianName,
    required this.currentGuardianContact,
    required this.currentBabyName,
    required this.currentGuardianEmail,
    required this.currentDoctorEmail,
    required this.currentLocation,
    required this.currentImage,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController guardianNameController;
  late TextEditingController guardianContactController;
  late TextEditingController babyNameController;
  late TextEditingController guardianEmailController;
  late TextEditingController doctorEmailController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentName);
    guardianNameController = TextEditingController(text: widget.currentGuardianName);
    guardianContactController = TextEditingController(text: widget.currentGuardianContact);
    babyNameController = TextEditingController(text: widget.currentBabyName);
    guardianEmailController = TextEditingController(text: widget.currentGuardianEmail);
    doctorEmailController = TextEditingController(text: widget.currentDoctorEmail);
    locationController = TextEditingController(text: widget.currentLocation);
  }
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

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


  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
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

              buildTextField("Name", Icons.person, nameController, TextInputType.text),
              const SizedBox(height: 30),
              buildTextField("Guardian's Name", Icons.person, guardianNameController, TextInputType.text),
              const SizedBox(height: 30),
              buildTextField("Guardian's Contact Number", Icons.phone, guardianContactController, TextInputType.phone),
              const SizedBox(height: 30),
              buildTextField("Baby's Name", Icons.child_care, babyNameController, TextInputType.text),
              const SizedBox(height: 30),
              buildTextField("Guardian's Email", Icons.email, guardianEmailController, TextInputType.emailAddress),
              const SizedBox(height: 30),
              buildTextField("Doctor's Email", Icons.medical_services, doctorEmailController, TextInputType.emailAddress),
              const SizedBox(height: 30),
              buildTextField("Location", Icons.place, locationController, TextInputType.text),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  final updatedProfile = {
                    'name': nameController.text,
                    'guardianName': guardianNameController.text,
                    'guardianContact': guardianContactController.text,
                    'babyName': babyNameController.text,
                    'guardianEmail': guardianEmailController.text,
                    'doctorEmail': doctorEmailController.text,
                    'location': locationController.text,
                    'image': _imageFile,
                  };
                  Navigator.pop(context, updatedProfile);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7261C6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                ),
                child: const Text(
                  "UPDATE",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, TextEditingController controller, TextInputType inputType) {
    return TextField(
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
    );
  }
}
