import 'package:flutter/foundation.dart';
import 'package:guest_management/utils/endpoints.dart';
import 'package:guest_management/utils/requests.dart';
import 'package:guest_management/utils/utils.dart';

class Auth with ChangeNotifier {
  Future<void> signIn({required String email, required String password}) async {
    try {
      final res = await Requests.post(url: Endpoints.signIn, body: {
        'strategy': 'local',
        'email': email,
        'password': password,
      });
      logger.i(res);
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
