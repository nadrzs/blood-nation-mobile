import 'package:flutter/material.dart';

class ItemProfile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;

  const ItemProfile({super.key, required this.title, required this.subtitle, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.red.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.grey.shade200,
      ),
    );
  }
}
