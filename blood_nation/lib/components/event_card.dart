import 'package:blood_nation/components/data/models/event.dart';
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
            color: Color(0xffC31C2B), borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.network(data.imageUrl)),
            Expanded(
              flex: 4,
              child: const Column(
                children: [
                  // Text(data.name),
                  // Text(data.quota.toString()),
                  // Text(data.location),
                  // Text(data.date)
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Text("Grid View");
    }
  }
}
