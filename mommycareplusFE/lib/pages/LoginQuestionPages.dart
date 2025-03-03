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
//------------------------------------------------------
// PAGE THREE: "What is your postpartum period?"
//------------------------------------------------------
class PageThree extends StatefulWidget {
  final String name;
  final String age;

  const PageThree({Key? key, required this.name, required this.age})
      : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final TextEditingController _postpartumController = TextEditingController();

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
                  "What is your postpartum period?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF7F3DFF),
                  ),
                ),
                const SizedBox(height: 40),
                // Illustration
                Image.asset(
                  "assets/image 15.png", // <-- Replace with your actual asset
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),
                // Postpartum input field
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
                    controller: _postpartumController,
                    decoration: const InputDecoration(
                      hintText: "Postpartum period",
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
                    // Navigate to the final NextPage, passing name, age, postpartum
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage(
                          name: widget.name,
                          age: widget.age,
                          postpartum: _postpartumController.text,
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

//------------------------------------------------------
// NEXT PAGE: Displays the gathered information
//------------------------------------------------------
class NextPage extends StatelessWidget {
  final String name;
  final String age;
  final String postpartum;

  const NextPage({
    Key? key,
    required this.name,
    required this.age,
    required this.postpartum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Page"),
        backgroundColor: const Color(0xFF7F3DFF),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Hello, $name!\nYour age is: $age\nYour postpartum period: $postpartum",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}