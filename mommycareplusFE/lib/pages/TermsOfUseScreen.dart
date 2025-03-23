import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/SettingsScreen.dart';
import 'ProfileScreen.dart';
import 'chatbot1.dart';
import 'home.dart';
import 'library.dart';
import 'TodoListScreen.dart';

class TermsOfUseScreen extends StatefulWidget {
  @override
  _TermsofUseScreenState createState() => _TermsofUseScreenState();
}
class _TermsofUseScreenState extends State<TermsOfUseScreen>{

  void _onTabTapped(int index) {
    switch(index){
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatbotScreen())
        );
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LibraryScreen())
        );
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoListScreen())
        );
        break;
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profilescreen())
        );
        break;
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms of Use",style: TextStyle(fontFamily: 'Poppins'),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        // No currentIndex specified - all items will be unselected
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Planner',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          )
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF7261C6),
        unselectedItemColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Scrollable Terms Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MOMMYcare+ Terms of Use",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),

                    // Section 1: Introduction
                    SectionTitle("1. Introduction"),
                    SectionText(
                        "Welcome to MOMMYcare+. By using our app, you agree to these terms. Please read them carefully before using our services."),

                    // Section 2: User Responsibilities
                    SectionTitle("2. User Responsibilities"),
                    SectionText(
                        "You are responsible for maintaining the confidentiality of your account information. "
                            "Any activities under your account are your responsibility."),

                    // Section 3: Medical Disclaimer
                    SectionTitle("3. Medical Disclaimer"),
                    SectionText(
                        "MOMMYcare+ provides health-related information, but it is not a substitute for professional medical advice. "
                            "Always consult with a qualified healthcare provider regarding any medical concerns."),

                    // Section 4: Privacy Policy
                    SectionTitle("4. Privacy Policy"),
                    SectionText(
                        "Your privacy is important to us. Please refer to our Privacy Policy to understand how we collect, "
                            "use, and protect your information."),

                    // Section 5: Prohibited Activities
                    SectionTitle("5. Prohibited Activities"),
                    SectionText(
                        "Users must not misuse the app, including hacking, data mining, or distributing harmful content. "
                            "Violation of these terms may result in account suspension."),

                    // Section 6: Modifications to Terms
                    SectionTitle("6. Modifications to Terms"),
                    SectionText(
                        "We may update these Terms of Use periodically. Continued use of the app after changes means you accept the new terms."),

                    // Section 7: Contact Us
                    SectionTitle("7. Contact Us"),
                    SectionText(
                        "If you have any questions, feel free to contact us at support@mommycareplus.com."),

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
                child: Text("I Accept", style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
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
