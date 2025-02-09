import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/home/home.png', width: 24, height: 24),
                label: '',
            ),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/home/robot.png', width: 24, height: 24),
                label: '',
            ),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/home/book.png', width: 24, height: 24),
                label: '',
            ),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/home/Profile.png', width: 24, height: 24),
                label: '',
            ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF7261C6),
            unselectedItemColor: Color(0xFFD9D9D9),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                    'Hello User',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                    ),
                    SizedBox(height: 16),
                    Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                        image: AssetImage('assets/images/home/image1.png'),
                        fit: BoxFit.cover,
                        ),
                    ),
                    height: 150,
                    child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                        ),
                        ),
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                        'Some days are harder than others but remember, it gets easier with time.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                        ),
                        ),
                    ),
                    ),
                    SizedBox(height: 16),
                    Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white, // You can set a background color if needed
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Shadow position
                        ),
                        ],
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Expanded(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                'How are you feeling today?',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                ),
                                ),
                                SizedBox(height: 16),

                                Text(
                                'Take this quick, 10-question self-assessment to check your emotional well-being. Your results are private and for your awareness only.',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black,
                                ),

                                ),
                                SizedBox(height: 16),


                                ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF7261C6),
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    ),
                                ),
                                child: Text('Start Assessment',
                                    style: TextStyle(
                                    color: Colors.white,
                                    ),
                                ),
                                ),
                            ],
                            ),
                        ),
                        SizedBox(width: 16),
                        Image.asset(
                            'assets/images/home/woman.png',
                            fit: BoxFit.cover,
                        ),
                        ],
                    ),
                    ),

                    SizedBox(height: 16),
                    Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Color(0xFFD3CBFD),
                        borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                        children: [
                        Text(
                            'Saturday 25, Jan',
                            style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            ),
                        ),
                        SizedBox(height: 16),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) {
                            return CircleAvatar(
                                backgroundColor: index == 6
                                    ? Color(0xFF7261C6)
                                    : Colors.white,
                                child: Text(
                                (19 + index).toString(),
                                style: TextStyle(
                                    color: index == 6 ? Colors.white : Colors.black,
                                ),
                                ),
                            );
                            }),
                        ),
                        ],
                    ),
                    ),
                    SizedBox(height: 16),
                    Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Color(0xFFEBC6BF),
                        borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                        children: [
                        Image.asset('assets/images/home/image2.png', width: 40, height: 40),
                        SizedBox(width: 16),
                        Expanded(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                'Hi User!! How can I help you?',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                ),
                                ),
                                SizedBox(height: 4),
                                ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF7261C6),
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    ),
                                ),
                                child: Text('Get Started'),
                                ),
                            ],
                            ),
                        ),
                        ],
                    ),
                    ),
                    SizedBox(height: 16),
                    Text(
                    'Today Task',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                    ),
                    SizedBox(height: 8),
                    ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                        return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                            tileColor: Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            ),
                            title: Text(
                            'Wash Baby\'s napkins',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                            ),
                            ),
                            trailing: CircleAvatar(
                            backgroundColor: Color(0xFFDC6FD5),
                            ),
                        ),
                        );
                    },
                    ),
                ],
                ),
            ),
            ),
        ),
        );
    }
}