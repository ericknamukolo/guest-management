import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Requests {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static Future<Map<String, dynamic>?> get(
      {required String url, int okStatusCode = 200}) async {
    return await requestWrapper(
      fn: http.get(Uri.parse(url), headers: headers),
      okStatusCode: okStatusCode,
    );
  }

  static Future<Map<String, dynamic>?> post(
      {required String url,
      required Map<String, dynamic> body,
      int okStatusCode = 200}) async {
    return await requestWrapper(
        fn: http.post(Uri.parse(url),
            headers: headers, body: json.encode(body)),
        okStatusCode: okStatusCode);
  }

  static Future<Map<String, dynamic>?> requestWrapper(
      {required Future<http.Response> fn, required int okStatusCode}) async {
    try {
      var res = await fn.timeout(Duration(seconds: 10));

      if (res.statusCode != okStatusCode) {
        throw Exception(
            json.decode(res.body)?['message'] ?? 'Something went wrong');
      }

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
