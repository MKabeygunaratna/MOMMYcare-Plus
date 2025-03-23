import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'home.dart';
import 'chatbot1.dart';
import 'library.dart';
import 'ProfileScreen.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  int _currentIndex = 0;
  final _taskFormKey = GlobalKey<FormState>();
  final _vaccinationFormKey = GlobalKey<FormState>();
  TextEditingController _taskController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _taskdateController = TextEditingController();
  TextEditingController _tasktimeController = TextEditingController();
  TextEditingController _vaccinationController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _batchNumberController = TextEditingController();
  TextEditingController _adverseEffectsController = TextEditingController();
  Map<DateTime, List<Map<String, dynamic>>> _tasks = {};
  Map<DateTime, List<Map<String, dynamic>>> _vaccinationRecords = {};
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  void initState() {
    super.initState();
    _initializeDefaultTasks();
    _initializeDefaultVaccinationRecords();
  }

  void _initializeDefaultTasks() {
    setState(() {
      _tasks[_selectedDay] = [
        {
          'task': 'Morning Exercise',
          'task description': 'Doing my daily morning schedule.',
          'task date': '2025/02/13',
          'task time': '9:00 AM',
          'done': false
        },
        {
          'task': 'Check Emails',
          'task description': 'Checking the emails related to my small business.',
          'task date': '2025/02/13',
          'task time': '11:00 AM',
          'done': false
        },
        {
          'task': 'Work on Project',
          'task description': 'Adding much needed facts to the project.',
          'task date': '2025/02/13',
          'task time': '1:00 PM',
          'done': false
        },
      ];
    });
  }

  void _initializeDefaultVaccinationRecords() {
    setState(() {
      _vaccinationRecords[_selectedDay] = [
        {'vaccine': 'BCG', 'date': '01/01/2025', 'batchNumber': '56324', 'adverseEffects': 'Anxiety', 'done': false},
        {'vaccine': 'Hepatitis B', 'date': '01/02/2025', 'batchNumber': '56598', 'adverseEffects': 'Vomiting', 'done': false},
      ];
    });
  }

  // Date format validation
  bool isValidDateFormat(String date) {
    try {
      // Check for yyyy/MM/dd format
      if (date.contains('/')) {
        final parts = date.split('/');
        if (parts.length == 3) {
          if (parts[0].length == 4) { // yyyy/MM/dd format
            DateTime.parse('${parts[0]}-${parts[1]}-${parts[2]}');
            return true;
          } else if (parts[2].length == 4) { // MM/dd/yyyy format
            DateTime.parse('${parts[2]}-${parts[0]}-${parts[1]}');
            return true;
          }
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // Time format validation
  bool isValidTimeFormat(String time) {
    // Check for 12-hour format with AM/PM
    RegExp timeRegex = RegExp(r'^(0?[1-9]|1[0-2]):[0-5][0-9]\s?(AM|PM|am|pm)$');
    return timeRegex.hasMatch(time);
  }

  // Batch number validation
  bool isValidBatchNumber(String batchNumber) {
    // Check if batch number is alphanumeric and at least 5 characters
    return batchNumber.length >= 5 && RegExp(r'^[a-zA-Z0-9]+$').hasMatch(batchNumber);
  }
  bool isValidAdverseEffects(String effects){
    return !RegExp(r'\d').hasMatch(effects);
  }

  void _onTabTapped(int index) {
    if(index==_currentIndex)
      return;

    switch(index){
      case 0:
        Navigator.push(
            context,MaterialPageRoute(builder: (context)=>HomePage()));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>ChatbotScreen())
        );
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>LibraryScreen())
        );
        break; // Added missing break
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Profilescreen())
        );
        break;
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>TodoListScreen())
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Planner', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Planner'
          )
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF7261C6),
        unselectedItemColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            _buildCalendar(),
            SizedBox(height: screenHeight * 0.02),
            _buildTodayTasksHeader(),
            Expanded(child: _buildTaskList()),
            SizedBox(height: screenHeight * 0.03),
            _buildVaccinationRecordsHeader(),
            Expanded(child: _buildVaccinationRecordList()),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _selectedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
          });
        },
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: Color(0xFF7261C6),
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.purple.shade100,
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
      ),
    );
  }

  Widget _buildTodayTasksHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today's Tasks",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: _showTaskPopup,
          child: Text(
            "Add",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7261C6),
          ),
        ),
      ],
    );
  }

  void _showTaskPopup() {
    // Reset form controllers
    _taskController.clear();
    _descriptionController.clear();
    _taskdateController.clear();
    _tasktimeController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Task for ${DateFormat('yyyy/MM/dd').format(_selectedDay)}'),
        content: Form(
          key: _taskFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    labelText: 'Task',
                    hintText: 'Enter your task',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter your task description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _taskdateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'YYYY/MM/DD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date';
                    }
                    if (!isValidDateFormat(value)) {
                      return 'Invalid date format. Use YYYY/MM/DD';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _tasktimeController,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    hintText: 'HH:MM AM/PM',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.access_time),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a time';
                    }
                    if (!isValidTimeFormat(value)) {
                      return 'Invalid time format. Use HH:MM AM/PM';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_taskFormKey.currentState!.validate()) {
                setState(() {
                  _tasks[_selectedDay] ??= [];
                  _tasks[_selectedDay]!.add({
                    'task': _taskController.text,
                    'task description': _descriptionController.text,
                    'task date': _taskdateController.text,
                    'task time': _tasktimeController.text,
                    'done': false,
                  });
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Task added successfully')),
                );
              }
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    List<Map<String, dynamic>> selectedTasks = _tasks[_selectedDay] ?? [];

    return selectedTasks.isEmpty
        ? Center(child: Text('No tasks for today'))
        : ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: selectedTasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                selectedTasks[index]['task'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: selectedTasks[index]['done'] ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "Description: ${selectedTasks[index]['task description']}\n"
                      "Date: ${selectedTasks[index]['task date']}\n"
                      "Time: ${selectedTasks[index]['task time']}",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              leading: Checkbox(
                value: selectedTasks[index]['done'],
                onChanged: (bool? value) {
                  setState(() {
                    selectedTasks[index]['done'] = value!;
                  });
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _showDeleteConfirmation(context, 'task', index);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVaccinationRecordsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Vaccination Records",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: _showVaccinationPopup,
          child: Text(
            "Add",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7261C6),
          ),
        ),
      ],
    );
  }

  void _showVaccinationPopup() {
    // Reset form controllers
    _vaccinationController.clear();
    _dateController.clear();
    _batchNumberController.clear();
    _adverseEffectsController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Vaccination Record for ${DateFormat('yyyy/MM/dd').format(_selectedDay)}'),
        content: Form(
          key: _vaccinationFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _vaccinationController,
                  decoration: InputDecoration(
                    labelText: 'Vaccine Name',
                    hintText: 'Enter vaccine name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vaccine name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Vaccination Date',
                    hintText: 'MM/DD/YYYY',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vaccination date';
                    }
                    if (!isValidDateFormat(value)) {
                      return 'Invalid date format. Use MM/DD/YYYY';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _batchNumberController,
                  decoration: InputDecoration(
                    labelText: 'Batch Number',
                    hintText: 'Enter batch number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter batch number';
                    }
                    if (!isValidBatchNumber(value)) {
                      return 'Invalid batch number. Must be at least 5 alphanumeric characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _adverseEffectsController,
                  decoration: InputDecoration(
                    labelText: 'Adverse Effects',
                    hintText: 'Enter adverse effects (if any)',
                    border: OutlineInputBorder(),
                    helperText: 'Use only letters, no numbers allowed',
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!isValidAdverseEffects(value)) {
                        return 'Numbers are not allowed in adverse effects';
                      }
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_vaccinationFormKey.currentState!.validate()) {
                setState(() {
                  _vaccinationRecords[_selectedDay] ??= [];
                  _vaccinationRecords[_selectedDay]!.add({
                    'vaccine': _vaccinationController.text,
                    'date': _dateController.text,
                    'batchNumber': _batchNumberController.text,
                    'adverseEffects': _adverseEffectsController.text.isEmpty
                        ? 'None reported'
                        : _adverseEffectsController.text,
                    'done': false,
                  });
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Vaccination record added successfully')),
                );
              }
            },
            child: Text('Add Record'),
          ),
        ],
      ),
    );
  }

  Widget _buildVaccinationRecordList() {
    List<Map<String, dynamic>> selectedVaccinations = _vaccinationRecords[_selectedDay] ?? [];

    return selectedVaccinations.isEmpty
        ? Center(child: Text('No vaccination records for today'))
        : ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: selectedVaccinations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                selectedVaccinations[index]['vaccine'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: selectedVaccinations[index]['done'] ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "Date: ${selectedVaccinations[index]['date']}\n"
                      "Batch No: ${selectedVaccinations[index]['batchNumber']}\n"
                      "Effects: ${selectedVaccinations[index]['adverseEffects']}",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              leading: Checkbox(
                value: selectedVaccinations[index]['done'],
                onChanged: (bool? value) {
                  setState(() {
                    selectedVaccinations[index]['done'] = value!;
                  });
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _showDeleteConfirmation(context, 'vaccination', index);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  // Add delete confirmation dialog
  void _showDeleteConfirmation(BuildContext context, String type, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this ${type}?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete', style: TextStyle(color: Colors.red)),
              onPressed: () {
                setState(() {
                  if (type == 'task') {
                    _tasks[_selectedDay]!.removeAt(index);
                    if (_tasks[_selectedDay]!.isEmpty) {
                      _tasks.remove(_selectedDay);
                    }
                  } else if (type == 'vaccination') {
                    _vaccinationRecords[_selectedDay]!.removeAt(index);
                    if (_vaccinationRecords[_selectedDay]!.isEmpty) {
                      _vaccinationRecords.remove(_selectedDay);
                    }
                  }
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${type.capitalize()} deleted successfully')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

// Extension to capitalize first letter
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}