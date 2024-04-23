import 'package:blood_nation/components/history_timeline.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          children: const [
            HistoryTimeLine(
              isFirst: true, 
              isLast: false, 
              isPast: true,
              timelineCard: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address: Jl. Anggrek No. 21, Jakarta"),
                  Text("Age: 18"),
                  Text("Weight: 54 kg"),
                  Text("Blood Type: A")
                ],
              ),
            ),
            HistoryTimeLine(
              isFirst: false, 
              isLast: false, 
              isPast: true,
              timelineCard: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address: Jl. Soekarno Hatta No. 18, Bogor"),
                  Text("Age: 21"),
                  Text("Weight: 47 kg"),
                  Text("Blood Type: O")
                ],
              ),
            ),
            HistoryTimeLine(
              isFirst: false, 
              isLast: true, 
              isPast: false,
              timelineCard: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address: Jl. Anyelir No. 24, Jakarta"),
                  Text("Age: 28"),
                  Text("Weight: 56 kg"),
                  Text("Blood Type: B")
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}