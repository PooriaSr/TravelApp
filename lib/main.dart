import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "",
          textTheme: const TextTheme(
              headline1: TextStyle(color: Colors.black),
              headline2: TextStyle(color: Colors.amber))),
      home: Scaffold(
          body: Center(
              child: Text(
        "Travel App",
        style: Theme.of(context).textTheme.headline2,
      ))),
    );
  }
}
