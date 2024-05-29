import 'package:blood_nation/components/data/models/event_list_models.dart';
import 'package:blood_nation/provider/headers_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventList {
  List<EventListModels> results = [];

  // Method Get List Data
  Future<List<EventListModels>?> getListData({String? query}) async {
    final Uri eventListUrl = Uri.parse('http://10.0.2.2:3000/events?page=2');
    final header = await HeadersProvider.headers();

    try {
      final response = await http.get(eventListUrl, headers: header);

      // print('Response: ');
      // print(response);
      // print(response.body);

      // print(header);

      final extractedData = json.decode(response.body) as List<dynamic>;

      // print('Extracted Data: ');
      // print(extractedData);

      final objectData =
          extractedData.map((e) => EventListModels.fromJson(e)).toList();

      // print('Object Data: ');
      // print(objectData);

      if (query != null) {
        results = results
            .where((element) =>
                element.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

      return objectData;
    } catch (e) {
      print(e);

      return null;
    }
  }
}
