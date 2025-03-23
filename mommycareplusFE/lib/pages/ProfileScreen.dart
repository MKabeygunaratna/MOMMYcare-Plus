import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Profile_Provider.dart';
import 'GuardianProvider.dart';
import 'DoctorProvider.dart';
import 'EditProfileScreen.dart';
import 'UserProvider.dart';
import 'TodoListScreen.dart';
import 'library.dart';
import 'chatbot1.dart';
import 'home.dart';

class Profilescreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<Profilescreen> {
  int _currentIndex = 3;

  void _onTabTapped(int index) {
    if(index==_currentIndex)
      return;

    switch(index){
      case 0:
        Navigator.push(
            context,MaterialPageRoute(builder: (context)=>HomePage()));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>ChatbotScreen())
        );
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>LibraryScreen())
        );
        break; // Added missing break
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Profilescreen())
        );
        break;
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>TodoListScreen())
        );
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);
    final guardianProvider = Provider.of<GuardianProvider>(context);
    final doctorProvider = Provider.of<DoctorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF7261C6),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Planner'
          )
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF7261C6),
        unselectedItemColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: profileProvider.profileImage != null
                    ? FileImage(profileProvider.profileImage!) as ImageProvider
                    : AssetImage("assets/images/profile.jpeg"),
              ),
            ),
            SizedBox(height: 16),
            Text(
              userProvider.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),

            ProfileSection(
              title: 'Personal Information',
              items: [
                {'label': 'Name', 'value': userProvider.name},
                {'label': 'Age', 'value': userProvider.age},
                {'label': 'Postpartum Period', 'value': userProvider.postpartum},
                {'label': 'Baby\'s Name', 'value': profileProvider.babyName},
                {'label': 'Location', 'value': profileProvider.location},
              ],
            ),

            ProfileSection(
              title: 'Guardian Information',
              items: [
                {'label': 'Name', 'value': guardianProvider.name},
                {'label': 'Contact', 'value': guardianProvider.contactNumber},
                {'label': 'Email', 'value': guardianProvider.email},
              ],
            ),

            ProfileSection(
              title: 'Doctor Information',
              items: [
                {'label': 'Name', 'value': doctorProvider.name},
                {'label': 'Contact', 'value': doctorProvider.contactNumber},
                {'label': 'Email', 'value': doctorProvider.email},
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;

  const ProfileSection({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7261C6),
            ),
          ),
        ),
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['label'] ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        item['value'] ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}