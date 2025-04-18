import 'package:flutter/material.dart';
import 'package:guest_management/features/auth/screens/splash_screen.dart';
import 'package:guest_management/features/guests/screens/guests_screen.dart';
import 'package:guest_management/utils/endpoints.dart';
import 'package:guest_management/utils/local_storage.dart';
import 'package:guest_management/utils/requests.dart';
import 'package:guest_management/utils/utils.dart';

import '../../../utils/navigation.dart';

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
      await prefs.setString(LocalStorage.accessToken, res?['accessToken']);
      Navigation.go(
          screen: const GuestsScreen(), context: context, replace: true);
    } catch (e) {
      Toast.showToast(message: e.toString(), context: context);
    }
  }

  static Future<void> logOut(BuildContext context) async {
    await prefs.clear();
    Navigation.go(
        screen: const SplashScreen(), context: context, replace: true);
    Toast.showToast(message: 'Logged out successfully', context: context);
  }
}
