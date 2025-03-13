import 'package:flutter/material.dart';
import 'babyCareArticleScreen.dart';
import 'babyCareBookScreen.dart';
import 'videoPlayerScreen.dart';


class BabyCareScreen extends StatefulWidget {
  @override
  _BabyCareScreenState createState() => _BabyCareScreenState();
}

class _BabyCareScreenState extends State<BabyCareScreen> {
  List<Map<String, String>> recentlyWatched = [];
  int selectedTab = 0;

  final List<String> tabs = ["Videos", "Recent", "Books", "Articles"];

  final Map<String, List<Map<String, String>>> topics = {
    "Umbilical Cord Care": [
      {
        "title": "How to care for your baby’s umbilical cord",
        "videoId": "rty9PYI7S_k",
        "description": "A step-by-step guide on keeping your baby's umbilical cord clean and infection-free."
      },
      {
        "title":"New born care:Umbilical Cord Care",
        "videoId":"KajgGUBH9dk",
        "description":"This video is about taking care of the umbilical cord on your baby"
      },
      {
        "title":"How do i take care of the Umbilical Cord stump",
        "videoId":"bdOue2hKzM8&t=11s",
        "description":"Midwife explains how you can care for your baby's umbilical cord stump."
      },
      {
        "title":"EASY Newborn Umbilical Cord Care",
        "videoId":"EntebbkIGdk",
        "description":"Umbilical Cord care can be confusing. We breakdown how to make this easy."
      },
    ],
    "Newborn Sleep Patterns": [
      {
        "title": "Understanding Newborn Sleep Cycles",
        "videoId": "f0xWYk6mXX4",
        "description": "Learn how newborns sleep and how you can establish a routine."
      },
      {
        "title": "Newborn Sleeping Tips From A Pediatrician",
        "videoId": "j0M4v24gSaw",
        "description": "offers parents her expert advice on the essentials of newborn sleep."
      },
      {
        "title": "How much sleep should my newborn baby have?",
        "videoId": "2QJ3Vf55z-Q",
        "description": "Midwife Natalie Carter talks about how much sleep a newborn needs and how every baby is different."
      },
      {
        "title": "How much will my newborn sleep?",
        "videoId": "ViM0a-v7Mdk",
        "description": "explains how much your newborn will sleep in the first few months of life."
      },
    ],
    "Diapering & Hygiene": [
      {
        "title": "How to Change a Newborn’s Diaper Correctly",
        "videoId": "msxX74EucBM",
        "description": "Tips and techniques to change your newborn's diaper safely."
      },
      {
        "title": "How to Change a Baby Diaper | NO LEAKS | Huggies",
        "videoId": "QJxuTe82oxU&t=37s",
        "description": "This technique works when you CHANGE A NEWBORN DIAPER"
      },
      {
        "title": "How to change a baby's diaper",
        "videoId": "cDa2BTZppUc",
        "description": " Let us take you on a step-by-step guide"
      },
      {
        "title": "How do I change a dirty nappy? | NHS",
        "videoId": "XEV-oQmGDto",
        "description": "Midwife Tracey Owen explains the best"
      },
    ],
    "Common Baby Rashes & Skin Care": [
      {
        "title": "Baby Rashes: Types and Treatments",
        "videoId": "ei6Y1AgrOZk",
        "description": "Understanding different baby rashes and how to treat them."
      },
    ],
    "Baby’s First Bath": [
      {
        "title": "Tips on How to Bathe a Baby Safely",
        "videoId": "7yxd25nZMaE",
        "description": "Temperature, timing, and products to use for a safe bath."
      },
    ],
    "Soothing a Crying Baby": [
      {
        "title": "5 Proven Ways to Soothe a Crying Baby",
        "videoId": "j2C8MkY7Co8",
        "description": "Effective ways to calm a fussy baby quickly."
      },
      {
        "title": "5 Proven Ways to Soothe a Crying Baby",
        "videoId": "j2C8MkY7Co8",
        "description": "Effective ways to calm a fussy baby quickly."
      },
      {
        "title": "5 Proven Ways to Soothe a Crying Baby",
        "videoId": "j2C8MkY7Co8",
        "description": "Effective ways to calm a fussy baby quickly."
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Care", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
          Expanded(
            child: selectedTab == 0
                ? buildVideoSection() 
                // : selectedTab == 1
                // ? recentlyWatchedBabyCareScreen() // Add your recent section here
                : selectedTab == 2
                ? BooksScreen()
                : selectedTab == 3
                ? ArticlesScreen() 
                : Container(),
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
                      width: 260,
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
