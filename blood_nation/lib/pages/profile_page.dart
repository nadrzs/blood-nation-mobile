import 'package:blood_nation/components/data/models/profile_models.dart';
import 'package:blood_nation/components/widgets/item_profile.dart';
import 'package:blood_nation/components/widgets/profile_detail.dart';
import 'package:blood_nation/pages/login_page.dart';
import 'package:blood_nation/provider/profile_provider.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
    {
      super.key
    }
  );

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ProfileModels?>(
            future: ProfileProvider().getProfileData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ProfileDetail(profileModels: snapshot.data!);
              }
            })
    );
  }
}
