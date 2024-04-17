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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 156, 200, 222),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        Text('Search', style: TextStyle(
                          color: Colors.white
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: (){}, 
                    icon: Icon(Icons.square), 
                    label: Text('Grid View'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(12),
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 156, 200, 222),
                      textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Donor Darah PMI', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kuota: 1200'),
                      Text('Lokasi: Jakarta'),
                      Text('Tanggal: 2001 - 09 - 11 12:37:12.304Z')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Donor Darah Mandiri', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kuota: 1500'),
                      Text('Lokasi: Depok'),
                      Text('Tanggal: 2001 - 09 - 13 02:14:19.090Z')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Donor Darah RS Harapan Jaya', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kuota: 100'),
                      Text('Lokasi: Jakarta'),
                      Text('Tanggal: 2001 - 09 - 19 08:36:35.877Z')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Donor Darah Pemuda Pecinta Alam', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kuota: 250'),
                      Text('Lokasi: Jakarta'),
                      Text('Tanggal: 2001 - 09 - 11 22:08:08.137Z')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Donor Darah Pemkot', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kuota: 1200'),
                      Text('Lokasi: Bandung'),
                      Text('Tanggal: 2001 - 09 - 10 20:01:35.296Z')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Donor Darah Jalin Kasih', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kuota: 800'),
                      Text('Lokasi: Bogor'),
                      Text('Tanggal: 2001 - 09 - 15 13:12:36.621Z')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
