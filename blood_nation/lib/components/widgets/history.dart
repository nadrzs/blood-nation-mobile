import 'package:blood_nation/components/data/models/history_models.dart';
import 'package:blood_nation/components/widgets/history_card.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  final HistoryModels historyModels;

  const History({super.key, required this.historyModels});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xffff0ead2),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Address: '),
                    Text(historyModels.address)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Weight: '),
                    Text(historyModels.weight.toString())
                  ],
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
