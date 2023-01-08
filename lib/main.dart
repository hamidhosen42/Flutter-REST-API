// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/Home/home_screen1.dart';
import 'package:flutter_rest_api/Home/home_screen2.dart';
import 'package:flutter_rest_api/Home/home_screen3.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      // home: HomeScreen1(),
      // home: HomeScreen2(),
      home: HomeScreen3(),
    );
  }
}