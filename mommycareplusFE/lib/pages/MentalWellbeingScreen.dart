import 'package:flutter/material.dart';
import 'videoPlayerScreen.dart';

class MentalWellbeingScreen extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Understanding Baby Cues',
      'thumbnail': 'assets/thumbnails/baby_cue.jpg',
      'videoUrl': 'https://www.example.com/video1.mp4',
    },
    {
      'title': 'How to Swaddle a Baby',
      'thumbnail': 'assets/thumbnails/swaddle.jpg',
      'videoUrl': 'https://www.example.com/video2.mp4',
    },
    {
      'title': 'Baby Sleep Training Tips',
      'thumbnail': 'assets/thumbnails/sleep_tips.jpg',
      'videoUrl': 'https://www.example.com/video3.mp4',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Baby Care')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Baby Care Videos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 150, // Adjust height for horizontal scrolling
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to VideoPlayerScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(videoUrl: video['videoUrl']!),
                      ),
                    );
                  },
                  child: Container(
                    width: 200, // Adjust thumbnail width
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            video['thumbnail']!,
                            width: 200,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          video['title']!,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
