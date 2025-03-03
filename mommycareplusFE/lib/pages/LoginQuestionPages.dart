import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Question Pages',
      theme: ThemeData(
        // Use a purple swatch or define a custom color
        primarySwatch: Colors.purple,
      ),
      // Start the app on PageOne
      home: const PageOne(),
    );
  }
}

//------------------------------------------------------
// PAGE ONE: "What do you want me to call you?"
//------------------------------------------------------
class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White page background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Main Illustration
                Image.asset(
                  "assets/image 8.png", // <-- Replace with your actual asset
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                // Question text
                const Text(
                  "What do you want me to call you?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF7F3DFF), // Purple color for text
                  ),
                ),
                const SizedBox(height: 40),
                // Name input field
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // NEXT Button (purple)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7F3DFF), // Purple button
                    foregroundColor: Colors.white, // White text
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to PageTwo, passing the name
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PageTwo(name: _nameController.text),
                      ),
                    );
                  },
                  child: const Text(
                    "NEXT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//------------------------------------------------------
// PAGE TWO: "What is your age?"
//------------------------------------------------------
class PageTwo extends StatefulWidget {
  final String name; // We pass the name forward

  const PageTwo({Key? key, required this.name}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Question text
                const Text(
                  "What is your age?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF7F3DFF),
                  ),
                ),
                const SizedBox(height: 40),
                // Illustration
                Image.asset(
                  "assets/image 11.png", // <-- Replace with your actual asset
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),
                // Age input field
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Age",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // NEXT Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7F3DFF),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to PageThree, passing name & age
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageThree(
                          name: widget.name,
                          age: _ageController.text,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "NEXT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}