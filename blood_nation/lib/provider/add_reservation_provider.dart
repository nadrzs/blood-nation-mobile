import 'dart:convert';
import 'package:blood_nation/components/data/models/add_reservation_models.dart';
import 'package:blood_nation/components/data/models/reservation_success_models.dart';
import 'package:blood_nation/provider/headers_profile.dart';
import 'package:blood_nation/provider/headers_reservation.dart';
import 'package:http/http.dart' as http;

class AddReservation {
  // Method Get List Data
  Future<ReservationSuccessModels?> addReservationUser(
      String address,
      String age,
      String weight,
      String bloodType,
      String eventId,
      String userId) async {
    final token = await HeadersProfile.headers();
    final String addReservationUrl = 'http://10.0.2.2:3000/reservations/$eventId/$userId';
    final Map<String, String> queryParams = {
      'eventId': eventId,
      'userId': userId
    };

    final Uri uri = Uri.parse(addReservationUrl).replace(queryParameters: queryParams);

    print('Uri: ');
    print(uri);

    final AddReservationModels addReservationData = AddReservationModels(
        address: address,
        age: int.parse(age),
        weight: int.parse(weight),
        bloodType: bloodType);

    print('Add Reservation Data: ');
    print(addReservationData);

    try {
      final response = await http.post(uri,
          headers: token, body: json.encode(addReservationData.toJson()));

      print('Response: ');
      print(response);

      print('Response Body: ');
      print(response.body);

      final Map<String, dynamic> addReservationResponse =
          json.decode(response.body);

      print('Add Reservation Response: ');
      print(addReservationResponse);

      final ReservationSuccessModels reservationSuccessModels =
          ReservationSuccessModels.fromJson(addReservationResponse);

      return reservationSuccessModels;
    } catch (e) {
      print('Catch Error: ');
      print(e);

      return null;
    }
  }
}
