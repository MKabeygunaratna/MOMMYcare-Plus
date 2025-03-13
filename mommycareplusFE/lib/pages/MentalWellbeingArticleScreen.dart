import 'package:flutter/material.dart';


class Mentalwellbeingarticlescreen extends StatelessWidget {
  final List<Article> articles = [
    Article(
      author: 'The Courier-Mail',
      title: '''This is a taboo topic for new mums—it's time to change''',
      imageUrl: 'assets/images/MW1.jpg',
      description: '''
      
This article sheds light on the silent struggles new mothers face during the postpartum period, often referred to as the "fourth trimester." Many new mothers experience loneliness, exhaustion, and a lack of mental health support, yet society often expects them to immediately adapt to their new roles with joy and ease.

The article argues that the current maternity care system does not provide enough postnatal support, leading to many mothers feeling overwhelmed and isolated. It emphasizes the importance of open conversations about postpartum mental health and the need to normalize discussions about postpartum depression and anxiety.

The piece also advocates for systemic changes, including:

More accessible mental health resources for new mothers.
Longer hospital stays post-delivery to allow mothers to recover physically and mentally.
Extended maternity leave policies to help mothers adjust without the pressure of returning to work too soon.
Stronger social and family support networks to reduce isolation and stress.
The author calls for governments, healthcare providers, and families to recognize the significance of maternal mental health and take active steps to support new mothers.
''',
    ),
    Article(
      author: 'Verywell Health',
      title: '''Do I Have Postpartum Anxiety, or Am I Just Worried?''',
      imageUrl: 'assets/images/MW2.jpg',
      description: '''
This article explores postpartum anxiety (PPA) and how it differs from the usual worries of new motherhood. Many new moms experience concerns about their baby's health, sleep, and feeding patterns, but postpartum anxiety goes beyond typical concerns and can become debilitating.

Symptoms of postpartum anxiety include:

Persistent, overwhelming worry that doesn’t go away.
Racing thoughts and difficulty sleeping, even when the baby is resting.
Physical symptoms such as a rapid heartbeat, nausea, or dizziness.
A constant fear that something terrible will happen to the baby.
The article highlights that while postpartum depression is widely recognized, postpartum anxiety is often overlooked, even though it affects a significant number of new mothers. The causes of PPA can be biological (hormonal changes), psychological (fear of failure as a mother), or social (lack of support).

Treatment options for postpartum anxiety include:

Cognitive Behavioral Therapy (CBT): Helps new mothers reframe negative thought patterns.
Medication: In severe cases, anti-anxiety medications or antidepressants may be prescribed.
Mindfulness and relaxation techniques: Practices like meditation and breathing exercises can help manage stress.
Support systems: Talking to a therapist, joining a new moms' group, or reaching out to family and friends can provide emotional relief.
The article emphasizes the importance of seeking professional help if the anxiety becomes overwhelming and interferes with daily life.

      ''',
    ),
    Article(
      author: 'The Times',
      title: '''My friend's death shows how we're failing new mums''',
      imageUrl: 'assets/images/MW3.jpg',
      description: '''
This deeply emotional article shares the tragic story of Sophie Middlemiss, a mother who lost her battle with postpartum mental illness. Her death highlights how maternal mental health struggles are often ignored or misunderstood.

The article presents shocking statistics, showing that maternal suicide is one of the leading causes of death in new mothers from six weeks to a year after childbirth. Despite the availability of mental health resources, many mothers do not receive proper care due to stigma, lack of awareness, or fear of judgment.

Key points from the article:

Many new mothers hide their struggles out of fear of being labeled as bad parents.
Routine mental health screening should be mandatory for postpartum women to identify early warning signs.
Education for healthcare professionals is essential to ensure doctors and nurses recognize and properly treat postpartum mental health disorders.
Public awareness campaigns can help normalize discussions around postpartum depression, anxiety, and psychosis, encouraging mothers to seek help without shame.
The piece ends with a strong call to action: maternal mental health should be prioritized just as much as physical health, and no mother should feel alone in her struggles.
''',
    ),
    Article(
      author: 'Motherly',
      title: ''''Mental Health for New Moms: 10 Tips to Support''',
      imageUrl: 'assets/images/MW4.jpg',
      description: '''
This article offers practical advice to new mothers on improving their mental health during the postpartum period. It emphasizes the importance of setting realistic expectations, acknowledging that adjusting to life with a new baby is challenging. The piece advises leaving time in the schedule for "nothing," allowing for flexibility and reducing stress from unmet goals. Additionally, it suggests considering talk therapy, highlighting the convenience of e-therapy apps like BetterHelp or TalkSpace, which enable new moms to connect with licensed therapists without the need for childcare. These strategies aim to help new mothers navigate the complexities of motherhood while maintaining their mental well-being.
''',
    ),
    Article(
      author: '''CHPW's Official Blog''',
      title: 'Three Tips for New Mothers: Managing Postpartum Stress & Strengthening Your Mental Health',
      imageUrl: 'assets/images/MW5.jpg',
      description: '''
Authored by Dr. Tawnya Christiansen, Behavioral Health Director of CHPW, 
this article provides insights into managing postpartum stress. It acknowledges that while motherhood can be joyful, it is also accompanied by stress, especially for first-time moms. The article notes that about 85% of mothers experience some type of mood change postpartum. To cope, it advises new mothers to set realistic expectations, focusing on self-care and baby care as priorities, and accepting that some tasks may be postponed. Building connections with other parents through support groups is recommended to share experiences and reduce feelings of isolation. Lastly, the article encourages new mothers to identify their needs and ask for help from their community, emphasizing that seeking support is a strength that benefits both the mother and the baby.
      ''',
    ),
    Article(
      author: 'Business Insider',
      title: '''Millennials are obsessed with baby apps. It's turning them into weird parents.''',
      imageUrl: 'assets/images/MW6.jpg',
      description: '''
This article examines the increasing reliance of millennial parents on high-tech baby products, such as smart bassinets and vital-sign-monitoring socks, intended to enhance child safety and provide convenience. While these devices aim to alleviate parental anxieties, they often lead to unnecessary stress and compulsive monitoring behaviors. Experts suggest that the tech industry's marketing strategies may exacerbate fears, promoting excessive dependence on gadgets that could detract from intuitive parenting and emotional well-being. The article emphasizes the need for balance, cautioning that an overemphasis on optimization and data tracking can be more detrimental than beneficial.
      ''',
    ),
    Article(
      author: 'The Guardian',
      title: '''The only way I can survive': co-living as a single parent''',
      imageUrl: 'assets/images/MW7.jpg',
      description: '''
This piece explores the concept of co-living among single parents as a strategy to manage financial and emotional challenges. It shares the experiences of individuals who have found that sharing housing with friends or other single parents can significantly reduce financial burdens and provide essential emotional and practical support. The article highlights the benefits of co-living, such as shared expenses and enriched social connections, while also acknowledging the need for careful consideration of compatibility and boundaries. Co-living is presented as a viable solution for single parents seeking to enhance their quality of life amidst financial constraints, fostering a supportive community and redefining traditional notions of family and home. 
    
      ''',
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
