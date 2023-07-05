import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nhif_app/screens/demog.dart';
import 'package:nhif_app/screens/home.dart';
import 'package:nhif_app/screens/loginpage.dart';
import 'package:nhif_app/screens/mstatus.dart';
import 'package:nhif_app/screens/personalprofile.dart';
import 'package:nhif_app/screens/profile.dart';
import 'package:nhif_app/screens/splashscreen.dart';
import 'package:nhif_app/screens/services.dart';
import 'package:nhif_app/screens/visits.dart';
import 'package:nhif_app/screens/visitlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const color = const Color.fromARGB(255, 43, 12, 100);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.indigo,
          primaryColor: Colors.deepPurple[100],
          scaffoldBackgroundColor: Colors.indigo[50]),
      initialRoute: '/',
      routes: {
        //'/': (context) => MyExpandedPanel(),
        '/': (context) => Onboard(),
        '/home': (context) => Profile(),
        '/profile': (context) => PersonalProfile(),
        '/service': (context) => Services(),
        '/visit': (context) => MyHomePage(),
        '/demo': (context) => PInfo(),
        '/mstat': (context) => MStatus(),
      },
    );
  }
}
