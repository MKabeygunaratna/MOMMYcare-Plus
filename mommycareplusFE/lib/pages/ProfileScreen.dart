import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/SampleHomePage.dart';
import 'package:provider/provider.dart';
import 'EditProfileScreen.dart';
import 'SettingsScreen.dart';
import 'package:mommycareplusFE/pages/GuardianProvider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'Username';
  String babyName = "Jessica";
  String doctorEmail = "doctor@example.com";
  String location = "New York, USA";
  File? _profileImage;

  @override
  Widget build(BuildContext context) {
    final guardianProvider = Provider.of<GuardianProvider>(context);
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage())
          ),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              profileContainer(guardianProvider, screenWidth),
              SizedBox(height: screenHeight * 0.05),
              buildProfileDetail("Guardian's Name", guardianProvider.guardianName, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              buildProfileDetail("Guardian's Contact Number", guardianProvider.guardianContact, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              buildProfileDetail("Baby's Name", babyName, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              buildProfileDetail("Guardian's Email", guardianProvider.guardianEmail, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              buildProfileDetail("Doctor's Email", doctorEmail, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              buildProfileDetail("Location", location, screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileContainer(GuardianProvider guardianProvider, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF7261C6), width: 1.5),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: screenWidth * 0.12,
            backgroundColor: const Color(0xFF7261C6).withOpacity(0.2),
            backgroundImage: _profileImage != null
                ? FileImage(_profileImage!)
                : const AssetImage("assets/images/profile.jpeg") as ImageProvider,
          ),
          SizedBox(width: screenWidth * 0.1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
                ElevatedButton(
                  onPressed: () async {
                    final updatedProfile = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(
                          currentName: userName,
                          currentGuardianName: guardianProvider.guardianName,
                          currentGuardianContact: guardianProvider.guardianContact,
                          currentBabyName: babyName,
                          currentGuardianEmail: guardianProvider.guardianEmail,
                          currentDoctorEmail: doctorEmail,
                          currentLocation: location,
                          currentImage: _profileImage,
                        ),
                      ),
                    );
                    if (updatedProfile != null) {
                      setState(() {
                        userName = updatedProfile['name'];
                        babyName = updatedProfile['babyName'];
                        doctorEmail = updatedProfile['doctorEmail'];
                        location = updatedProfile['location'];
                        _profileImage = updatedProfile['image'];

                        guardianProvider.updateGuardian(
                          updatedProfile['guardianName'],
                          updatedProfile['guardianEmail'],
                          updatedProfile['guardianContact'],
                        );
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF7261C6),
                    side: const BorderSide(color: Color(0xFF6F42C1), width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * 0.05),
                  ),
                  child: const Text("Edit Profile"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileDetail(String label, String value,double screenWidth ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF7261C6), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}