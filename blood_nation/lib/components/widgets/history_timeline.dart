import 'package:blood_nation/components/widgets/timeline_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HistoryTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final timelineCard;

  const HistoryTimeLine(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.timelineCard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,

        // Decorate the lines
        beforeLineStyle:
            LineStyle(color: isPast ? Color(0xffbb525c) : Color(0xffce8b91)),

        // Decorate the icon
        indicatorStyle: IndicatorStyle(
            width: 40,
            color: isPast ? Color(0xffbb525c) : Color(0xffce8b91),
            iconStyle: IconStyle(
                iconData: Icons.done,
                color: isPast ? Colors.white : Color(0xffce8b91))),
        endChild: TimelineCard(
          isPast: isPast,
          child: timelineCard,
        ),
      ),
    );
  }
}
