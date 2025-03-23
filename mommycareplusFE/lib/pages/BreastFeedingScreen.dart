
import 'package:flutter/material.dart';
import 'VideoPlayerScreen.dart';
import 'breastFeedingArticleScreen.dart';
import 'breastFeedingBookScreen.dart';


class BreastFeedingScreen extends StatefulWidget {
  @override
  _BreastFeedingScreenState createState() => _BreastFeedingScreenState();
}

class _BreastFeedingScreenState extends State<BreastFeedingScreen> {
  List<Map<String, String>> recentlyWatched = [];
  int selectedTab = 0;

  final List<String> tabs = ["Videos", "Books", "Articles"];
  
  final List<Map<String, String>> allVideos = [
    {
      "title": "Labor & Delivery: Breastfeeding Tips for New Mothers",
      "videoId": "vijHv5GxqRs",
      "description": "Specialists provide high-quality labor and delivery care in warm and friendly environments."
    },
    {
      "title": "Breastfeeding Tips on How to Get a Deep Latch & How to Avoid Pain While Nursing",
      "videoId": "u7Ufl1XR1Qg",
      "description": "Learn how to get a deep latch and avoid pain while nursing."
    },
    {
      "title": "Breast Feeding Your PreTerm Infant",
      "videoId": "TcEnyoJB_9U",
      "description": "How to care for your preterm infant and support breastfeeding."
    },
    {
      "title": "Tips for Increasing Breast Milk Supply | How to Power Pump | Foods to Produce More Milk",
      "videoId": "W9VYI2CFkQQ",
      "description": "Worried about milk supply? Learn tips on power pumping and foods that boost milk production."
    }
  ];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                ? buildVideoSection()
                : selectedTab == 1
                ? Breastfeedingbookscreen()
                : selectedTab == 2
                ? Breastfeedingarticlescreen()
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
                    'https://img.youtube.com/vi/${video['videoId']}/hqdefault.jpg',
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
