import 'package:shared_preferences/shared_preferences.dart';

class HeadersReservation {
  static Future<Map<String, String>> eventId() async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final getEventId = prefs.getString('event-id');

    // Return Headers
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'token': '$getEventId'
    };
  }

  static Future<void> storeEvent(String value) async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final getEventId = prefs.setString('event-id', value);
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
