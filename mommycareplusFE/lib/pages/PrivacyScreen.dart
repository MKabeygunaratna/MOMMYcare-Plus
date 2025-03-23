import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/SettingsScreen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy",style: TextStyle(fontFamily: 'Poppins'),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Scrollable Privacy Policy Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MOMMYcare+ Privacy Policy",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),

                    // Section 1: Introduction
                    SectionTitle("1. Introduction"),
                    SectionText(
                        "Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal data "
                            "when using the MOMMYcare+ app."),

                    // Section 2: Data Collection
                    SectionTitle("2. Information We Collect"),
                    SectionText(
                        "We may collect the following types of information:\n"
                            "- Personal details (name, email, contact information)\n"
                            "- Health-related data (if provided by the user)\n"
                            "- Usage data (how you interact with the app)\n"
                            ),

                    // Section 3: Data Usage
                    SectionTitle("3. How We Use Your Data"),
                    SectionText(
                        "Your data is used to:\n"
                            "- Provide personalized recommendations\n"
                            "- Improve app functionality and user experience\n"
                            "- Ensure security and prevent fraud\n"
                            "- Communicate important updates and notifications"),

                    // Section 4: Data Protection
                    SectionTitle("4. Data Security"),
                    SectionText(
                        "We take security seriously. We use encryption, secure storage, and authentication methods to protect your personal data. "
                            "However, no system is completely secure, so we encourage users to take precautions as well."),

                    // Section 5: Third-Party Sharing
                    SectionTitle("5. Data Sharing & Third-Party Services"),
                    SectionText(
                        "We do not sell your data to third parties. However, we may share data with:\n"
                            "- Healthcare professionals (only with your consent)\n"
                            "- Cloud storage providers (for data backup and security)\n"
                            "- Legal authorities (if required by law)"),

                    // Section 6: User Rights
                    SectionTitle("6. Your Rights"),
                    SectionText(
                        "You have the right to:\n"
                            "- Access and update your personal data\n"
                            "- Request deletion of your data\n"
                            "- Withdraw consent for data collection\n"
                            "- Contact support for any privacy concerns"),

                    // Section 7: Contact Information
                    SectionTitle("7. Contact Us"),
                    SectionText(
                        "For any questions regarding this Privacy Policy, contact us at privacy@mommycareplus.com."),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // Accept Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7261C6),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text("I Acknowledge", style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsScreen()));
                },
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for Section Titles
class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF554897)),
      ),
    );
  }
}

// Custom Widget for Section Text
class SectionText extends StatelessWidget {
  final String text;
  SectionText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.black87)),
    );
  }
}
