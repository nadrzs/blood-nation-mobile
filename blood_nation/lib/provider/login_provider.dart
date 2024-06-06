import 'dart:convert';
import 'package:blood_nation/provider/headers_event.dart';
import 'package:blood_nation/provider/headers_profile.dart';
import 'package:http/http.dart' as http;
import 'package:blood_nation/components/data/models/login_models.dart';

Future<LogInModels?> loginUser(String email, String password) async {
  final Uri loginUrl = Uri.parse('http://10.0.2.2:3000/users/login');
  final headers = {'Content-Type': 'application/json'};

  final Map<String, dynamic> loginData = {"email": email, "password": password};

  // print(json.encode(loginData));

  final http.Response response =
      await http.post(loginUrl, headers: headers, body: json.encode(loginData));

  // print('Response: ');
  // print(response);

  // print('Response Body: ');
  // print(response.body);

  // print('JSON Decode: ');
  // print(json.decode(response.body));

  final Map<String, dynamic> loginResponse = json.decode(response.body);

  // print('Log In Response: ');
  // print(loginResponse);

  // if (response.statusCode == 200) {
  //   final UserModels userModels = UserModels.fromJson(loginResponse);

  //   print('User Models: ');
  //   print(userModels);

  //   return userModels;
  // } else {
  //   return null;
  // }
  final LogInModels loginModels = LogInModels.fromJson(loginResponse);

  HeadersProvider.storeToken(loginModels.token);
  HeadersProfile.storeId(loginModels.user_id);

  return loginModels;

  // print('Log In Models: ');
  // print(loginModels);

  // print('Data User: ');
  // print(loginModels.token);
  // print(loginModels.user_id);
  // print(loginModels.username);
}
