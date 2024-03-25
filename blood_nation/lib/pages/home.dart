import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BloodNation"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.notifications)
          )
        ],
        backgroundColor: const Color.fromARGB(255, 156, 200, 222),
        leading: IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.menu)
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)
          )
        ),
      ),
      
    );
  }
}
