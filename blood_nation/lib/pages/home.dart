import 'package:blood_nation/data/data.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var status = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(hintText: "Cari Event"),
        ),
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
                print(eventData[index]);
                return ListTile(
                  leading: Image.network(eventData[index]['image']),
                  title: Text(eventData[index]['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Kuota: "),
                          Text(eventData[index]['kuota']),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Lokasi: "),
                          Text(eventData[index]['lokasi']),
                        ],
                      ),
                      Text(eventData[index]['date']),
                    ],
                  ),
                );
              },
              itemCount: eventData.length,
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
                          // height: 80,
                          // width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage(eventData[index]['image']),
                                  fit: BoxFit.cover)),
                        ),
                        ListTile(
                          title: Text(
                            eventData[index]['title'], 
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Kuota: ", style: TextStyle(fontSize: 12),),
                                  Text(eventData[index]['kuota'], style: TextStyle(fontSize: 12),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Lokasi: ", style: TextStyle(fontSize: 12),),
                                  Text(eventData[index]['lokasi'], style: TextStyle(fontSize: 12),),
                                ],
                              ),
                              Text(eventData[index]['date'], style: TextStyle(fontSize: 12),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: eventData.length),
    );
  }
}
