import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_donation/screens/loginscreen.dart';
import 'package:project_donation/screens/roleScreen.dart';

late Size mq;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const RoleScreen()));
    });
  }
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Positioned(
            top: mq.height * 0.15,
            right: mq.width * 0.25,
            width: mq.width * .5,
            child: Image.asset('assets/blood.jpeg'),
          ),
          Positioned(
            bottom: mq.height * 0.15,
            right: mq.width * 0.25,
            width: mq.width * .5,
            child: const Text(
              "Zindagi",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
