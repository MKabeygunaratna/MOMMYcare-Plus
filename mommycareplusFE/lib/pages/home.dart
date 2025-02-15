import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
    setState(() {
      _currentIndex = index;
    });
    // TODO: Implement navigation to respective screens
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
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home/home.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home/robot.png', width: 24, height: 24),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home/book.png', width: 24, height: 24),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home/Profile.png', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF7261C6),
        unselectedItemColor: Color(0xFFD9D9D9),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello User',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 16),
              _buildMotivationCard(),
              SizedBox(height: 16),
              _buildAssessmentCard(),
              SizedBox(height: 16),
              _buildCalendar(),
              SizedBox(height: 16),
              _buildAssistantCard(),
              SizedBox(height: 16),
              _buildTasksSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage('assets/images/home/image1.png'),
          fit: BoxFit.cover,
        ),
      ),
      height: 150,
      padding: EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      child: Text(
        'Some days are harder than others but remember, it gets easier with time.',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  Widget _buildAssessmentCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: _buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How are you feeling today?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 16),
          Text(
            'Take this quick, 10-question self-assessment to check your emotional well-being.',
            style: TextStyle(fontSize: 11, color: Colors.black),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {}, // TODO: Add navigation to assessment page
            style: _buttonStyle(),
            child: Text('Start Assessment', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildAssistantCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/home/image2.png',
            width: 85, // Increased size
          ),
          SizedBox(width: 5),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF7261C6),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
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
                SizedBox(height: 6), // Added space
                Text(
                  'I can answer any of your questions\n'
                      'related to postpartum and\n pregnancy.'
                      'Just ask here.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    SizedBox(width: 80),
                    ElevatedButton(
                      onPressed: () {}, // TODO: Add AI assistant logic
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
        ],
      ),
    );
  }


  Widget _buildTasksSection() {
    TextEditingController _taskController = TextEditingController(); // Controller for the task input

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Tasks",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 8),
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
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
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
