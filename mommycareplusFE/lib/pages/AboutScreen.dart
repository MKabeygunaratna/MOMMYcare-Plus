import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';
import 'ProfileScreen.dart';
import 'TodoListScreen.dart';
import 'chatbot1.dart';
import 'library.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>{

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("About MOMMYcare+",style: TextStyle(fontFamily: 'Poppins'),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },

        )
      ),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/Logo.jpg',
                width: 300,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),

            // App Introduction
            Text(
              "Welcome to MOMMYcare+",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "MOMMYcare+ is designed to support new and expectant mothers through postpartum challenges. "
                  "Our mission is to ensure that no mother faces these challenges alone.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 20),

            // Why MOMMYcare+
            Text(
              "Why MOMMYcare+?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Many mothers experience postpartum depression (PPD) without realizing it. "
                  "MOMMYcare+ helps mothers, families, and healthcare professionals track postpartum health.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 20),

            // Features List
            Text(
              "Key Features",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            FeatureTile(
                icon: FontAwesomeIcons.heartPulse,
                text: "Postpartum Depression Screening"),
            FeatureTile(
                icon: FontAwesomeIcons.brain,
                text: "Personalized Stress-Relief Recommendations"),
            FeatureTile(
                icon: FontAwesomeIcons.baby,
                text: "Baby Health Tracking"),
            FeatureTile(
                icon: FontAwesomeIcons.peopleGroup,
                text: "Family Engagement & Support"),
            FeatureTile(
                icon: FontAwesomeIcons.bookOpenReader,
                text: "Educational Resources"),
            FeatureTile(
                icon: FontAwesomeIcons.calendarCheck,
                text: "Appointment & Medication Reminders"),
            SizedBox(height: 20),

            // Mission
            Text(
              "Our Mission",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "At MOMMYcare+, we believe that every mother deserves the best postpartum care. "
                  "By combining technology with emotional support, we strive to create a healthier, happier motherhood journey.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 20),

            // Contact Info
            Text(
              "Need Help?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            ContactTile(
                icon: FontAwesomeIcons.envelope,
                text: "support@mommycareplus.com"),
            ContactTile(
                icon: FontAwesomeIcons.globe,
                text: "www.mommycareplus.com"),

            SizedBox(height: 30),
            Center(
              child: Text(
                "MOMMYcare+ – Because Your Well-being Matters!",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple.shade700),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Custom Feature List Tile
class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String text;

  FeatureTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF8474CB)),
      title: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

// Custom Contact Info Tile
class ContactTile extends StatelessWidget {
  final IconData icon;
  final String text;

  ContactTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF8474CB)),
      title: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.blue.shade700),
      ),
      onTap: () {},
    );
  }
}
