// ignore_for_file: prefer_const_constructors
// https://www.youtube.com/playlist?list=PLFyjjoCMAPtzgITDreXNNkSWLKbd1wf51
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/Get_API/home_screen1.dart';
import 'package:flutter_rest_api/Get_API/home_screen2.dart';
import 'package:flutter_rest_api/Get_API/home_screen3.dart';
import 'package:flutter_rest_api/Get_API/home_screen4.dart';
import 'package:flutter_rest_api/Get_API/home_screen5.dart';
import 'package:flutter_rest_api/POST_API/login.dart';
import 'package:flutter_rest_api/POST_API/sign_up.dart';
import 'package:flutter_rest_api/POST_API/upload_image.dart';

import 'category_api_screen.dart';

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
      home: CategoryScreen(),
    );
  }
}
