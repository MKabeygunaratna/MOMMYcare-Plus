import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/AboutScreen.dart';
import 'package:mommycareplusFE/pages/DoctorProvider.dart';
import 'package:mommycareplusFE/pages/DoctorScreen.dart';
import 'package:mommycareplusFE/pages/EditProfileScreen.dart';
import 'package:mommycareplusFE/pages/PrivacyScreen.dart';
import 'package:mommycareplusFE/pages/Profile_Provider.dart';
import 'package:mommycareplusFE/pages/Question_welcome_page.dart';
import 'package:mommycareplusFE/pages/TermsOfUseScreen.dart';
import 'package:mommycareplusFE/pages/EmailVerification.dart';

// import 'package:mommycareplusFE/pages/TodoListScreen.dart';

// import 'package:login/pages/EmailVerification.dart';

// import 'package:mommycareplusFE/pages/ForgotPasswordNew.dart';
import 'package:mommycareplusFE/pages/GuardianScreen.dart';
// import 'package:mommycareplusFE/pages/HelpScreen.dart';
// import 'package:mommycareplusFE/pages/ProfileScreen.dart';
// import 'package:mommycareplusFE/pages/Questions.dart';
// import 'package:mommycareplusFE/pages/SettingsScreen.dart';
// import 'package:mommycareplusFE/pages/SubscriptionScreen.dart';
import 'package:mommycareplusFE/pages/ThemeProvider.dart';
import 'package:mommycareplusFE/pages/chatbot1.dart';
import 'package:mommycareplusFE/pages/home.dart';
//import 'package:login/pages/EmailVerification.dart';
// import 'package:mommycareplusFE/pages/chatbot1.dart';
// import 'package:mommycareplusFE/pages/chatbot2.dart';
import  'package:provider/provider.dart';
import 'package:mommycareplusFE/pages/GuardianProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GuardianProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => DoctorProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider())
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
          home:  ChatbotScreen(),
        );
      },
    );
  }
}
