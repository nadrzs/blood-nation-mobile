import 'package:blood_nation/components/data/models/history_models.dart';
import 'package:blood_nation/components/widgets/history.dart';
import 'package:blood_nation/provider/history_provider.dart';
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
        body: FutureBuilder<List<HistoryModels>?>(
            future: HistoryProvider().getHistoryData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                  return History(historyModels: snapshot.data![index]);
                });
              }
            }));
  }
}
