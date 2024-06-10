import 'dart:convert';
import 'package:blood_nation/components/data/models/history_models.dart';
import 'package:blood_nation/provider/headers_event.dart';
import 'package:blood_nation/provider/headers_history.dart';
import 'package:http/http.dart' as http;

class HistoryProvider {
  // Method Get List Data
  Future<List<HistoryModels>?> getHistoryData() async {
    final token = await HeadersHistory.headers();
    final String historyUrl = 'http://3.27.136.219/reservations';
    final Uri uri = Uri.parse(historyUrl);

    try {
      final response = await http.get(uri, headers: token);

      // print('Response: ');
      // print(response);
      // print(response.body);

      final extractedData = json.decode(response.body) as List<dynamic>;

      // print('Extracted Data: ');
      // print(extractedData);

      final objectData = extractedData.map((e) => HistoryModels.fromJson(e)).toList();

      // print('Object Data: ');
      // print(objectData);

      return objectData;
    } catch (e) {
      // print(e);

      return null;
    }
  }
}
