import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/DoctorProvider.dart';
import 'package:mommycareplusFE/pages/Profile_Provider.dart';
import 'package:mommycareplusFE/pages/Splash_screen.dart';
import 'package:mommycareplusFE/pages/ThemeProvider.dart';
import 'package:mommycareplusFE/pages/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:mommycareplusFE/pages/GuardianProvider.dart';


void main() {
  runApp(
    MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context) => GuardianProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => DoctorProvider()),
        ChangeNotifierProvider(create: (context)=> ProfileProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider())

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


          home:SplashScreen(),


        );
      },
    );
  }
}