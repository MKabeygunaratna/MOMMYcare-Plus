import 'package:flutter/material.dart';


class TaskScreen extends StatelessWidget {
  Color buttoncolor = Color(0xFF7261C6);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Hello, Manilka!!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: buttoncolor,
                ),
              ),
            ),

            // Status Overview Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  StatusCard(icon: Icons.list, title: "Tasks for today", count: 5,iconColor:Color(0xFFD97325) ),
                  StatusCard(icon: Icons.hourglass_bottom, title: "In progress", count: 5,iconColor:Color(0xFF255ED9)),
                  StatusCard(icon: Icons.check_circle, title: "Completed", count: 5,iconColor:Color(0xFF5BC63B)),
                  StatusCard(icon: Icons.cancel, title: "Cancelled", count: 5,iconColor:Color(0xFFD92525)),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Tasks Section
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today tasks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttoncolor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text("+ Add", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          TaskCard(title: "Breathing exercises", subtitle: "Doing 15 mins per day"),
                          TaskCard(title: "Best Mom Article", subtitle: "Complete reading the article"),
                          TaskCard(title: "Breathing exercises", subtitle: "Doing 15 mins per day"),
                          TaskCard(title: "Breathing exercises", subtitle: "Doing 15 mins per day"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Edit Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttoncolor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: width * 0.3),
                ),
                child: Text("Edit", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}

class StatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;
  final Color iconColor;
  Color boxcolor = Color(0xFFE5D9F2);
  StatusCard({required this.icon, required this.title, required this.count, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: boxcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.purple),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("$count tasks", style: TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;

  TaskCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}


