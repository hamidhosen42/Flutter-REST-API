// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unnecessary_new, prefer_collection_literals, unnecessary_this

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPostApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      photosList.clear();

      for (Map<String, dynamic> i in data) {
        Photos photos = Photos(
            albumId: i['albumId'],
            id: i['id'],
            title: i['title'],
            url: i['url'],
            thumbnailUrl: i['thumbnailUrl']);

        photosList.add(photos);
      }

      return photosList;
    } else {
      return photosList;
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
              builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) { 
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            snapshot.data![index].thumbnailUrl.toString(),
                          ), 
                        ),
                        title: Text(snapshot.data![index].title.toString()),
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

class Photos {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
}