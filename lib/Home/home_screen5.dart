import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen5 extends StatefulWidget {
  const HomeScreen5({super.key});

  @override
  State<HomeScreen5> createState() => _HomeScreen5State();
}

class _HomeScreen5State extends State<HomeScreen5> {
  @override
  Widget build(BuildContext context) {
    returnScaffold(
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
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ReusbaleRow(
                              title: 'Name',
                              value: data[index]['name'].toString(),
                            ),
                            ReusbaleRow(
                              title: 'Username',
                              value: data[index]['username'].toString(),
                            ),
                            ReusbaleRow(
                              title: 'Address',
                              value:
                                  data[index]['address']['street'].toString(),
                            ),
                            ReusbaleRow(
                              title: 'Lat',
                              value: data[index]['address']['geo']['lat']
                                  .toString(),
                            ),
                            ReusbaleRow(
                              title: 'Lat',
                              value: data[index]['address']['geo']['lng']
                                  .toString(),
                            ),
                          ],
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