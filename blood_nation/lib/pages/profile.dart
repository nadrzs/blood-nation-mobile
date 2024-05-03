import 'package:blood_nation/components/widgets/item_profile.dart';
import 'package:blood_nation/pages/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "johndoe";
  String email = "johndoe@gmail.com";
  String phoneNumber = "08123456789";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              "Profile",
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
            ItemProfile(
                title: "Username", subtitle: username, iconData: Icons.person),
            SizedBox(height: 40),
            ItemProfile(title: "Email", subtitle: email, iconData: Icons.email),
            SizedBox(height: 40),
            ItemProfile(
                title: "Phone Number",
                subtitle: phoneNumber,
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
              ),
        ));
  }
}
