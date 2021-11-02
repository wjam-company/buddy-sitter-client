import 'dart:convert';

import 'package:buddy_sitter/data/dynamic/fetch.dart';
import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthService {
  static final _data = BuddySitterData().state;

  static void logout(BuildContext context) {
    _data.clear().then((_) {
      Provider.of<RouterPageHandler>(context, listen: false).show(
        BuddySitterLocation.onBoarding,
      );
    });
  }

  static bool login(BuildContext context, String email, String password) {
    final RouterPageHandler pageHandler =
        Provider.of<RouterPageHandler>(context, listen: false);
    try {
      ApiManager.fetchLogin(password: password, email: email).then((value) {
        _data.setKey("credentials", value);
        Map info = decodeJWTPayload(value.accessToken);
        _data.setKey("user", info);
        pageHandler.state = _data.syncGet();
        pageHandler.show(BuddySitterLocation.explore);
        return true;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  static Map decodeJWTPayload(String str) {
    str = str.split(".")[1];
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }
    String decode = utf8.decode(base64Url.decode(output));
    return jsonDecode(decode);
  }
}
