import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blood_nation/components/data/models/register_models.dart';

Future<UserModels?> registerUser(
    String username, String email, String password, String phoneNumber) async {
  final Uri registerUrl = Uri.parse('http://10.0.2.2:3000/users/register');
  final headers = {'Content-Type': 'application/json'};

  final Map<String, dynamic> registerData = {
    "username": username,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
  };

  // print(json.encode(registerData));

  final http.Response response = await http.post(registerUrl,
      headers: headers, body: json.encode(registerData));

  // print('Response: ');
  // print(response);

  // print('Response Body: ');
  // print(response.body);

  // print('JSON Decode: ');
  // print(json.decode(response.body));

  final Map<String, dynamic> registerResponse = json.decode(response.body);

  // print('Register Response: ');
  // print(registerResponse);

  // if (response.statusCode == 200) {
  //   final UserModels userModels = UserModels.fromJson(registerResponse);

  //   print('User Models: ');
  //   print(userModels);

  //   return userModels;
  // } else {
  //   return null;
  // }
  final UserModels userModels = UserModels.fromJson(registerResponse);

  return userModels;

  // print('User Models: ');
  // print(userModels);

  // print('Data User: ');
  // print(userModels.username);
  // print(userModels.email);
  // print(userModels.phoneNumber);
}
