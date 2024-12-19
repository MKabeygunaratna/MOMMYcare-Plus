import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const AppHome(),
        '/forget_password_1': (context) => const ForgetPassword1(),
        '/forget_password_2': (context) => const ForgetPassword2(),
      },
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MOMMYcare +"),
        leading: const Icon(Icons.ondemand_video),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart),
        onPressed: () {}, // Add this to handle button press.
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text("Heading"),
            const Text("Sub-heading"),
            const Text("Paragraph"),
            ElevatedButton(
              onPressed: () {
                // Navigate to Forget Password 1 page
                Navigator.pushNamed(context, '/forget_password_1');
              },
              child: const Text("SIGN IN"),
            ),
            OutlinedButton(
              onPressed: () {}, // Provide a valid onPressed callback.
              child: const Text("SIGN UP"),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(
                image: AssetImage("assets/images/Screenshot 2024-11-12 at 13.43.30.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgetPassword1 extends StatelessWidget {
  const ForgetPassword1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        leading: const Icon(Icons.lock_outline),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Reset Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.help_outline, size: 40, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Please enter your email or phone number to receive a verification code",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: Colors.deepPurple[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forget_password_2');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("FORGOT PASSWORD"),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgetPassword2 extends StatelessWidget {
  const ForgetPassword2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        leading: const Icon(Icons.lock_reset),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Reset Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.help_outline, size: 40, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Please enter your email or phone number to receive a verification code",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Contact Number",
                filled: true,
                fillColor: Colors.deepPurple[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("SEND"),
            ),
          ],
        ),
      ),
    );
  }
}
