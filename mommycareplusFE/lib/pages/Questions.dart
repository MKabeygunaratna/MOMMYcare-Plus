import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SampleHomePage.dart';

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
  Question(text: "I have felt scared or panicky for no good reason.", options: ["No, not at all", "No, not much", "Yes, sometimes", "Yes, quite a lot"], scores: [0, 1, 2, 3]),
  Question(text: "Things have been getting on top of me.", options: ["No, I have been coping", "No, most of the time I cope", "Yes, sometimes I haven’t coped", "Yes, I haven’t been coping at all"], scores: [0, 1, 2, 3]),
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
  int currentDay = 1;
  int currentQuestionIndex = 0;
  Map<int, int> selectedAnswers = {};
  bool testCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentDay = prefs.getInt('currentDay') ?? 1;
      testCompleted = prefs.getBool('testCompleted') ?? false;
      selectedAnswers = Map<int, int>.from(
        prefs.getStringList('selectedAnswers')?.asMap().map((key, value) => MapEntry(int.parse(value.split(':')[0]), int.parse(value.split(':')[1]))) ?? {},
      );

      // Start from first unanswered question
      currentQuestionIndex = selectedAnswers.length;
    });
  }

  Future<void> _saveProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentDay', currentDay);
    await prefs.setBool('testCompleted', testCompleted);
    await prefs.setStringList(
      'selectedAnswers',
      selectedAnswers.entries.map((e) => '${e.key}:${e.value}').toList(),
    );
  }

  int calculateFinalScore() {
    return selectedAnswers.entries.fold(0, (sum, entry) => sum + epdsQuestions[entry.key].scores[entry.value]);
  }

  void finishDay() async {
    await _saveProgress();
    if (currentDay == 1) {
      currentDay = 2;
      await _saveProgress();
      _showPopup("Day 1 Complete", "You have completed Day 1. Come back tomorrow to continue!");
    } else {
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
      _showPopup("EPDS Test Completed", "Final Score: $finalScore\n\n$message");
    }
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
                MaterialPageRoute(builder: (context) => const HomePage(guardianName: '', guardianEmail: '', guardianContact: '')),
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
    if (testCompleted) {
      return const Scaffold(body: Center(child: Text("Test Completed! Redirecting...")));
    }

    int startIndex = (currentDay - 1) * 5;
    int endIndex = startIndex + 5;
    bool isLastQuestionOfDay = currentQuestionIndex == endIndex - 1;

    double progress = (selectedAnswers.length)/epdsQuestions.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("EPDS Test - Day $currentDay",style: const TextStyle(color: Colors.black)),backgroundColor: Colors.white, ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/Question.jpg', height: 180),
            const SizedBox(height: 20),
            Text(
              "Question ${currentQuestionIndex + 1} / ${epdsQuestions.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2), // Outer border
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
                  const SizedBox(height: 20),
                  Column(
                    children: epdsQuestions[currentQuestionIndex].options.asMap().entries.map(
                          (entry) {
                        bool isSelected = selectedAnswers[currentQuestionIndex] == entry.key;
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
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
            const Spacer(),
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentQuestionIndex > startIndex)
                  ElevatedButton(onPressed: () => setState(() => currentQuestionIndex--), child: const Text("Previous")),
                ElevatedButton(
                  onPressed: selectedAnswers.containsKey(currentQuestionIndex)
                      ? () {
                    if (!isLastQuestionOfDay) {
                      setState(() => currentQuestionIndex++);
                    } else {
                      finishDay();
                    }
                  }
                      : null,
                  child: Text(isLastQuestionOfDay ? "Finish" : "Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}