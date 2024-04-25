import 'package:blood_nation/components/data/models/event.dart';
import 'package:blood_nation/components/data/services/api_services.dart';
import 'package:blood_nation/components/event_card.dart';
import 'package:flutter/material.dart';

class ListPages extends StatefulWidget {
  const ListPages({super.key});

  @override
  State<ListPages> createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {
  late final List<EventModels> data;

  @override
  void initState() {
    super.initState();
    data = ApiServices().getEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            return EventCard.list(data: data[index]);
          }),
    );
  }
}
