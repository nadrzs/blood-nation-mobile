import 'package:blood_nation/data/data.dart';
import 'package:flutter/material.dart';

class TryPage extends StatefulWidget {
  const TryPage({super.key});

  @override
  State<TryPage> createState() => _TryPageState();
}

class _TryPageState extends State<TryPage> {
  var status = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Search bar,
        actions: [
          IconButton(
            icon: status == 0 ? Icon(Icons.list) : Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                if (status == 0) {
                  status = 1;
                } else {
                  status = 0;
                }
              });
            },
          )
        ],
      ),
      body: status == 0
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(data[index]['image']),
                  title: Text(data[index]['title']),
                  subtitle: Text(data[index]['desc']),
                );
              },
              itemCount: data.length,
            )
          : GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(data[index]['image']),
                                  fit: BoxFit.cover)),
                        ),
                        ListTile(
                            title: Text(data[index]['title']),
                            subtitle: Text(data[index]['desc']))
                      ],
                    ),
                  ),
                );
              },
              itemCount: data.length),
    );
  }
}
