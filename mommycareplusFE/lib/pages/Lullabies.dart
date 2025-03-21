import 'package:flutter/material.dart';
import 'videoPlayerScreen.dart';

class Lullabies extends StatelessWidget {
  final List<Color> cardColors = [
    Color(0xFFE6D4F8),
    Color(0xFFDCC1B3),
    Color(0xFFC0D9D9),
  ];

  final List<Map<String, String>> allVideos = [
    {
      "title": "THE MOST RELAXING MUSIC FOR BABIES TO SLEEP",
      "videoId": "4owTdwvbyNA",
      "description": "Listen to the songs that will make your baby fall asleep in less than 10 minutes."
    },
    {
      "title": "Best Bedtime Songs 😴 | Lullabies for Babies and Toddlers",
      "videoId": "RIJ4MTjQfFo",
      "description": "Relax before bed with lullaby songs. This calming compilation offers 37 minutes of soothing songs."
    },
    {
      "title": "Moon and Stars Lullaby for Babies",
      "videoId": "fUKVtE80_gU",
      "description": "Let your baby drift into a peaceful slumber under the calming glow of the moon and stars with this 20-minute lullaby."
    },
    {
      "title": "Tiny Baby Flamingo – Standing still in a peaceful, moonlit pond",
      "videoId": "R_cD6ac6pkI",
      "description": "Let your little one drift off to sleep with this soothing bedtime lullaby."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: allVideos.length,
          itemBuilder: (context, index) {
            final video = allVideos[index];
            final cardColor = cardColors[index % cardColors.length];
            final buttonColor = darken(cardColor, 0.2);

            return Card(
              color: cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
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
                    padding: EdgeInsets.all(12),
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
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
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
                            icon: Icon(Icons.play_arrow, color: Colors.white),
                            label: Text(
                              "Play",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final darkened = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }
}
