import './url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/requets/log.dart';

class ApiMananger {
  static Future<Login> fetchLogin({
    required String password,
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse(Url.login),
      body: jsonEncode(
        <String, String>{
          'password': password,
          'email': email,
        },
      ),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Login log = Login.fromJson(jsonDecode(response.body));
      return log;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<Login> fetchProfile() async {
    final response = await http.get(Uri.parse(Url.profile));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Login.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load login');
    }
  }
}

void main() {
  ApiMananger.fetchLogin(
    password: '12345678fF*',
    email: 'willy@gmail.com',
  ).then((value) => print(value)).catchError((e) => print(e));
}
