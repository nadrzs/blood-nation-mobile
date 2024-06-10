import 'package:blood_nation/components/data/models/event_detail_list_models.dart';
import 'package:blood_nation/provider/headers_detail_event_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventDetailList {
  // Method Get List Data
  Future<EventDetailListModels?> getDetailData(String id) async {
    final Uri eventDetailListUrl = Uri.parse('http://3.27.136.219/events/$id');
    final header = await HeadersDetailEventProvider.headers();

    try {
      final response = await http.get(eventDetailListUrl, headers: header);

      // print('Response: ');
      // print(response);
      // print(response.body);

      // print(header);

      final extractedData = json.decode(response.body);

      // print('Extracted Data: ');
      // print(extractedData);

      final objectData = EventDetailListModels.fromJson(extractedData);

      // print('Object Data: ');
      // print(objectData);

      return objectData;
    }
    catch (e){
      // print(e);

      return null;
    }
  }
}