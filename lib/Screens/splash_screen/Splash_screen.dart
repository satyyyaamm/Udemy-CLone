import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/Screens/home_screen/home_screen.dart';
import 'package:udemy_clone/Screens/splash_screen/landing_page.dart';
import 'package:udemy_clone/services/storage.dart';

String finalEmail;
String finalName;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    secureStorage.readSecureData('email').then((value) => finalEmail = value);
    secureStorage.readSecureData('name').then((value) => finalName = value);
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        PageTransition(
            child: finalEmail == null ? LandingPage() : HomeScreen(),
            type: PageTransitionType.rightToLeft),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                child: Image.asset('assets/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
