import 'package:shared_preferences/shared_preferences.dart';

class HeadersProvider {
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
}
