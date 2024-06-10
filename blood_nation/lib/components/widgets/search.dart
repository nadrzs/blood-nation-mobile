import 'package:blood_nation/components/data/models/event_list_models.dart';
import 'package:blood_nation/components/widgets/event_card.dart';
import 'package:blood_nation/pages/detail_event.dart';
import 'package:blood_nation/provider/event_list_provider.dart';
import 'package:flutter/material.dart';

class SearchData extends SearchDelegate {
  var status = 0;

  // Close button
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  // Back button
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  // Show Search Result
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<EventListModels>?>(
        future: EventList().getListData(query: query),
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
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Not Found'),
    );
  }
}
