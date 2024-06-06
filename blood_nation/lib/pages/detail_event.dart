import 'package:blood_nation/components/data/models/event_detail_list_models.dart';
import 'package:blood_nation/components/widgets/event_detail.dart';
import 'package:blood_nation/provider/event_detail_list_provider.dart';
import 'package:flutter/material.dart';

class DetailEvent extends StatefulWidget {
  final String id;

  const DetailEvent({required this.id, super.key});

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  late Future<EventDetailListModels?> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<EventDetailListModels?>(
      future: EventDetailList().getDetailData(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return EventDetail(eventDetail: snapshot.data!);
        }
      },
    ));
  }
}
