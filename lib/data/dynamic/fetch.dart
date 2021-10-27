import 'model/entries/profile.dart';
import './url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/requets/log.dart';

class ApiMananger {
  // AUTHENTICATION
  // Login
  static Future<Login> fetchLogin({
    required String password,
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse(Url.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
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

  // Signup
  static Future<Login> fetchSignUp({
    required String password,
    required String email,
    required String username,
    required bool isSitter,
  }) async {
    final response = await http.post(
      Uri.parse(Url.signup),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
        'username': username,
        'is_sitter': isSitter
      }),
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

  // Send recover password email
  static void fetchPasscode({
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse(Url.recoverpwd),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
      }),
    );

    if (response.statusCode != 200) {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // Change password and login
  static Future<Login> changePassword({
    required String passcode,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(Url.recoverpwd + '/' + passcode),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'password': password,
      }),
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

  // PROFILE
  // Fetch a profile
  static Future<Profile> fetchProfile({
    required String profileId,
  }) async {
    final response = await http.get(Uri.parse(Url.profile + '/' + profileId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Profile profile = Profile.fromJson(jsonDecode(response.body));
      return profile;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // Update profile
  
}

void main() {
  ApiMananger.fetchProfile(
    profileId: '61783a1a93f6e210e3c59382',
  ).then((value) => print(value)).catchError((e) => print(e));
}
