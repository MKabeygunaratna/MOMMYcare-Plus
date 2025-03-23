import 'package:flutter/material.dart';
import 'TodoListScreen.dart';
import 'ProfileScreen.dart';
import 'library.dart';
import 'chatbot1.dart';
import 'home.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  bool isProSelected = false;

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Subscription Plan',
          style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.06,fontFamily: 'Poppins'),
        ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Toggle Button
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0FF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildToggleButton('Basic', !isProSelected, screenWidth),
                    _buildToggleButton('Pro', isProSelected, screenWidth),
                  ],
                ),
              ),
              SizedBox(height:screenHeight * 0.07 ),

              // Subscription Box
              Container(
                width: screenWidth * 0.9,
                constraints: BoxConstraints(
                  minHeight: screenHeight * 0.5,
                  maxHeight: screenHeight * 0.7, // Ensure it fits small screens
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Purple Top Section
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(screenWidth * 0.08),
                        decoration: const BoxDecoration(
                          color: Color(0xFF8474CB),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            isProSelected ? '\$5 per month' : 'FREE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.1, // Responsive font
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:screenHeight * 0.03 ),
                    _buildFeaturesList(isProSelected, screenWidth),
                    SizedBox(height:screenHeight * 0.03 ),

                    if (isProSelected)
                      Padding(
                        padding:EdgeInsets.only(top: screenHeight * 0.02, bottom: screenHeight * 0.02),
                        child: SizedBox(
                          width: screenWidth * 0.5,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8474CB),
                              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              side: const BorderSide(color: Colors.black, width: 2),
                            ),
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, double screenWidth) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isProSelected = text == 'Pro';
        });
      },
      child: Container(
        padding:EdgeInsets.symmetric(vertical: screenWidth * 0.04, horizontal: screenWidth * 0.1),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8474CB) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesList(bool isPro, double screenWidth) {
    final features = isPro
        ? [
      'Unlimited access for the chatbot',
      'Guardians getting alerts',
      'No ads',
      'Self Care Tips',
    ]
        : [
      'Limited access for the chatbot',
      'EPDS Test',
      'To Do List',
      'Calendar',
      'Educational Library',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: features
            .map((feature) => Padding(
          padding: EdgeInsets.only(bottom: screenWidth * 0.05),
          child: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.black, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  feature,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ))
            .toList(),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75); // Start from the left-bottom

    path.quadraticBezierTo(
      size.width * 0.25, size.height * 1.05, // Smooth arc
      size.width * 0.5, size.height * 0.85,
    );

    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.65, // Another smooth arc
      size.width, size.height * 0.75,
    );

    path.lineTo(size.width, 0); // Move to the top-right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
