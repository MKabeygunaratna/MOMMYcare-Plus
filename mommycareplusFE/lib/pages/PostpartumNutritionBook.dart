import 'package:flutter/material.dart';

class Ppnutritionbookscreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      author: 'Anni Daulter',
      title: ' Organically Raised: Conscious Cooking for Babies and Toddlers',
      imageUrl: 'assets/images/Organically Raised.jpg',
      description: '''   
In this comprehensive guide, Anni Daulter emphasizes the importance of organic and nutritious meals for both postpartum mothers and their young children. The book offers a collection of recipes designed to provide essential nutrients during the critical stages of early development and maternal recovery. Daulter advocates for conscious cooking practices that prioritize whole, unprocessed ingredients, aiming to establish healthy eating habits from infancy. Beyond recipes, the book delves into the benefits of organic foods, strategies for sourcing quality ingredients, and tips for meal planning that supports the well-being of both mother and child. By focusing on natural and wholesome foods, Daulter provides a roadmap for families seeking to nurture their health through mindful dietary choices.
      ''',
    ),
    Book(
      author: 'Patrick Holford',
      title: '''The Better Pregnancy Diet: The Definitive Guide to Having a Healthy Baby''',
      imageUrl: 'assets/images/The Better Pregnancy Diet.jpg',
      description: '''
Patrick Holford presents a detailed exploration of nutritional strategies aimed at promoting optimal health during pregnancy and the postpartum period. The book outlines specific dietary recommendations to ensure both mother and baby receive essential nutrients necessary for development and recovery. Holford emphasizes the role of vitamins, minerals, and balanced macronutrients in supporting energy levels, hormonal balance, and overall well-being. The guide also addresses common postpartum challenges such as fatigue and mood fluctuations, offering nutritional solutions to mitigate these issues. By integrating scientific research with practical advice, Holford equips new mothers with the knowledge to make informed dietary choices that facilitate a healthy postpartum experience.
''',
    ),
    Book(
      author: 'Dr. Harriet Holme',
      title: '''Postpartum Nutrition: An Expert's Guide to Eating After a Baby''',
      imageUrl: 'assets/images/Postpartum Nutrition.jpg',
      description: '''
This book provides credible, science-backed information on how to master eating for your health after having a baby, extending to starting weaning. Dr. Harriet Holme, with over a decade of experience as a pediatric doctor and a PhD in genetics, offers insights into eating well after birth, supporting nutrient needs for long-term health, and understanding vitamins and minerals essential for both mother and baby. The guide also addresses nutrition while breastfeeding, benefits of breastmilk, managing conditions like cow’s milk protein allergy and reflux, and provides practical advice on starting weaning, weight management, and safe exercise post-birth.''',
    ),
    Book(
      author: 'Diana Licalzi, MS, RD, CDCES, and Ashley Reaver, MS, RD, CSSD',
      title: 'The Postpartum Nutrition Cookbook',
      imageUrl: 'assets/images/The Postpartum Nutrition Cookbook.webp',
      description: '''
This essential postpartum recovery guide and cookbook helps new moms replenish their bodies with over 100 easy, nutrient-packed recipes, complemented by meal plans and shopping lists. It highlights key nutrients needed to heal and restore the body during the fourth trimester. The book features make-ahead breakfasts, one-handed lunches, and set-it-and-forget-it dinners, along with helpful trackers, grocery shopping lists, targeted nutrition advice, and easy meal-prepping tips for busy new moms. It emphasizes making self-care and proper nutrition a priority during the critical postpartum period.
''',
    ),

    Book(
        author: 'Jaren Soloff',
        title: 'The Postnatal Cookbook: Simple and Nutritious Recipes to Nourish New Mothers',
        imageUrl: 'assets/images/The Postnatal Cookbook.jpg',
        description: '''
Based on the latest research in nutrition science, this cookbook prioritizes whole food, healthy eating for recovering mothers. It highlights nutrients vital to the postpartum period, such as iron, protein, vitamin D, and omega-3-rich foods, in each recipe. The book offers simple and nutritious recipes designed to support new mothers' recovery and well-being after childbirth. 
'''
    ),
    Book(
        author: 'Peter D. Gluckman and Mark Hanson',
        title: 'Nutrition and Lifestyle for Pregnancy and Breastfeeding',
        imageUrl: 'assets/images/Nutrition and Lifestyle.jpg',
        description: '''
This manual offers both scientific and clinical evidence to empower healthcare providers and ensure they have the information necessary to confidently care for prospective and new parents. It provides an overview of the background evidence, highlighting the importance of lifestyle choices prior to and during pregnancy. The book discusses nutritional and lifestyle factors that impact pregnancy and offspring outcomes, based on the latest research and key scientific studies.
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
