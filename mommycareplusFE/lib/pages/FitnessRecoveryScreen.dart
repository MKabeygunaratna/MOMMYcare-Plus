import 'package:flutter/material.dart';
import 'videoPlayerScreen.dart';
import 'FitnessRecoveryArticleScreen.dart';
import 'FitnessRecoveryBookScreen.dart';



class FitnessRecoveryScreen extends StatefulWidget {
  @override
  _FitnessRecoveryScreenState createState() => _FitnessRecoveryScreenState();
}

class _FitnessRecoveryScreenState extends State<FitnessRecoveryScreen> {
  int selectedTab = 0;
  final List<String> tabs = ["Videos", "Books", "Articles"];

  final Map<String, List<Map<String, String>>> topics = {
    " Postpartum Workouts": [
      {
        "title": "Daily Postpartum Ab Workout (28 Day Challenge!)",
        "videoId": "wPgq-mNjgTA",
        "description": "These are the daily exercises which is the most effective."
      },
      {
        "title":"Diastasis Recti Repair Workout",
        "videoId":"1WlKyHGxOTY",
        "description":"This workout is #1 of 3 workouts "
      },
      {
        "title":"Feel Good, Postnatal Yoga For Core Healing and Flattening",
        "videoId":"gRFTpwQ433U",
        "description":"It's day 27 of the Postpartum Workout Challenge. "
      },
      {
        "title":"Postpartum Cardio Workout",
        "videoId":"WUYWRHctL-0",
        "description":"workout is an energizing postpartum fat-burning HIIT workout"
      },
    ],
    "Pelvic Floor & Core Recovery": [
      {
        "title": "8-Minute Postpartum Pelvic Floor Exercises To Do Daily",
        "videoId": "-hSZqmuN41E",
        "description": "Today we are doing an 8-minute postpartum pelvic floor exercises"
      },
      {
        "title": "C-Section Recovery Plan",
        "videoId": "s7WQXW5wEDE",
        "description": "The C-Section Recovery Plan is designed specifically for mamas"
      },
      {
        "title": "Pelvic Floor Dysfunction",
        "videoId": "AMUfwpjVzKQ",
        "description": "Pelvic Floor Dysfunction is a condition where something is wrong with the pelvic floor"
      },
      {
        "title": "Diastasis Recti Breathing Exercises",
        "videoId": "ThKahimNQP0",
        "description": "Diastasis recti breathing exercises to heal your gap and restore the function of your core after baby."
      },
    ],
    "C-Section Recovery & Healing": [
      {
        "title": "Prevent C-Section Scar Shelf",
        "videoId": "_iaWXzuR7iQ",
        "description": "This will improve the appearance, prevent pain and improve function of your c-section scar."
      },
      {
        "title": "C-Section Scar Massage",
        "videoId": "jirPjYYmQWg",
        "description": " C-section scar massage can help prevent lumps "
      },
      {
        "title": "Postpartum Swelling",
        "videoId": "Q23k0TXD80E",
        "description": "Postpartum edema is a condition that a mother goes through right after delivery."
      },
      {
        "title": "After C Section Yoga | C Section Recovery",
        "videoId": "iE5lWIEoasI",
        "description": "after c-section yoga with c-section recovery exercises "
      },
    ],
    "Postpartum Weight Loss & Nutrition": [
      {
        "title": "How to LOSE WEIGHT FAST after PREGNANCY",
        "videoId": "2voQlGcGufI",
        "description": "These tips will give you a realistic plan to help you lose weight gain"
      },
      {
        "title": "5 Best Foods to Increase Breast Milk",
        "videoId": "JXRcElhAcPs",
        "description": "top 5 healthiest foods that will help to improve the quality of milk in lactating mothers."
      },
      {
        "title": "Tip for Better POSTPARTUM Recovery: DIET",
        "videoId": "R0pap5sR5QQ",
        "description": "How diet can be your POISON or MEDICINE during your recovery"
      },
      {
        "title": "Postpartum Nutrition: TIPS for Post Birth Recovery",
        "videoId": "F0Tqm6nU8-Q",
        "description": "Nutritionist will give you a lot of helpful nutrion advices for post birth recovery."
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness and Body Recovery", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Navigation Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child:Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 30),
                      decoration: BoxDecoration(
                        color: selectedTab == index ? Color(0xFF7261C6) : Colors.white,


                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xFF7261C6)),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: selectedTab == index ? Colors.white : Color(0xFF7261C6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),

          Expanded(
            child: selectedTab == 0
                ? buildVideoSection() // Video section remains unchanged
                : selectedTab == 1
                ? Fitnessrecoverybookscreen()
                : selectedTab == 2
                ? FitnessRecoveryarticlescreen()
                : Container(), // Optional fallback

          ),
        ],
      ),
    );
  }

  Widget buildVideoSection() {
    return ListView(
      shrinkWrap: true,  // Add this to fix overflow issues
      physics: ClampingScrollPhysics(), // Prevents conflicts with scrolling

      children: topics.keys.map((category) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 280, // Increased height to fit the video and text properly
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: topics[category]!.map((video) {
                    return Container(
                      width: 250,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Adjust shadow to be lighter
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Ensure the video player also has rounded corners
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPlayerScreen(
                                      videoId: video['videoId']!,
                                      title: video['title']!,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 260,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage('https://img.youtube.com/vi/${video['videoId']}/0.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                  size: 60,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  video['title']!,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  video['description']!,
                                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        );
      }).toList(),
    );
  }
}
