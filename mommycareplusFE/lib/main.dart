import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/EmailVerification.dart';
import 'package:mommycareplusFE/pages/ForgotPasswordNew.dart';
import 'package:mommycareplusFE/pages/ProfileScreen.dart';
import 'package:mommycareplusFE/pages/Questions.dart';
import 'package:mommycareplusFE/pages/SubscriptionScreen1.dart';
// import 'package:login/pages/EmailVerification.dart';
import 'package:mommycareplusFE/pages/chatbot1.dart';
import 'package:provider/provider.dart';
import 'package:mommycareplusFE/pages/GuardianProvider.dart';


import 'pages/signup.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GuardianProvider(),
      child:MyApp() ,
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: EmailVerification(),
      home: EPDSQuizScreen()
    );
  }
}
////////////////
