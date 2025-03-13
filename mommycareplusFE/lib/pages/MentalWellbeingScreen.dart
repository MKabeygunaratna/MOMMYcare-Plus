import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/MentalWellbeingArticleScreen.dart';
import 'package:mommycareplusFE/pages/VideoPlayerScreen.dart';
import 'mentalWellbeingBookScreen.dart';

class MentalwellbeingScreen extends StatefulWidget {
  @override
  _MentalwellbeingScreenState createState() => _MentalwellbeingScreenState();
}

class _MentalwellbeingScreenState extends State<MentalwellbeingScreen> {
  int selectedTab = 0;

  final List<String> tabs = ["Videos", "Recent","Books", "Articles"];

  final List<Map<String, String>> allVideos = [
    {
      "title": "Dear Overwhelmed Moms, Self-Care Isn’t Selfish | Liz Carlile ",
      "videoId": "CyVYnYKzjyg",
      "description": "Self-care and self-love is the key to changing everything in your life."
    },
    {
      "title": "How to Handle Postpartum Mental Health as a New Mom",
      "videoId": "PPmoAKdEGUU",
      "description": "Are you looking for tools for how to handle postpartum mental health? Whether you’re dealing with baby blues, postpartum depression, or postpartum anxiety, there is so much help and support available for new moms! "
    },
    {
      "title": "After baby, don’t bounce back. Bounce forward! | Tiffiny Hall",
      "videoId": "qBVFJYdWses",
      "description": "Tiffiny Hall is founder of TIFFXO.com and author of nine books. She is passionate about helping women feel confident and strong. "
    },
    {
      "title": "10 TIPS FOR POSTPARTUM MENTAL HEALTH | Stephanie Hajal",
      "videoId": "Mlf_2v5xw4Y",
      "description": "After all, you already have enough going on as you adjust to your new life as a mom!"
    },
    {
      "title": "Postpartum Mental Health ",
      "videoId": "pKgYc0Wa1RU",
      "description": "I have a 4 year old daughter and an almost 4 month old son, this video shares my experiences with baby blues & postpartum depression after each baby's birth."
    },
    {
      "title": "10 Self-Care Tips for NEW MOMS ",
      "videoId": "Ybyo5nRmr1Y",
      "description": "The postpartum period is FULL of highs and lows; these are the things that helped me most with my health and wellbeing."
    },
    {
      "title": "Postpartum Anxiety | Self Care for Moms",
      "videoId": "75X3Ksb4pvM",
      "description": "Hey mamas! In this video I'm talking about postpartum anxiety and the major significance of self care for us moms."
    },
    {
      "title": "Common Mental Health Conditions in New Mums - Professor Jane Fisher",
      "videoId": "rh1_cZk1Irg",
      "description": "Professor Jane Fisher - Professor of Women's Health at Monash University, Director of Jean Hailes Research Unit and Psycologist with Masada Private Hospital's Mother & Baby Unit - discusses common mental health concerns for mums in the first few weeks of bringing home a new baby. "
    },
    {
      "title": "Researching How Mom’s Mental Health Impacts Babies",
      "videoId": "kBmqg4Udd9E",
      "description": "Tamar Gur, MD, PhD, a Maternal-Fetal Psychiatrist, not only sees patients in the outpatient psychiatry clinic at The Ohio State University Wexner Medical Center, but is researching how a woman’s mental health impacts her baby. "
    },
    {
      "title": "Postpartum Anxiety and Postpartum OCD",
      "videoId": "cXJmvUPQ-WY",
      "description": "Do you want to learn how to process emotions and improve your mental health? "
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mental Wellbeing", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                        borderRadius: BorderRadius.circular(15),
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
                : selectedTab == 2
                ? Mentalwellbeingbookscreen()
                : selectedTab == 3
                ? Mentalwellbeingarticlescreen()
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget buildVideoSection() {
    return ListView.builder(
      itemCount: allVideos.length,
      itemBuilder: (context, index) {
        final video = allVideos[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Video thumbnail with play button
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        'https://img.youtube.com/vi/${video['videoId']}/0.jpg',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 60,
                      ),
                    ],
                  ),
                ),
              ),
              // Video details
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
      },
    );
  }
}
