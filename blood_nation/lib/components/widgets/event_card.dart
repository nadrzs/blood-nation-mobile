import 'package:blood_nation/components/data/models/event_models.dart';
import 'package:flutter/material.dart';

enum EventCardStyle {
  list,
  grid;

  bool get isList => this == EventCardStyle.list;
  bool get isGrid => this == EventCardStyle.grid;
}

class EventCard extends StatelessWidget {
  final EventModels data;
  final EventCardStyle style;

  const EventCard.list({super.key, required this.data})
      : style = EventCardStyle.list;
  const EventCard.grid({super.key, required this.data})
      : style = EventCardStyle.grid;

  @override
  Widget build(BuildContext context) {
    if (style.isList) {
      return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Color(0xffff0ead2), borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.network(data.imageUrl)),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text(data.name),
                  Text(data.quota.toString()),
                  Text(data.location),
                  Text(data.date)
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xffff0ead2),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(data.imageUrl)
                ),
                Text(data.name),
                Text(data.quota.toString()),
                Text(data.location),
                Text(data.date)
              ],
            ),
          ),
        ),
      );
    }
  }
}