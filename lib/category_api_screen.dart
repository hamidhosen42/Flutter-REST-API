// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/Get_API/home_screen1.dart';

import 'Get_API/home_screen2.dart';
import 'Get_API/home_screen3.dart';
import 'Get_API/home_screen4.dart';
import 'Get_API/home_screen5.dart';
import 'POST_API/login.dart';
import 'POST_API/sign_up.dart';
import 'POST_API/upload_image.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen1()),
                  );
                },
                child: Text("Get Api Screen1")),
                SizedBox(
                  height: 10,
                ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen2()),
                  );
                },
                child: Text("Get Api Screen2")),
                SizedBox(
                  height: 10,
                ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen3()),
                  );
                },
                child: Text("Get Api Screen3")),
                SizedBox(
                  height: 10,
                ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen4()),
                  );
                },
                child: Text("Get Api Screen4")),
                SizedBox(
                  height: 10,
                ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen5()),
                  );
                },
                child: Text("Get Api Screen5")),
                SizedBox(
                  height: 10,
                ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text("POST Api SignUpScreen")),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text("POST Api SignInScreen")),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadImageScreen()),
                  );
                },
                child: Text("Upload Image Screen")),
                SizedBox(
                  height: 10,
                ),
          ],
        ),
      ),
    );
  }
}