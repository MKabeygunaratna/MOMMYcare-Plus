import 'package:flutter/material.dart';

class BooksScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      author: 'Emily Oster',
      title: 'Cribsheet: A Data-Driven Guide to Better, More Relaxed Parenting, from Birth to Preschool',
      imageUrl: 'assets/Cribsheet.jpg',
      description: '''
       
      ''',
    ),


    Book(
      author: 'S M Gross',
      title: 'The Simplest Baby Book in the World: The Illustrated, Grab-And-Do Guide for a Healthy, Happy Baby',
      imageUrl: 'assets/Simplest_Baby.jpg',
      description: '''
      
The Simplest Baby Book in the World is the illustrated grab-and-do guide that helps first-time moms and dads gain confidence in their ability to be great new parents. More than 700 playful, yet instructive, illustrations make learning faster and easier.

Enjoy an easier first year of raising baby with this curated and distilled collection of essentials, including the best-of-the-best advice on topics like:

• Sleep training and sleeping through the night.

• When and how much to feed your baby.

• Everything you need to know about bath time for newborns.

• How to be safe and stay sane when traveling with your baby.

• Preparing the nursery.

• Solutions to the most common ailments.

• Helpful experience and best practices of the community of those who know best: pediatricians, nurses, lactation specialists, nannies, educators, and other first-time moms and dads.

You will quickly and easily ﬁnd simple solutions and have proven techniques at your ﬁngertips when you need them most, whether it’s 2 a.m. or 2 p.m. Every chapter starts with an essential list of products, providing a handy checklist for everything you will need. Don’t miss recommendations for the must- have products that make parents’ lives easier while saving them time and money. QR codes placed throughout the book will directly link you to our list of the best-of-the-best products and brands.

The Simplest Baby Book is the baby-care solution for all of today’s parents―both moms and dads. At a time when the role of men in providing childcare is increasing, and families come in all shapes and sizes, it is important that parenting reﬂects this new reality. The Simplest Baby Book does just that.

Forget all the other baby books and “bibles” you will never read. Choose The Simplest Baby Book in the World to raise your healthy, happy baby.''',
    ),


    Book(
      author: 'Daniel J. Siegel and Tina Payne Bryson',
      title: 'The Whole-Brain Child: 12 Revolutionary Strategies to Nurture Your Childs Developing Mind',
      imageUrl: 'assets/lord_of_the_rings.jpg',
      description: '''
"Simple, smart, and effective solutions to your child’s struggles.”—Harvey Karp, M.D.

In this pioneering, practical book, Daniel J. Siegel, neuropsychiatrist and author of the bestselling Mindsight, and parenting expert Tina Payne Bryson offer a revolutionary approach to child rearing with twelve key strategies that foster healthy brain development, leading to calmer, happier children. The authors explain—and make accessible—the new science of how a child’s brain is wired and how it matures. The “upstairs brain,” which makes decisions and balances emotions, is under construction until the mid-twenties. And especially in young children, the right brain and its emotions tend to rule over the logic of the left brain. No wonder kids throw tantrums, fight, or sulk in silence. By applying these discoveries to everyday parenting, you can turn any outburst, argument, or fear into a chance to integrate your child’s brain and foster vital growth.

Complete with age-appropriate strategies for dealing with day-to-day struggles and illustrations that will help you explain these concepts to your child, The Whole-Brain Child shows you how to cultivate healthy emotional and intellectual development so that your children can lead balanced, meaningful, and connected lives.

“[A] useful child-rearing resource for the entire family . . . The authors include a fair amount of brain science, but they present it for both adult and child audiences.”—Kirkus Reviews

“Strategies for getting a youngster to chill out [with] compassion.”—The Washington Post

“This erudite, tender, and funny book is filled with fresh ideas based on the latest neuroscience research. I urge all parents who want kind, happy, and emotionally healthy kids to read The Whole-Brain Child. This is my new baby gift.”—Mary Pipher, Ph.D., author of Reviving Ophelia and The Shelter of Each Other

“Gives parents and teachers ideas to get all parts of a healthy child’s brain working together.”—Parent to Parent''',
    ),

    Book(
      author: 'Harper Lee',
      title: 'To Kill a Mockingbird',
      imageUrl: 'assets/to_kill_a_mockingbird.jpg',
      description: 'A classic novel about racial injustice in the Deep South seen through the eyes of young Scout Finch...',
    ),
    Book(
      author: 'Harper Lee',
      title: 'To Kill a Mockingbird',
      imageUrl: 'assets/to_kill_a_mockingbird.jpg',
      description: 'A classic novel about racial injustice in the Deep South seen through the eyes of young Scout Finch...',
    ),
    Book(
      author: 'Harper Lee',
      title: 'To Kill a Mockingbird',
      imageUrl: 'assets/to_kill_a_mockingbird.jpg',
      description: 'A classic novel about racial injustice in the Deep South seen through the eyes of young Scout Finch...',
    ),
    Book(
      author: 'Harper Lee',
      title: 'To Kill a Mockingbird',
      imageUrl: 'assets/to_kill_a_mockingbird.jpg',
      description: 'A classic novel about racial injustice in the Deep South seen through the eyes of young Scout Finch...',
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
                    height: 120,
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
                height: 200,
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
