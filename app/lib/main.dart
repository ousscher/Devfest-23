import 'package:app/pages/Home.dart';
import 'package:app/pages/Login.dart';
import 'package:app/pages/Profile.dart';
import 'package:app/pages/SplachScreen.dart';
import 'package:app/pages/VirtualVisit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'itim',
        // in order to have a coherent typo add the text style here to reuse it then
        textTheme: const TextTheme(
          // exapmple
          headlineMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: "profil",
      routes: {
        "SplashScreen": (context) => const SplashScreen(),
        "login": (context) => const Login(),
        "profil": (context) => const Profile(),
        "home": (context) => Home(),
        "virtualVisit": (context) => VirtualVisit(),
      },
    );
  }
}
