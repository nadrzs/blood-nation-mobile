import 'package:blood_nation/components/item_profile.dart';
import 'package:blood_nation/pages/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Profile",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          ItemProfile(
              title: "Username", subtitle: "johndoe", iconData: Icons.person),
          SizedBox(height: 40),
          ItemProfile(
              title: "Email",
              subtitle: "johndoe@email.com",
              iconData: Icons.email),
          SizedBox(height: 40),
          ItemProfile(
              title: "Phone Number",
              subtitle: "08123456789",
              iconData: Icons.phone),
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
          ),
        ],
      ),
    ));
  }
}
