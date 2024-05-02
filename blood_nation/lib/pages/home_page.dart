import 'package:blood_nation/components/data/models/event.dart';
import 'package:blood_nation/components/data/services/api_services.dart';
import 'package:blood_nation/components/widgets/event_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<EventModels> data;
  var status = 0;

  @override
  void initState() {
    super.initState();
    data = ApiServices().getEvent();
  }

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
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            return EventCard.list(data: data[index]);
          }),
    );
  }
}
