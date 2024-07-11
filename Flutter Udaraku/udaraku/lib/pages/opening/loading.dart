import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udaraku/pages/main_page.dart'; // Import main_page.dart

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: false);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation =
        Tween<double>(begin: 0.0, end: 2.0 * 3.141592653589793).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    Timer(Duration(seconds: 3), () {
      _controller.stop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Icon(
                    FontAwesomeIcons.wind, // Changed icon to "wind"
                    color: Color(0xFF49D3FF),
                    size: 50.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
