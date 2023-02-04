// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/Models/post_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen1> {
  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postList.clear();

      for (var i in data) {
        postList.add(PostsModel.fromJson(i));
      }

      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest APi"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    // shrinkWrap: true, //! must be writen-----------
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey[200],
                        shadowColor: Colors.deepOrange,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ID:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(postList[index].id.toString()),
                              Text("UserID:" +
                                  postList[index].userId.toString()),
                              Text(
                                "Title",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(postList[index].title.toString(),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Body",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Body:" + postList[index].body.toString(),
                                  textAlign: TextAlign.justify),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
