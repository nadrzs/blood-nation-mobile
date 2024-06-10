import 'dart:convert';
import 'package:blood_nation/components/data/models/profile_models.dart';
import 'package:blood_nation/provider/headers_event.dart';
import 'package:blood_nation/provider/headers_profile.dart';
import 'package:http/http.dart' as http;

class ProfileProvider {
  // Method Get List Data
  Future<ProfileModels?> getProfileData() async {
    final userId = await HeadersProfile.userId();
    final token = await HeadersProfile.headers();
    final String profileUrl = 'http://3.27.136.219/users/$userId';
    final Map<String, String> queryParams = {'id': userId.toString()};
    final Uri uri = Uri.parse(profileUrl).replace(queryParameters: queryParams);

    // print('Token: ');
    // print(token);

    // print('Uri: ');
    // print(uri);

    try {
      final response = await http.get(
        uri,
        headers: token,
      );

      // print('Response: ');
      // print(response);
      // print(response.body);

      // print('User id: ');
      // print(userId);

      final extractedData = json.decode(response.body);

      // print('Extracted Data: ');
      // print(extractedData);

      final objectData = ProfileModels.fromJson(extractedData);

      // print('Object Data: ');
      // print(objectData);

      return objectData;
    } catch (e) {
      // print(e);

      return null;
    }
  }
}
