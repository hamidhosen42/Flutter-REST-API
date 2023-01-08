// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/Models/products_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen5 extends StatefulWidget {
  const HomeScreen5({super.key});

  @override
  State<HomeScreen5> createState() => _HomeScreen5State();
}

class _HomeScreen5State extends State<HomeScreen5> {
  Future<ProductsModel> getProductsApi() async {
    final response = await http.get(Uri.parse(
        "https://api.github.com/repos/tidyverse/ggplot2/git/trees/8b7cc0748882d10c9335a725520e0f72c4538cba"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
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
            child: FutureBuilder<ProductsModel>(
              future: getProductsApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    // itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                              title: Text(snapshot.data!.sha.toString()),
                              subtitle: Text(
                                  snapshot.data!.tree![index].path.toString())),
                        ],
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
