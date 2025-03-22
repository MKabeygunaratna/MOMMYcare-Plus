import 'package:flutter/material.dart';


class Breastfeedingarticlescreen extends StatelessWidget {
  final List<Article> articles = [
    Article(
      author: 'Dr. Emma Collins',
      title: 'How to Take Care of Newborn Baby?: A new mom guide     ',
      imageUrl: 'assets/images/sleeping_baby.jpg',
      description: '''
The first few months with your newborn can be chaotic and overwhelming for first-time parents. You will get all kinds of contradicting advice from everyone about newborn baby care after birth. Deciding what advice to follow in regard to newborn care can be confusing. Caring for a newborn is exhausting and challenging, but it is also one of the most wonderful and rewarding experiences of your life. Understanding how to take care of a newborn baby involves learning about feeding, sleeping, and bonding. New parents need to develop a routine that works best for them and their baby while ensuring the baby’s needs are met with love and patience.      

1. Feeding

Newborn infant care, especially in the first month, is crucial in terms of feeding:

Frequency of Feeding
Feed the baby every 2 to 3 hours: Newborns have small stomachs, and they digest breast milk or formula quickly. This frequent feeding schedule ensures they receive adequate nutrition for their rapid growth and development. This should be done until the baby regains birth weight. After that, feeding should be done on demand – watch for baby’s hunger cues and feed whenever they want.

Breastfeeding
Feed only breast milk for the first 6 months: Breast milk is the optimal source of nutrition for newborns. It contains the right balance of nutrients essential for a baby’s growth, immune system development, and overall health.
Breast milk contains vital nutrients and antibodies: The antibodies in breast milk help protect newborns from infections and diseases, giving them a strong start in life.
Ensure the baby latches on firmly without causing pain: A correct latch is crucial for effective breastfeeding. If the latch is painful, it might indicate an improper attachment, leading to nipple soreness and insufficient milk intake for the baby.
The breast should feel less full after feeding: This indicates that the baby is effectively emptying the breast, ensuring they are getting enough milk and helping to maintain milk production.

Formula Feeding
Use a doctor-recommended formula if breastfeeding is not an option: Formula can be a healthy alternative for babies who cannot be breastfed. It is designed to mimic breast milk and provide essential nutrients.
Feed the baby 60 to 90 ml of formula per feeding: This amount is appropriate for newborns and ensures they receive adequate nutrition to support their growth and development.

2. Burping
Once the baby is fed, burping is essential to expel the air they swallow while feeding, which can cause gas and colic. Gently hold the baby against your chest with one hand, ensuring her chin rests on your shoulder. Pat or stroke her back gently until she burps.

3. How to Hold Your Newborn
Support your baby’s head and neck with one hand, as her neck muscles are not strong enough to support her head independently. The neck will support the head on its own after 3 months.

4. Umbilical Cord Stump Care
Give a bath 2-6 hours after birth with lukewarm water in a healthy newborn. Keep the navel area clean and dry. Disinfect your hands before handling the navel area. Look out for signs of infection.

5. Diapering
Change diapers frequently to ensure your baby stays comfortable. Wipe from front to back, especially for baby girls, to prevent UTIs.

6. Bathing
Bathing is usually done 2-6 hours after birth. Start bathing your baby 2-3 times a week after the cord stump falls off. Use lukewarm water, mild baby soap, and ensure the baby’s safety during the process.

7. Massaging
Massage your baby to bond and improve blood circulation and digestion. Apply baby oil or lotion and stroke the body gently.

8. Handling Your Newborn
Always support your baby's neck and handle her gently. Avoid vigorous movements like shaking or throwing. Ensure safety when taking her out in a stroller or baby carrier. Let her lie on her tummy daily for strengthening her muscles and improving vision.
''',
    ),
    Article(
      author: 'Sarah Mitchell, Certified Lactation Consultant',
      title: 'Breastfeeding vs. Formula Feeding: What’s Best for Your Baby?',
      imageUrl: 'assets/images/breastfeeding.jpg',
      description: 'Learn the pros and cons of breastfeeding and formula feeding...',
    ),
    Article(
      author: 'Dr. Emma Collins',
      title: 'Understanding Newborn Sleep Patterns: Why Do They Wake Up So Often?',
      imageUrl: 'assets/images/sleeping_baby.jpg',
      description: 'Sleep patterns can be confusing. Here’s what you need to know...',
    ),
    Article(
      author: 'Dr. Emma Collins',
      title: 'Baby Milestones: What to Expect in the First Year',
      imageUrl: 'assets/images/baby_milestones.jpg',
      description: 'Track your baby’s first year with these important milestones...',
    ),
    Article(
      author: 'Dr. Emma Collins',
      title: 'Dealing with Diaper Rash: Prevention and Treatment Tips',
      imageUrl: 'assets/images/diaper_rash.jpg',
      description: 'Practical tips for preventing and treating diaper rash...',
    ),
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
                      height: 60,
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
                  height: 200,
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
