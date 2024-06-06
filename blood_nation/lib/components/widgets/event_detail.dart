import 'package:blood_nation/components/data/models/event_detail_list_models.dart';
import 'package:blood_nation/pages/reservation_page.dart';
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
              SizedBox(height: 60),
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  eventDetail.imageUrl, 
                  height: 200, 
                  fit: BoxFit.cover
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
                  Text('Date: ', style: TextStyle(fontSize: 20)),
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
                      Text('Quota: ', style: TextStyle(fontSize: 20)),
                      SizedBox(width: 5),
                      Text(
                        eventDetail.quota.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 100),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  elevation: 0,
                  color: Color(0xffC31C2B),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReservationPage(eventId: eventDetail.id,)));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Create Reservation",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
