import 'dart:async';
import 'package:calcugasliter/screens/splash_screen.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final client = http.Client();
  static const timeoutDuration = Duration(seconds: 20);
  static Uri _buildUrl(String endpoint) {
    final apiPath = NetworkStrings.apiBaseUrl + endpoint;
    return Uri.parse(apiPath);
  }

//=================== POST-----------------------------
  static Future<http.Response> post(String endpoint, var body,
      {required bool isHeader}) async {
    var token = box.read('token');
    var response = await client
        .post(
          _buildUrl(endpoint),
          headers: isHeader ? {"Authorization": 'Bearer $token'} : null,
          body: body,
        )
        .timeout(
          timeoutDuration,
        );
    return response;
  }

  //-------------- PUT -------------------------------

  static Future<http.Response> put(
      String endpoint, var body, bool header) async {
    var token = box.read('token');
    if (header) {
      var response = await client
          .put(
            _buildUrl(endpoint),
            headers: {"Authorization": 'Bearer $token'},
            body: body,
          )
          .timeout(
            timeoutDuration,
          );
      return response;
    } else {
      var response = await client.put(
        _buildUrl(endpoint),
        body: body,
      );
      return response;
    }
  }

//------------------------- DELETE -----------------------------------------------------------

  static Future<http.Response> delete(String endpoint, Object? data) async {
    var token = box.read('token');
    var response = await client
        .delete(
          _buildUrl(endpoint),
          headers: {"Authorization": 'Bearer $token'},
          body: data,
        )
        .timeout(
          timeoutDuration,
        );
    return response;
  }

  //=------------------------ Get  -------------------------

  static Future<http.Response> getApi(String endpoint) async {
    var token = box.read('token');
    var response = await client.get(
      _buildUrl(endpoint),
      headers: {"Authorization": 'Bearer $token'},
    ).timeout(
      timeoutDuration,
    );
    return response;
  }
}
