import 'package:flutter/material.dart';
import 'package:guest_management/utils/endpoints.dart';
import 'package:guest_management/utils/requests.dart';
import 'package:guest_management/utils/utils.dart';

class Auth with ChangeNotifier {
  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final res = await Requests.post(
          url: Endpoints.signIn,
          body: {
            'strategy': 'local',
            'email': email,
            'password': password,
          },
          okStatusCode: 201);
      logger.i(res);
    } catch (e) {
      Toast.showToast(message: e.toString(), context: context);
    }
  }
}
