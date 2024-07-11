import 'package:flutter/material.dart';
import 'dart:async';
import 'tutorial.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _splashDuration = 3;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: _splashDuration), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => TutorialPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/flutter_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/splash.png',
                width: 150,
                height: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
