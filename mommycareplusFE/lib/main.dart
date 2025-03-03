import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/EmailVerification.dart';
import 'package:mommycareplusFE/pages/TodoListScreen.dart';
import 'package:mommycareplusFE/pages/signup.dart';
import 'package:mommycareplusFE/screen/notification_permission_dialog.dart';

// import 'package:login/pages/EmailVerification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NotificationPermissionDialog(),
    );
  }
}
////////////////
