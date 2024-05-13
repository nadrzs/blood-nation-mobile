import 'package:blood_nation/components/data/data_json.dart';
import 'package:blood_nation/components/data/models/event_models.dart';

class ApiServices {
  List<EventModels> getEvent() {
    return data.map((e) => EventModels.fromJson(e)).toList();
  }
}
