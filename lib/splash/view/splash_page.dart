import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: Image.asset(
            'assets/images/logo.jpg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
