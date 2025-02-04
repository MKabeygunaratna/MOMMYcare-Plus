import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ProfileScreen.dart';
import 'Questions.dart';

class HomePage extends StatefulWidget {
  final String guardianName;
  final String guardianEmail;
  final String guardianContact;


  const HomePage({
    Key? key,
    required this.guardianName,
    required this.guardianEmail,
    required this.guardianContact,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentDay = 1;
  bool testCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentDay = (prefs.getInt('currentDay') ?? 1);
      testCompleted = (prefs.getBool('testCompleted') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      guardianName: widget.guardianName,
                      guardianEmail: widget.guardianEmail,
                      guardianContact: widget.guardianContact,
                    ),
                  ),
                );
              },
              child: Text('View Profile'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: testCompleted
                  ? null
                  : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EPDSQuizScreen()),
                );
              },
              child: Text(testCompleted ? 'Test Completed' : 'Go to Questions'),
            ),
          ],
        ),
      ),
    );
  }
}
