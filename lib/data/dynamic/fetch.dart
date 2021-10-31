// ignore_for_file: avoid_print

import 'model/entries/pet.dart';
import 'model/entries/profile.dart';
import './url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/requets/log.dart';

class ApiManager {
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
  // Fetch a profile by its id
  static Future<Profile> fetchProfile({
    required String profileId,
  }) async {
    final response = await http.get(
      Uri.parse(Url.profile + '/' + profileId),
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

  // Fetch all sitter profiles
  static Future<List<Profile>> fetchSitterProfiles() async {
    final response = await http.get(
      Uri.parse(Url.profile + '/sitters'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Profile> allSitters = [];
      for (var sitterProfile in jsonDecode(response.body)) {
        Profile profile = Profile.fromJson(sitterProfile);
        allSitters.add(profile);
      }
      return allSitters;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // Fetch a profile by its user id
  static Future<Profile> fetchProfileId({
    required String userId,
  }) async {
    final response = await http.get(
      Uri.parse(Url.profile + '/user/' + userId),
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

  // Fetch all owner profiles
  static Future<List<Profile>> fetchOwnerProfiles({
    required String role,
  }) async {
    final response = await http.get(
      Uri.parse(Url.profile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Profile> allProfiles = [];
      for (var profile in jsonDecode(response.body)) {
        Profile profileObj = Profile.fromJson(profile);
        allProfiles.add(profileObj);
      }
      return allProfiles;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // Fetch all profiles
  static Future<List<Profile>> fetchAllProfiles() async {
    final response = await http.get(
      Uri.parse(Url.profile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Profile> allProfiles = [];
      for (var profile in jsonDecode(response.body)) {
        Profile profileObj = Profile.fromJson(profile);
        allProfiles.add(profileObj);
      }
      return allProfiles;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // Update profile
  static Future<Profile> updateProfile({
    required Profile updatedProfile,
  }) async {
    final response = await http.put(
      Uri.parse(Url.profile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Profile profileObj = Profile.fromJson(jsonDecode(response.body));
      return profileObj;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // Pets
  // Fetch all pets
  static Future<List<Pet>> fetchAllPet() async {
    final response = await http.get(
      Uri.parse(Url.pets),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Pet> allPets = [];
      for (var pet in jsonDecode(response.body)) {
        Pet petObj = Pet.fromJson(pet);
        allPets.add(petObj);
      }
      return allPets;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

void main() {
  ApiManager.fetchAllPet()
      .then((value) => print(value))
      .catchError((e) => print(e));
}
