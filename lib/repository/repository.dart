import 'dart:convert';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final String baseUrl = "http://192.168.1.142:8080";

  static final Repository _singleton = Repository._internal();

  factory Repository() {
    return _singleton;
  }

  Repository._internal();

  login(String username, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await post(
        Uri.parse("$baseUrl/user/login"), headers: headers,
        body: jsonEncode({"email": username, "password": password}));
    var pref = await SharedPreferences.getInstance();
    pref.setString("auth", response.body);
  }


  favorites() async {
    var response = await get(Uri.parse("$baseUrl/favorites"));
    print(response.body);
  }


}
