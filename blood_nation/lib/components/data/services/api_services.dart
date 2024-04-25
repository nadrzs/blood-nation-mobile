import 'package:blood_nation/components/data/data_json.dart';
import 'package:blood_nation/components/data/models/event.dart';

class ApiServices {
  List<EventModels> getEvent() {
    return data.map((e) => EventModels.fromJson(e)).toList();
  }
}
