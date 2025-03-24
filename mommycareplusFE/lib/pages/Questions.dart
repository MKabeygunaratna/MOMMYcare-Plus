import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:mommycareplusFE/pages/GuardianProvider.dart';
import 'package:mommycareplusFE/pages/DoctorProvider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Question {
  final String text;
  final List<String> options;
  final List<int> scores;

  Question({required this.text, required this.options, required this.scores});
}

List<Question> epdsQuestions = [
  Question(text: "I have been able to laugh and see the funny side of things.", options: ["As much as I always could", "Not quite so much now", "Definitely not so much now", "Not at all"], scores: [0, 1, 2, 3]),
  Question(text: "I have looked forward with enjoyment to things.", options: ["As much as I ever did", "Rather less than I used to", "Definitely less than I used to", "Hardly at all"], scores: [0, 1, 2, 3]),
  Question(text: "I have blamed myself unnecessarily when things went wrong.", options: ["No, never", "Not very often", "Yes, sometimes", "Yes, very often"], scores: [0, 1, 2, 3]),
  Question(text: "I have been anxious or worried for no good reason.", options: ["No, not at all", "Hardly ever", "Yes, sometimes", "Yes, very often"], scores: [0, 1, 2, 3]),
  Question(text: "I have felt scared or panicky for no good reason.", options: ["No, not at- all", "No, not much", "Yes, sometimes", "Yes, quite a lot"], scores: [0, 1, 2, 3]),
  Question(text: "Things have been getting on top of me.", options: ["No, I have been coping", "No, most of the time I cope", "Yes, sometimes I haven't coped", "Yes, I haven't been coping at all"], scores: [0, 1, 2, 3]),
  Question(text: "I have been so unhappy that I have had difficulty sleeping.", options: ["No, not at all", "Not very often", "Yes, sometimes", "Yes, most of the time"], scores: [0, 1, 2, 3]),
  Question(text: "I have felt sad or miserable.", options: ["No, not at all", "Not very often", "Yes, sometimes", "Yes, most of the time"], scores: [0, 1, 2, 3]),
  Question(text: "I have been so unhappy that I have been crying.", options: ["No, not at all", "Only occasionally", "Yes, quite often", "Yes, most of the time"], scores: [0, 1, 2, 3]),
  Question(text: "The thought of harming myself has occurred to me.", options: ["Never", "Hardly ever", "Sometimes", "Yes, quite often"], scores: [0, 1, 2, 3]),
];

class EPDSQuizScreen extends StatefulWidget {
  @override
  _EPDSQuizScreenState createState() => _EPDSQuizScreenState();
}

class _EPDSQuizScreenState extends State<EPDSQuizScreen> {
  int currentQuestionIndex = 0; // Keeps track of the current question.
  Map<int, int> selectedAnswers = {}; // Stores selected answers
  bool testCompleted = false; // Tracks if the quiz is completed.
  bool _isSending = false; // Tracks if results are being sent

  // Variables to store guardian and doctor emails
  String? guardianEmail;
  String? doctorEmail;

  @override
  void initState() {
    super.initState();
    _loadProgress(); // Loads saved progress.
    _loadContactEmails(); // Load guardian and doctor emails
    _showIntroPopup(); // Shows an introductory popup.
  }

  // Load guardian and doctor emails from providers
  void _loadContactEmails() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final guardianProvider = Provider.of<GuardianProvider>(context, listen: false);
      final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);

      setState(() {
        guardianEmail = guardianProvider.email;
        doctorEmail = doctorProvider.email;
      });
    });
  }

  Future<void> _loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      testCompleted = prefs.getBool('testCompleted') ?? false;
      selectedAnswers = Map<int, int>.from(
        prefs.getStringList('selectedAnswers')?.asMap().map((key, value) => MapEntry(int.parse(value.split(':')[0]), int.parse(value.split(':')[1]))) ?? {},
      );

      // Start from first unanswered question
      currentQuestionIndex = selectedAnswers.length;
    });
  }

  // Function to show introductory popup
  Future<void> _showIntroPopup() async {
    await Future.delayed(Duration(milliseconds: 500));  // Delay to show the popup slightly after screen loads
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Important Information"),
        content: const Text(
          "Please answer the following questions honestly. Your responses are crucial in assessing your well-being, and this information will help provide the necessary support if needed. This is an important step, so take your time while answering.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the popup
            },
            child: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }

  Future<void> _saveProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('testCompleted', testCompleted);
    await prefs.setStringList(
      'selectedAnswers',
      selectedAnswers.entries.map((e) => '${e.key}:${e.value}').toList(),
    );
  }

  int calculateFinalScore() {
    return selectedAnswers.entries.fold(0, (sum, entry) => sum + epdsQuestions[entry.key].scores[entry.value]);
  }

  // Save test results and contact emails for backend access
  Future<void> _saveTestResults(int score, String message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save the test results
    await prefs.setInt('epdsScore', score);
    await prefs.setString('epdsResult', message);

    // Save contact emails for backend access
    if (guardianEmail != null && guardianEmail!.isNotEmpty) {
      await prefs.setString('guardianEmail', guardianEmail!);
    }

    if (doctorEmail != null && doctorEmail!.isNotEmpty) {
      await prefs.setString('doctorEmail', doctorEmail!);
    }
  }

  // Function to send quiz results to backend
  Future<void> sendQuizResultsToBackend() async {
    setState(() {
      _isSending = true;
    });

    // Get user ID from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? '';

    if (userId.isEmpty) {
      print('Warning: userId is empty. Using temporary ID.');
      userId = 'temp_user_${DateTime.now().millisecondsSinceEpoch}';
    }

    // Convert selectedAnswers to the format expected by the backend
    List<int> answersArray = [];
    for (int i = 0; i < epdsQuestions.length; i++) {
      if (selectedAnswers.containsKey(i)) {
        // Get the score for the selected option
        int score = epdsQuestions[i].scores[selectedAnswers[i]!];
        answersArray.add(score);
      }
    }

    // Create the request payload - exactly what your backend expects
    final Map<String, dynamic> payload = {
      'userId': userId,
      'answers': answersArray,
      'guardianEmail': guardianEmail ?? '',
      'doctorEmail': doctorEmail ?? ''
    };

    try {
      // Send to your backend endpoint
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/quiz/submit'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      setState(() {
        _isSending = false;
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Quiz results sent successfully');
        print('Backend response: ${response.body}');
      } else {
        print('Failed to send quiz results: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      setState(() {
        _isSending = false;
      });
      print('Error sending quiz results: $e');
    }
  }

  void finishQuiz() async {
    await _saveProgress();
    int finalScore = calculateFinalScore();
    String message = finalScore < 10
        ? "Low likelihood of depression."
        : finalScore < 13
        ? "Mild depression."
        : finalScore < 16
        ? "Moderate depression."
        : "Severe depression.";

    testCompleted = true;
    await _saveProgress();

    // Save results and contact emails for backend access
    await _saveTestResults(finalScore, message);

    // Send results to backend
    await sendQuizResultsToBackend();

    _showPopup("EPDS Test Completed", "Final Score: $finalScore\n\n$message");
  }

  void _showPopup(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    if (_isSending) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text("Sending quiz results to server..."),
            ],
          ),
        ),
      );
    }

    // if (testCompleted) {
    //   return const Scaffold(body: Center(child: Text("Test Completed! Redirecting...")));
    // }

    double progress = (selectedAnswers.length) / epdsQuestions.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("EPDS Test", style: TextStyle(color: Colors.black,fontFamily: 'Poppins')),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/Question.jpg', height: 200),
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Question ${currentQuestionIndex + 1} / ${epdsQuestions.length}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      epdsQuestions[currentQuestionIndex].text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Column(
                      children: epdsQuestions[currentQuestionIndex].options.asMap().entries.map(
                            (entry) {
                          bool isSelected = selectedAnswers[currentQuestionIndex] == entry.key;
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFFDEC8FF) : Colors.white,
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: RadioListTile<int>(
                              title: Text(entry.value),
                              value: entry.key,
                              groupValue: selectedAnswers[currentQuestionIndex],
                              onChanged: (int? value) {
                                setState(() {
                                  selectedAnswers[currentQuestionIndex] = value!;
                                });
                              },
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Progress: ${(progress * 100).toInt()}%",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: progress),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.grey[300],
                    color: const Color(0xFF6F42C1),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(10),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentQuestionIndex > 0)
                    ElevatedButton(onPressed: () => setState(() => currentQuestionIndex--),
                        child: const Text("Previous")),
                  ElevatedButton(
                    onPressed: selectedAnswers.containsKey(currentQuestionIndex)
                        ? () {
                      if (currentQuestionIndex == epdsQuestions.length - 1) {
                        finishQuiz();
                      } else {
                        setState(() => currentQuestionIndex++);
                      }
                    }
                        : null,
                    child: Text(currentQuestionIndex == epdsQuestions.length - 1 ? "Finish" : "Next"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}