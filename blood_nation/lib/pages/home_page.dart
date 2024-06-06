import 'package:blood_nation/components/data/models/event_list_models.dart';
import 'package:blood_nation/components/widgets/event_card.dart';
import 'package:blood_nation/components/widgets/search.dart';
import 'package:blood_nation/pages/detail_event.dart';
import 'package:blood_nation/provider/event_list_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<EventListModels?> data;
  var status = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchData());
              },
              icon: Icon(Icons.search)),
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
      body: FutureBuilder<List<EventListModels>?>(
          future: EventList().getListData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              print('Error ${snapshot.error}');

              return Center(
                child: Text('Failed to load data ${snapshot.error}'),
              );
            } else {
              List<EventListModels>? data = snapshot.data; // Define data here
              return status == 0
                  ? GridView.builder(
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: data?.length ?? 0, // Check for null
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailEvent(
                                      id: data[index].id,
                                    )));
                      },
                          child: EventCard.grid(
                              data: data![index]),
                        ); // Check for null
                      })
                  : ListView.builder(
                      itemCount: data?.length ?? 0, // Check for null
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailEvent(
                                          id: data[index].id,
                                        )));
                          },
                          child: EventCard.list(data: data![index]),
                        ); // Check for null
                      });
            }
          }),
    );
  }
}
