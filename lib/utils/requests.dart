import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Requests {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static Future<Map<String, dynamic>?> get({required String url}) async {
    return await requestWrapper(fn: http.get(Uri.parse(url), headers: headers));
  }

  static Future<Map<String, dynamic>?> post(
      {required String url, required Map<String, dynamic> body}) async {
    return await requestWrapper(
        fn: http.post(Uri.parse(url),
            headers: headers, body: json.encode(body)));
  }

  static Future<Map<String, dynamic>?> requestWrapper(
      {required Future<http.Response> fn}) async {
    try {
      var res = await fn.timeout(Duration(seconds: 10));
      if (res.statusCode != 200) return null;

      return json.decode(res.body);
    } on TimeoutException {
      String message = 'Requests taking too long';

      throw TimeoutException(message);
    } on SocketException {
      String message = 'No network';

      throw SocketException(message);
    } on http.ClientException {
      String message = 'An unexpected error occurred while making the request.';

      throw Exception(message);
    } catch (e) {
      rethrow;
    }
  }
}
