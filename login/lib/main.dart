import 'package:flutter/material.dart';
import 'forget_password_1.dart';
import 'forget_password_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MOMMYcare +"),
        leading: const Icon(Icons.ondemand_video),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart),
        onPressed: () {}, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text("Heading"),
            const Text("Sub-heading"),
            const Text("Paragraph"),
            ElevatedButton(
              onPressed: () {},
              child: const Text("SIGN IN"),
            ),
            OutlinedButton(
              onPressed: () {}, // Provide a valid onPressed callback.
              child: const Text("SIGN UP"),
            ),


            InkWell(
              onTap: () {
                // Navigate to Forget Password 1 page
                Navigator.pushNamed(context, '/forget_password_1');
              },
              child: const Text("password forget",style: TextStyle(
                color: Colors.purple,
                decoration: TextDecoration.underline, // Optional: Makes it look like a link
              ),),
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
