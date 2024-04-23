import 'package:flutter/material.dart';

class TimelineCard extends StatelessWidget {
  final bool isPast;
  final child;

  const TimelineCard(
    {
      super.key, 
      required this.isPast,
      required this.child
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isPast ? Color(0xffce8b91) : Color(0xffe2b9bd), 
        borderRadius: BorderRadius.circular(8)
      ),
      child: child,
    );
  }
}
