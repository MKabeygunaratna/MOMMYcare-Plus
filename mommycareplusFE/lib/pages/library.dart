import 'package:flutter/material.dart';
import 'BabyCareScreen.dart';
import 'BreastFeedingScreen.dart';
import 'MentalWellbeingScreen.dart';
import 'FitnessRecoveryScreen.dart';
import 'PostpartumNutritionScreen.dart';
import 'home.dart';
import 'chatbot1.dart';
import 'TodoListScreen.dart';
import 'ProfileScreen.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}
class _LibraryScreenState extends State<LibraryScreen> {
  int _currentIndex = 2;
  final List<Map<String, dynamic>> topics = [
    {
      'title': 'Baby Care',
      'subtitle': 'Understanding Baby Cues',
      'image': 'assets/images/baby_care.jpg',
      'screen': BabyCareScreen(),
    },
    {
      'title': 'Breast Feeding',
      'subtitle': 'Common issues and solutions for latching problems',
      'image': 'assets/images/breast_feeding.jpg',
      'screen': BreastFeedingScreen(),
    },
    {
      'title': 'Mental Wellbeing',
      'subtitle': 'Maintaining a healthy relationship with your partner',
      'image': 'assets/images/mental_wellbeing.jpg',
      'screen': MentalwellbeingScreen(),
    },
    {
      'title': 'Fitness and Body Recovery',
      'subtitle': 'Kegels and other exercises to regain pelvic strength',
      'image': 'assets/images/fitness_recovery.jpg',
      'screen': FitnessRecoveryScreen(),
    },
    {
      'title': 'Postpartum Nutrition',
      'subtitle': 'Essential nutrients for recovery after childbirth',
      'image': 'assets/images/postpartum_nutrition.jpg',
      'screen': PostpartumnutritionScreen(),
    },
  ];
  void _onTabTapped(int index) {
    if(index==_currentIndex)
      return;

    switch(index){
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>HomePage()));
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
            MaterialPageRoute(builder: (Context)=>TodoListScreen())
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Library',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 2,
              ),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => topic['screen'],
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.asset(
                            topic['image'],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  topic['title'],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  topic['subtitle'],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: Colors.white,
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
              },
            ),
          );
        },
      ),
    );
  }
}
