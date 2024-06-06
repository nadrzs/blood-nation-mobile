import 'package:blood_nation/components/data/models/profile_models.dart';
import 'package:blood_nation/pages/login_page.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final ProfileModels profileModels;

  const ProfileDetail({required this.profileModels, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'Profile',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/profile.png"),
                      fit: BoxFit.fitHeight)),
            ),
            const SizedBox(height: 30),
            Container(
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
              child: Column(
                children: [
                  ListTile(
                    title: Text('Username'),
                    subtitle: Text(profileModels.username),
                    leading: Icon(Icons.person),
                    tileColor: Colors.grey.shade200,
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(profileModels.email),
                    leading: Icon(Icons.email),
                    tileColor: Colors.grey.shade200,
                  ),
                  ListTile(
                    title: Text('Phone Number'),
                    subtitle: Text(profileModels.phoneNumber),
                    leading: Icon(Icons.phone),
                    tileColor: Colors.grey.shade200,
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Container(
              padding: EdgeInsets.only(top: 3, left: 3),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                elevation: 0,
                color: Color(0xffC31C2B),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Log Out",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
