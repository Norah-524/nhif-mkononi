import 'package:flutter/material.dart';
import 'package:nhif_app/screens/home.dart';
import 'dart:ui';
import 'dart:async';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  _MySplashState() {
    Timer(const Duration(milliseconds: 3000), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Onboard()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0, bottom: 200),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Text(
                  'NHIF Mkononi',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'assets/splash.png',
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
