import 'dart:convert';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_interceptor/http_interceptor.dart';

class Repository {
  final String baseUrl = "http://192.168.1.112:8080";

  static final Repository _singleton = Repository._internal();

  static InterceptedClient client =
      InterceptedClient.build(interceptors: [AuthInterceptor()]);

  factory Repository() {
    return _singleton;
  }

  Repository._internal();

  login(String username, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await post(Uri.parse("$baseUrl/user/login"),
        headers: headers,
        body: jsonEncode({"email": username, "password": password}));
    var pref = await SharedPreferences.getInstance();
    print("token is: " + response.body);
    var value = await pref.setString("auth", response.body);
    if (value)
      print("token saved");
    else
      print("error while saving token");
  }

  favorites() async {
    var response = await client.get(Uri.parse("$baseUrl/user/favorites"));
    print("response favorites is" + response.body);
  }
}

class AuthInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    final pref = await SharedPreferences.getInstance();

    try {
      if (pref.containsKey("auth"))
        data.headers["Authorization"] = pref.getString("auth")!;
    } catch (e) {
      print(e);
    }
    print(data.headers);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
