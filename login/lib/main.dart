
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light,primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.system,
      home: AppHome(),
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
              onPressed: () {}, // Fix syntax error and provide a valid onPressed callback.
              child: const Text("SIGN IN"),
            ),
            OutlinedButton(
              onPressed: () {}, // Fix syntax error and provide a valid onPressed callback.
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
