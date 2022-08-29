import 'package:calcugasliter/screens/splash_screen.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiService {
  static final client = http.Client();
  static Uri _buildUrl(String endpoint) {
    final apiPath = NetworkStrings.apiBaseUrl + endpoint;
    return Uri.parse(apiPath);
  }

//=================== POST-----------------------------
  static Future<http.Response> post(String endpoint, var body) async {
    var response = await client.post(
      _buildUrl(endpoint),
      body: body,
    );
    //  try {
//     var response = await request
//         .close()
//         .then(
//           (_) => print('Got eventual response'),
//         )
//         .timeout(
//           const Duration(seconds: 1),
//         );
//   } on TimeoutException catch (_) {
//     print('Timed out');
//     request.abort();
//   }
    return response;
  }
  //--------------put-------------------------------------------------

  static Future<http.Response> put(
      String endpoint, var body, bool header) async {
    var token = box.read('token');
    if (header) {
      Logger().i(token);
      Logger().i(header);
      var response = await client.put(
        _buildUrl(endpoint),
        headers: {"Authorization": 'Bearer $token'},
        body: body,
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

//------------------------- DELETE ------------------------------------
  static Future<http.Response> delete(String endpoint, Object? data) async {
    var token = box.read('token');
    var response = await client.delete(
      _buildUrl(endpoint),
      headers: {"Authorization": 'Bearer $token'},
      body: data,
    );
    return response;
  }

  //=------------------------ POST with Header -------------------------

  static Future<http.Response> postWithHeader(
      String endpoint, Object? data) async {
    var token = box.read('token');
    var response = await client.post(
      _buildUrl(endpoint),
      headers: {"Authorization": 'Bearer $token'},
      body: data,
    );
    return response;
  }
  //=------------------------ Get with Header -------------------------

  static Future<http.Response> getApi(String endpoint) async {
    var token = box.read('token');

    var response = await client.get(
      _buildUrl(endpoint),
      headers: {"Authorization": 'Bearer $token'},
    );
    return response;
  }
}
