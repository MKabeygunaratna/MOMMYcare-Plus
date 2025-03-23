import 'package:flutter/material.dart';


class Ppdarticlescreen extends StatelessWidget {
  final List<Article> articles = [
    Article(
      author: 'Clarissa Wei',
      title: '''30 Days (of Soup) at a Postpartum Hotel''',
      imageUrl: 'assets/images/PPD1.jpeg',
      description: '''
In Taiwan, postpartum recovery is treated with great importance, often involving professional care at postpartum hotels or hiring an at-home nanny. Clarissa Wei, a Taiwan-based cookbook author, shared her experience of staying at a postpartum hotel after giving birth. She enjoyed a daily regimen of three nutritious meals, with soups being central to her diet. These soups, rich in Chinese medicinal herbs, are believed to help restore a woman's qi after childbirth. Despite the initial appreciation, Wei eventually craved variety, sneaking out for fast food. A standout dish during her stay was a dried fig and pork rib soup, offering a delightful sweet-savory flavor. Returning home, she adopted a more balanced approach to postpartum nourishment, blending tradition with personal cravings.
''',
    ),
    Article(
      author: 'KINFertility',
      title: '''Postnatal Depletion: How Long Does It Last and How Do You Treat It?''',
      imageUrl: 'assets/images/PPD2.jpeg',
      description: '''
Postnatal depletion refers to a prolonged state of physical, emotional, and mental exhaustion that can affect women after childbirth. Unlike temporary postpartum recovery, postnatal depletion can persist for weeks, months, or even years, significantly affecting quality of life. The article emphasizes understanding and addressing postnatal depletion proactively. Essential steps include rest, a nutritious diet, prenatal supplementation, and a supportive environment. Traditional practices, such as the first forty days of rest postpartum, can aid recovery, while modern practices stress the importance of a balanced diet, hydration, and continued use of prenatal supplements post-birth. Recognizing and addressing postnatal depletion early by being mindful of its signs and seeking expert help can significantly improve maternal health and well-being.
      ''',
    ),
    Article(
      author: 'MAMALIV',
      title: '''New Mom Burnout: Understanding and Overcoming Postnatal Depletion''',
      imageUrl: 'assets/images/PPD3.jpeg',
      description: '''
This article explores postnatal depletion, a condition characterized by physical and emotional fatigue that can affect mothers for up to ten years after childbirth. It discusses how the demands of modern parenthood, combined with the physical toll of pregnancy and childbirth, contribute to this depletion. The article emphasizes the importance of recognizing the signs of postnatal depletion and offers practical solutions for mothers to increase their well-being sustainably.
''',
    ),
    Article(
      author: 'ABC News',
      title: '''What is Postnatal Depletion and Do I Have It?''',
      imageUrl: 'assets/images/PPD4.jpeg',
      description: '''
This article delves into postnatal depletion, describing it as a physical and mental deterioration caused not just by the process of giving birth and breastfeeding, but by the stresses and strains of modern parenthood. It highlights the importance of acknowledging this condition and seeking appropriate support and treatment to ensure the well-being of new mothers.
''',
    ),
    Article(
      author: '''Nutritious Life''',
      title: 'Postnatal Depletion 101: Everything You Need to Know and How to Avoid It',
      imageUrl: 'assets/images/PPD5.jpeg',
      description: '''
No Drastic Dieting
We tell most of our clients that we don’t even want to see you in our offices before 6 to 8 weeks postpartum. One of the most common mistakes we see postpartum is diving right into the quest to getting your pre-baby body back, stat. The most important thing in the immediate postpartum period is to nourish your body with nutrient dense foods to support recovery (you just had a baby after all!). Not only will this help to replenish diminished nutrient stores such as iron, folate and calcium, but it also supports establishing a healthy breastfeeding supply – if you choose to nurse.

RELATED: What you Need to Know Before Losing Weight After Pregnancy

Supplement Wisely
It can be difficult to meet your increased nutrient needs postpartum through diet alone, especially for new mothers adjusting to life with a newborn. Continuing to take a prenatal supplement for 6 to 12 months postpartum or for at least as long as you are breastfeeding can help replenish nutrient stores, supporting both physical and mental health. However, there is no way to ‘out-supplement’ a bad diet. Eating real, whole foods is still the best way to get in the nutrients you need. Always speak to your doctor before starting a new supplement.

Snack Smart
Keeping your energy up and avoiding getting “hangry” become even more critical when you’re dealing with a newborn or infant, sleep deprivation and a new and often exhausting routine. Eating at regular intervals (every 3 to 4 hours) and keeping your blood sugar stable will help you keep your energy up while juggling a baby. The best way to get in those meals and snacks? Create a “healthy eating support system”. Stock up on easy healthy snacks like nuts, fruit or greek yogurt, enlist your partner, MIL and friends to help you cook and buy groceries those first few weeks, and/or use a grocery delivery service to help source ingredients.
      ''',
    ),
//     Article(
//       author: 'U.S. News & World Report',
//       title: '''Postpartum Fitness Tips to Help You Recover from Delivery''',
//       imageUrl: 'assets/images/FR6.jpg',
//       description: '''
// This article presents expert-backed tips for safely resuming exercise after giving birth. It highlights the physical and mental health benefits of postpartum fitness, emphasizing how movement can help with weight management, muscle recovery, and emotional well-being. The article also discusses common challenges, such as dealing with exhaustion and balancing fitness with parenting duties.
//
// The main fitness tips include:
//
// Start with gentle movement: Walking and stretching are excellent ways to begin recovery.
// Strengthen the pelvic floor first: Kegel exercises help with bladder control and core stability.
// Avoid high-impact activities early on: Running, jumping, and heavy lifting should be postponed until the body is fully healed.
// Prioritize hydration and nutrition: Proper nourishment supports energy levels and recovery.
// Listen to your body: Rest and recovery are just as important as exercise.
// The article also emphasizes the importance of emotional well-being and suggests incorporating mindfulness techniques, such as deep breathing and meditation, to complement physical workouts. It concludes with expert advice on seeking professional guidance from postpartum fitness trainers or physical therapists if needed.
//
// 📌 Key Takeaways:
//
// Begin with walking, stretching, and core-strengthening exercises.
// Hydration and proper nutrition play a key role in postpartum recovery.
// Avoid intense workouts until fully healed.
// Mental well-being is as important as physical recovery.
// 📖 Source: U.S. News & World Report
//       ''',
//     ),
//     Article(
//       author: 'Fitness Blender',
//       title: '''Postpartum Exercise Recommendations: How, When, & Why''',
//       imageUrl: 'assets/images/FR7.jpg',
//       description: '''
// This article delves into the benefits, challenges, and best practices of postpartum fitness. It explains how pregnancy and childbirth impact the body, particularly the abdominal muscles, pelvic floor, and overall strength. The article provides a detailed timeline for when and how to start exercising:
//
// Weeks 1-3 Postpartum: Focus on deep breathing, pelvic floor exercises, and gentle stretching.
// Weeks 4-6 Postpartum: Begin light walking and core activation exercises.
// Weeks 6+ Postpartum: Gradually introduce strength training, yoga, and low-impact cardio.
// Months 3-6 Postpartum: If cleared by a doctor, incorporate moderate-intensity workouts.
// The article emphasizes setting realistic expectations, as every woman’s recovery timeline is different. It also highlights the importance of core rehabilitation to prevent conditions like diastasis recti and pelvic organ prolapse. The article concludes by encouraging new mothers to be patient with themselves and to seek help from professionals if they experience pain or discomfort during workouts.
//
// 📌 Key Takeaways:
//
// Postpartum recovery takes time—start with gentle movements.
// Core rehabilitation is crucial for long-term strength and stability.
// Introduce strength training and cardio gradually.
// Seek professional guidance if experiencing pain or complications.
// 📖 Source: Fitness Blender
//       ''',
//     ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDescriptionScreen(article: article),
                ),
              );
            },
            child:
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'By ${article.author}',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            article.title,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      width: 60,
                      height: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          article.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}

class ArticleDescriptionScreen extends StatelessWidget {
  final Article article;

  const ArticleDescriptionScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Articles',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  article.imageUrl,
                  width: double.infinity,
                  height: 370,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                article.title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'By ${article.author}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 12),
              Text(
                article.description,
                style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class Article {
  final String author;
  final String title;
  final String imageUrl;
  final String description;

  Article({
    required this.author,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}
