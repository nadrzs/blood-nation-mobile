import 'package:blood_nation/components/widgets/history_card.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              Text(
                "History",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(top: 50),
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/history.png"),
                        fit: BoxFit.fitHeight)),
              ),
              const SizedBox(height: 30),
              HistoryCard(
                  title: "History 1",
                  subtitle: "Lorem Ipsum",
                  iconData: Icons.history),
              const SizedBox(height: 30),
              HistoryCard(
                  title: "History 2",
                  subtitle: "Lorem Ipsum",
                  iconData: Icons.history),
              const SizedBox(height: 30),
              HistoryCard(
                  title: "History 3",
                  subtitle: "Lorem Ipsum",
                  iconData: Icons.history),
              const SizedBox(height: 30),
              HistoryCard(
                  title: "History 4",
                  subtitle: "Lorem Ipsum",
                  iconData: Icons.history),
              const SizedBox(height: 30),
              HistoryCard(
                  title: "History 5",
                  subtitle: "Lorem Ipsum",
                  iconData: Icons.history),
              const SizedBox(height: 30),
              HistoryCard(
                  title: "History 6",
                  subtitle: "Lorem Ipsum",
                  iconData: Icons.history),
              const SizedBox(height: 30),
              HistoryCard(
                  title: "History 7",
                  subtitle: "Lorem Ipsum",
                  iconData: Icons.history),
              const SizedBox(height: 30),
              HistoryCard(
                  title: "History 8",
                  subtitle: "Lorem Ipsum",
                  iconData: Icons.history),
            ],
          ),
        ),
      ),
    );
  }
}
