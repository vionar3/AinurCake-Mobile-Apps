import 'dart:async';

import 'package:ainurcake/screen/checkloginregister.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Check())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SizedBox(
                height: 300,
                width: 250,
                child: Image.asset('images/cclogo.png')),
          )
        ],
      ),
    );
  }
}
