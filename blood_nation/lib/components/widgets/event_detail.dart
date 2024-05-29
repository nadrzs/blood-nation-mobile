import 'package:blood_nation/components/data/models/event_detail_list_models.dart';
import 'package:flutter/material.dart';

class EventDetail extends StatelessWidget {
  final EventDetailListModels eventDetail;

  const EventDetail({super.key, required this.eventDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                SizedBox(height: 40),
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    eventDetail.imageUrl, 
                    height: 200
                  ),
                ),
                SizedBox(height: 40),
                // Location
                Row(
                  children: [
                    Icon(Icons.location_city, color: Colors.red, size: 40),
                    const SizedBox(width: 10),
                    Text(
                      eventDetail.name,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Requirement
                Row(
                  children: [
                    Icon(Icons.menu, color: Colors.red, size: 25),
                    const SizedBox(width: 10),
                    Text(
                      "Requirement",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventDetail.requirements,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                // Date
                Row(
                  children: [
                    Icon(Icons.calendar_month, color: Colors.red, size: 25),
                    const SizedBox(width: 10),
                    Text(
                      'Date: ',
                      style: TextStyle(fontSize: 20)
                    ),
                    Text(
                      eventDetail.date.toString(),
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                // Quota
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.red, size: 25),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Text(
                          'Quota: ',
                          style: TextStyle(fontSize: 20)
                        ),
                        SizedBox(width: 5),
                        Text(
                          eventDetail.quota.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        )
      ],
    );
  }
}