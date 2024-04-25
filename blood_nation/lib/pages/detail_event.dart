import 'package:flutter/material.dart';

class DetailEvent extends StatefulWidget {
  const DetailEvent({super.key});

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  SizedBox(height: 40),
                  // Image
                  Image.network(
                    "https://source.unsplash.com/featured/?hospital", 
                    height: 200,
                  ),
                  SizedBox(height: 40),
                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_city, color: Colors.red, size: 40),
                      const SizedBox(width: 5),
                      Text("Jakarta", style: TextStyle(
                        fontSize: 30
                      ))
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Requirement
                  Row(
                    children: [
                      Icon(Icons.menu, color: Colors.red, size: 20),
                      const SizedBox(width: 5),
                      Text("Requirement", style: TextStyle(
                        fontSize: 20
                      ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 10),
                      Text("1. Usia 17 - 65 tahun"),
                      SizedBox(height: 10),
                      Text("2. Sehat jasmani dan rohani"),
                      SizedBox(height: 10),
                      Text("3. Berat badan minimal 45 kg"),
                      SizedBox(height: 10),
                      Text("4. Kadar haemoglobin 12,5g% s/d 17,0g%"),
                      SizedBox(height: 10),
                      Text("5. Interval donor minimal 12 minggu atau 3 bulan sejak donor darah sebelumnya (maksimal 5 kali dalam 2 tahun)")
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Date
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.red, size: 20),
                      const SizedBox(width: 5),
                      Text("2001 - 09 - 11", style: TextStyle(
                        fontSize: 20
                      ))
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Quota
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.red, size: 20),
                      const SizedBox(width: 5),
                      Text("1200", style: TextStyle(
                        fontSize: 20
                      ))
                    ],
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}