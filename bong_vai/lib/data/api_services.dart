import 'dart:convert';

import 'package:bong_vai/data/api_urls.dart';
import 'package:bong_vai/models/user.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<User>> fetchUser() {
    return http.get(ApiUrls().API_USER_LIST).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final userListContainer = _decoder.convert(jsonBody);
      final List userList = userListContainer['results'];
      return userList.map((e) => new User.fromMap(e)).toList();
    });
  }
}
