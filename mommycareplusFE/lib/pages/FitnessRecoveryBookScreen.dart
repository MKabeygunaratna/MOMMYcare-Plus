import 'package:flutter/material.dart';

class Fitnessrecoverybookscreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      author: ' Jen Torborgn',
      title: 'Your Best Body after Baby: A Postpartum Guide to Exercise, Sex, and Pelvic Floor Recovery',
      imageUrl: 'assets/images/Your Best Body.jpg',
      description: '''
      
This book provides a step-by-step guide for new mothers looking to regain strength, confidence, and overall well-being after childbirth. Written by a pelvic floor physical therapist, it focuses on the critical early recovery period and the months that follow. It covers essential topics like healing after vaginal or cesarean birth, addressing common postpartum issues such as diastasis recti, pelvic organ prolapse, and back pain.

The book emphasizes intentional recovery through proper breathing, core activation, and gentle movements before transitioning to a structured exercise program. It also includes practical tips for improving posture, preventing injuries, and safely returning to high-impact activities. Special attention is given to postpartum sexual health, including how to make intercourse pain-free and improve pelvic floor function.

Through expert guidance and actionable strategies, Your Best Body After Baby empowers new mothers to prioritize self-care while adjusting to life with a newborn.

      ''',
    ),

    Book(
      author: 'Ruth E. Macy',
      title: '''Your Postpartum Body: The Complete Guide to Healing After Pregnancy''',
      imageUrl: 'assets/images/Your Postpartum Body.jpg',
      description: '''
This book serves as a comprehensive guide to postpartum recovery, covering not just fitness but also hydration, nutrition, lactation, pain relief, and mental well-being. Ruth E. Macy, a pelvic floor physical therapist, provides a holistic approach to help new mothers heal efficiently after childbirth.

The book walks readers through every stage of postpartum healing, explaining how to restore abdominal muscles, reduce pain, and regain mobility. It provides exercises tailored to various recovery needs, from C-section healing to strengthening weakened pelvic floor muscles. There is also a section on mental health support, including managing postpartum depression and anxiety.

For mothers looking to regain strength safely and sustainably, this book offers practical advice on rebuilding energy, restoring muscle tone, and returning to an active lifestyle. It also includes clear illustrations and easy-to-follow guides, making it accessible for all mothers, regardless of their fitness background.
''',
    ),

    Book(
      author: 'Jessica Hatcher-Moore',
      title: 'After Birth: What Nobody Tells You – How to Recover Body and Mind',
      imageUrl: 'assets/images/After Birth.jpg',
      description: '''
In this honest and research-backed guide, journalist Jessica Hatcher-Moore sheds light on the realities of postpartum recovery, addressing both the physical and emotional toll of childbirth. The book highlights lesser-discussed postpartum issues such as hair loss, painful intercourse, diastasis recti, bladder leaks, and mental health struggles.

Hatcher-Moore blends scientific insights with personal experiences, including interviews with midwives, doctors, and mothers. She explores traditional and modern approaches to healing and offers practical strategies for easing pain, improving core strength, and overcoming postpartum exhaustion.

Beyond physical recovery, After Birth delves into emotional well-being, helping mothers rebuild their confidence and identity. There is also a section for partners, equipping them with the knowledge to provide better support. This book is a must-read for any new mother seeking to reclaim her body and mind post-birth.
''',
    ),
    Book(
      author: 'Dr. Oscar Serrallach',
      title: 'The Postnatal Depletion Cure',
      imageUrl: 'assets/images/The Postnatal Depletion Cure.jpg',
      description: '''
Dr. Oscar Serrallach introduces the concept of postnatal depletion, a condition characterized by fatigue, brain fog, nutrient deficiencies, and emotional burnout that can persist for years after childbirth. Based on years of medical research, this book identifies how pregnancy and postpartum significantly deplete a mother's body and mind.

The book explains how hormonal shifts, lack of sleep, and nutritional deficiencies can cause chronic exhaustion, mood swings, and even autoimmune conditions. It presents a science-backed recovery plan called the "Hundred Days of Repletion," which includes:
✔ A diet plan rich in essential postpartum nutrients
✔ A step-by-step exercise routine to regain strength
✔ Strategies to balance hormones naturally
✔ Methods to improve sleep, reduce stress, and enhance mental clarity

The Postnatal Depletion Cure is an invaluable resource for mothers struggling with long-term postpartum fatigue, helping them rebuild their health and vitality.
''',
    ),
    Book(
        author: 'January Harshe',
        title: 'Birth Without Fear: The Judgment-Free Guide to Taking Charge of Your Pregnancy, Birth, and Postpartum',
        imageUrl: 'assets/images/Birth Without Fear.jpg',
        description: '''
January Harshe, founder of the Birth Without Fear movement, empowers women to embrace pregnancy, childbirth, and postpartum recovery without fear or judgment. This book goes beyond just fitness and recovery—it celebrates all birth experiences, whether natural, medicated, or C-section.

Harshe provides guidance on:
✔ Making informed decisions about labor, delivery, and postpartum healing
✔ Postpartum self-care, including mental health, physical recovery, and body image
✔ Embracing self-love and confidence after childbirth
✔ Navigating relationship changes and partner involvement

This book is perfect for first-time mothers looking for a compassionate and empowering guide to pregnancy, birth, and postpartum recovery.
'''
    ),
    Book(
        author: 'Kate Rope',
        title: 'Strong Like a Mother: How to Stay Healthy, Happy, and (Most Importantly) Sane from Pregnancy to Parenthood',
        imageUrl: 'assets/images/Strong Like a Mother.jpg',
        description: '''
This book takes a holistic approach to postpartum health, addressing physical recovery, mental wellness, and emotional resilience for new mothers. Kate Rope, an award-winning journalist and mother, combines scientific research with personal experiences to offer practical advice on rebuilding strength and maintaining mental well-being.

The book covers:
✔ Postpartum exercise plans for different fitness levels
✔ Pelvic floor and core recovery exercises
✔ Strategies to manage postpartum depression, anxiety, and sleep deprivation
✔ Tips for balancing motherhood with self-care
✔ Expert insights from OB-GYNs, mental health professionals, and fitness trainers

Unlike many postpartum books that focus solely on fitness, Strong Like a Mother emphasizes the importance of mental health and emotional well-being in the recovery process. It provides realistic, judgment-free advice on how to heal, regain confidence, and feel strong both physically and mentally.

This book is perfect for new moms who want to prioritize their well-being while navigating the challenges of motherhood.
'''
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7, // Adjust height to width ratio
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDescriptionScreen(book: book),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    book.imageUrl,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'By ${book.author}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
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

class BookDescriptionScreen extends StatelessWidget {
  final Book book;

  const BookDescriptionScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                book.imageUrl,
                width: double.infinity,
                height: 370,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              book.title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'By ${book.author}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              book.description,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Book {
  final String author;
  final String title;
  final String imageUrl;
  final String description;

  Book({
    required this.author,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}
