import 'package:flutter/material.dart';
//import 'package:mommycareplusFE/pages/ChatScreen.dart';
import 'package:mommycareplusFE/pages/ProfileScreen.dart';
import 'package:mommycareplusFE/pages/Question_welcome_page.dart';
import 'package:mommycareplusFE/pages/Questions.dart';
import 'package:mommycareplusFE/pages/SettingsScreen.dart';
import 'package:mommycareplusFE/pages/SubscriptionScreen.dart';
import 'package:mommycareplusFE/pages/UserProvider.dart';
import 'package:mommycareplusFE/pages/chatbot1.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  int _currentIndex = 0;
  Map<DateTime, List<String>> _reminders = {}; // Store reminders
  final List<String> _tasks = [];

  void _onTabTapped(int index) {
    if(index==_currentIndex)
      return;

    switch(index){
      case 0:
        Navigator.pushReplacement(
            context,MaterialPageRoute(builder: (context)=>HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context)=>ChatbotScreen())
        );
        break;
      case 2:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context)=>ChatbotScreen())
        );
      case 3:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context)=>ProfileScreen())
        );




    }
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });


    if (selectedDay.isAfter(DateTime.now())) {
      _addReminder(selectedDay);
    }
  }

  void _addReminder(DateTime date) {
    TextEditingController _reminderController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Reminder'),
        content: TextField(
          controller: _reminderController,
          decoration: InputDecoration(hintText: 'Enter your reminder'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_reminderController.text.isNotEmpty) {
                setState(() {
                  if (_reminders[date] == null) {
                    _reminders[date] = [];
                  }
                  _reminders[date]!.add(_reminderController.text);
                });
              }
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderList() {
    List<String> reminders = _reminders[_selectedDay] ?? [];

    return reminders.isEmpty
        ? Center(child: Text("No reminders for this day"))
        : ListView.builder(
      shrinkWrap: true,
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(reminders[index]),
          leading: Icon(Icons.notifications),
        );
      },
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFD3CBFD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: _onDaySelected,
            calendarFormat: CalendarFormat.week,
            availableCalendarFormats: {CalendarFormat.week: 'Week'},
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(color: Color(0xFF7261C6), shape: BoxShape.circle),
              todayDecoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            ),
            eventLoader: (day) => _reminders[day] ?? [],
          ),
          SizedBox(height: 10),
          _buildReminderList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserProvider>(context).name;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello $userName!"),
        actions: [
          /**IconButton(
            icon: Icon(Icons.chat,color: Colors.black),
            tooltip: "Mothers' Chat",
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> ChatScreen())
              );
            },
          ),**/
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            tooltip: "Settings",
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> SettingsScreen()),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/robot.png', width: 24, height: 24),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/book.png', width: 24, height: 24),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Profile.png', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF7261C6),
        unselectedItemColor: Color(0xFFD9D9D9),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              _buildMotivationCard(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              _buildAssessmentCard(screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildCalendar(),
              SizedBox(height: screenHeight * 0.02),
              _buildAssistantCard(screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildUpgradeSection(screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildTasksSection(screenWidth,screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationCard(double screenWidth, double screenHeight) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage('assets/images/image1.png'),
          fit: BoxFit.cover,
        ),
      ),
      height: screenHeight * 0.2,
      padding: EdgeInsets.all(screenWidth * 0.04),
      alignment: Alignment.bottomLeft,
      child: Text(
        'Some days are harder than others but remember, it gets easier with time.',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  Widget _buildAssessmentCard(double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: _buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How are you feeling today?',
            style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 16),
          Text(
            'Take this quick, 10-question self-assessment to check your emotional well-being.',
            style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.black),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>QuestionWelcomePage()),
              );
            }, // TODO: Add navigation to assessment page
            style: _buttonStyle(),
            child: Text('Start Assessment', style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildAssistantCard(double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // Optional: Adds rounded corners to the card
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image with flexible space
          Image.asset(
            'assets/images/image2.png',
            width: screenWidth * 0.2, // Adjusted size for responsiveness
          ),
          SizedBox(width: screenWidth * 0.02),
          // Wrap content in Expanded to avoid overflow
          Expanded(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF7261C6),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
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
                  SizedBox(height: screenWidth * 0.02),
                  Text(
                    'I can answer any of your questions\nrelated to postpartum and\npregnancy.\nJust ask here.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>ChatbotScreen()),
                          );
                        }, // TODO: Add AI assistant logic
                        style: _buttonStyle(),
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpgradeSection(double screenWidth) {
    return Container(
      width: screenWidth * 0.9,
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Color(0xFFD3CBFD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Upgrade to Premium',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>SubscriptionPlan())
              );
            },
            style: _buttonStyle(),
            child: Text(
              'Upgrade',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTasksSection(double screenWidth, double screenHeight) {
    TextEditingController _taskController = TextEditingController(); // Controller for the task input

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Tasks",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: screenHeight * 0.01),
        GestureDetector(
          onTap: () {
            // Show dialog to input new task
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Add New Task'),
                content: TextField(
                  controller: _taskController,
                  decoration: InputDecoration(hintText: 'Enter your task'),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_taskController.text.isNotEmpty) {
                        setState(() {
                          _tasks.add(_taskController.text); // Add the new task to the list
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: Text('Add Task'),
                  ),
                ],
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            decoration: BoxDecoration(
              color: Color(0xFF7261C6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  'Add a new task ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Icon(Icons.add, color: Colors.white),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _tasks.length, // Dynamic task count
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                tileColor: Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Text(
                  _tasks[index], // Dynamic task title
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                trailing: CircleAvatar(backgroundColor: Color(0xFFDC6FD5)),
              ),
            );
          },
        ),
      ],
    );
  }


  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5, offset: Offset(0, 3))],
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(backgroundColor: Color(0xFF7261C6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
  }
}
