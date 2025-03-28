import 'package:flutter/material.dart';
import 'videoPlayerScreen.dart';
import 'PostpartumNutritionArticle.dart';
import 'PostpartumNutritionBook.dart';
import 'ProfileScreen.dart';
import 'chatbot1.dart';
import 'library.dart';
import 'TodoListScreen.dart';
import 'home.dart';

class PostpartumnutritionScreen extends StatefulWidget {
  @override
  _PostpartumnutritionScreenState createState() => _PostpartumnutritionScreenState();
}

class _PostpartumnutritionScreenState extends State<PostpartumnutritionScreen> {
  List<Map<String, String>> recentlyWatched = [];
  int selectedTab = 0;
  int _currentIndex = 2;

  final List<String> tabs = ["Videos", "Books", "Articles"];

  final List<Map<String, String>> allVideos = [
    {
      "title": "Postpartum Nutrition with Allegra Gast, RDN",
      "videoId": "p279bM7mrVs",
      "description": "Allegra Gast is a San Angelo-based RDN, IBCLC, and postpartum doula with a degree in Nutrition and Food Science from Drexel University in Philadelphia"
    },
    {
      "title": "Foods To Eat During Pregnancy And Postpartum ",
      "videoId": "cK6CJe8tQj0",
      "description": "In this video, we’re talking about protein during pregnancy and postpartum- an important aspect of diet that we don’t think about enough"
    },
    {
      "title": "What new moms should know about a postpartum diet",
      "videoId": "hsn8jCDhHWk",
      "description": "How a new mom fuels herself in the weeks after giving birth is just as important as what she ate while carrying the baby, experts say, but medical recommendations are largely absent."
    },
    {
      "title": "A Dietitian's Guide to Postnatal Nutrition",
      "videoId": "obJK2gHOB-U",
      "description": "Registered dietitian Tracy Lockwood Beckerman gives her favorite foods and nutrition tips for postpartum."
    }
  ];
  void _onTabTapped(int index) {
    if(index== _currentIndex)
      return;

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
      appBar: AppBar(
        title: Text("Breast Feeding", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child:Center(
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
                ? buildVideoSection()
                : selectedTab == 1
                ? Ppnutritionbookscreen()
                : selectedTab == 2
                ? Ppdarticlescreen()
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget buildVideoSection() {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: allVideos.length,
      itemBuilder: (context, index) {
        final video = allVideos[index];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
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

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    'https://img.youtube.com/vi/${video['videoId']}/0.jpg',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 180,
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.broken_image, size: 50, color: Colors.grey[600]),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video['title']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        video['description']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

