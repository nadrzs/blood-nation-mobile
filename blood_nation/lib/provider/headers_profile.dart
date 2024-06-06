import 'package:shared_preferences/shared_preferences.dart';

class HeadersProfile {
  // Get token
  static Future<Map<String, String>> headers() async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('key-token');

    // Return Headers
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'token': '$token'
    };
  }

  static Future<void> storeToken(String value) async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.setString('key-token', value);
  }

  // Get id
  static Future<String?> userId() async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final getUserId = prefs.getString('id');

    return getUserId;
  }

  static Future<void> storeId(String value) async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final getId = prefs.setString('id', value);
  }
}
