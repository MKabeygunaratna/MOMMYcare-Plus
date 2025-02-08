import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/EmailVerification.dart';
import 'package:mommycareplusFE/pages/ForgotPasswordNew.dart';
import 'package:mommycareplusFE/pages/GuardianScreen.dart';
import 'package:mommycareplusFE/pages/ProfileProvider.dart';
import 'package:mommycareplusFE/pages/ProfileScreen.dart';
import 'package:mommycareplusFE/pages/Questions.dart';
import 'package:mommycareplusFE/pages/SettingsScreen.dart';
import 'package:mommycareplusFE/pages/SubscriptionScreen1.dart';
import 'package:mommycareplusFE/pages/ThemeProvider.dart';
//import 'package:login/pages/EmailVerification.dart';
import 'package:mommycareplusFE/pages/chatbot1.dart';
import 'package:mommycareplusFE/pages/chatbot2.dart';
import 'package:provider/provider.dart';
import 'package:mommycareplusFE/pages/GuardianProvider.dart';


import 'pages/signup.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GuardianProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: GuardianDetailsScreen(),
        );
      },
    );
  }
}

