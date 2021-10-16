import 'package:buddy_sitter/data/dynamic/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/requets/log.dart';

class ApiMananger {
  Future<Login> fetchLogin() async {
    final response = await http.get(Uri.parse(Url.login));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Login.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Login> fetchProfile() async {
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
