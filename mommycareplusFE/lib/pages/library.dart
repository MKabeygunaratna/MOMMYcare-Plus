import 'package:flutter/material.dart';
// import 'BabyCareScreen.dart';
// import 'BreastFeedingScreen.dart';
// import 'mental_wellbeing_screen.dart';
// import 'FitnessRecoveryScreen.dart';
// import 'PostpartumNutritionScreen.dart';

class LibraryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> topics = [
    {
      'title': 'Baby Care',
      'subtitle': 'Understanding Baby Cues',
      'image': 'assets/images/baby_care.jpg',
      // 'screen': BabyCareScreen(),
    },
    {
      'title': 'Breast Feeding',
      'subtitle': 'Common issues and solutions for latching problems',
      'image': 'assets/images/breast_feeding.jpg',
      // 'screen': breast_feeding_screen(),
    },
    {
      'title': 'Mental Wellbeing',
      'subtitle': 'Maintaining a healthy relationship with your partner',
      'image': 'assets/images/mental_wellbeing.jpg',
      // 'screen': MentalWellbeingScreen(),
    },
    {
      'title': 'Fitness and Body Recovery',
      'subtitle': 'Kegels and other exercises to regain pelvic strength',
      'image': 'assets/images/fitness_recovery.jpg',
      // 'screen': FitnessRecoveryScreen(),
    },
    {
      'title': 'Postpartum Nutrition',
      'subtitle': 'Essential nutrients for recovery after childbirth',
      'image': 'assets/images/postpartum_nutrition.jpg',
      // 'screen': PostpartumNutritionScreen(),
    },
  ];

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
