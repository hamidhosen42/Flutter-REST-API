### What is Server and Client?

- A server is a computer or system that provides resources, data, services, or programs to other computers, known as clients, over a network.

- Google
- Food Panda
- FaceBook
- WhatsApp

### what are APIs?

- API application programming interface
- Allow communication between client and server

### What are REST APIs?

- The representation state transfer (REST) architecture is perhaps the most populer approach to build APIs.
- REST relies on a client/server approach which separates front and back ends of the API

### USing HHTP Methods for RESTful Services

- GET
- POST
- UPDATE
- PUT
- DELETE

### How to create APIs? (Technologies used to build API's)

- Node.Js
- Laravel

## =========== JSON STRUCTURE =============

- JSON stands for JavaScript Object Notation
- JSON is a lightweight data-interchange format
- JSON is plain text written in JavaScript object notation
- JSON is used to send data between computers
- JSON is language independent \*

### JSON Values :

- a string
- a number
- an object
- an array
- a boolean
- null

### JSON STRUCTURE

```
"name":"Hamid Hosen",
"ID":"2323
```

### REST API packages

- http: ^0.13.5

### JSON DATA LOAD

```
// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/Models/post_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

      ///-------------- or -----------

      <!-- for (var i in data) {
        Photos photos = Photos(
            albumId: i['albumId'],
            id: i['id'],
            title:i['title'],
            url: i['url'],
            thumbnailUrl: i['thumbnailUrl']);
        photosList.add(photos);
      } -->

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
                    shrinkWrap: true, //! must be writen-----------
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
                              
                              Text("Titile:" + postList[index].title.toString(),
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
```
### JSON MOdel

```
// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({this.userId, this.id, this.title, this.body});

  PostsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
```

