import 'package:flutter/material.dart';
import 'package:testinggg/pages/home.dart';

import 'pages/get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'getstarted': (context) => const GetStarted(),
        'home': (context) => const Home(),
      },
      theme: ThemeData(
        fontFamily: 'Sf',
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const GetStarted(),
    );
  }
}
