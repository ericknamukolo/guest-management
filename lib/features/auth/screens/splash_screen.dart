import 'package:flutter/material.dart';
import 'package:guest_management/features/auth/screens/sign_in_screen.dart';
import 'package:guest_management/utils/local_storage.dart';
import 'package:guest_management/utils/utils.dart';
import 'package:guest_management/widgets/loading_indicator.dart';

import '../../../utils/colors.dart';
import '../../../utils/navigation.dart';
import '../../guests/screens/guests_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) async {
      String? accessToken = prefs.getString(LocalStorage.accessToken);
      if (accessToken == null) {
        Navigation.go(
            screen: const SignInScreen(), context: context, replace: true);
      } else {
        Navigation.go(
            screen: const GuestsScreen(), context: context, replace: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              Column(children: [
                const Text(
                  'Guest Management',
                  style: TextStyle(
                    fontSize: 34,
                    color: kPrimaryColor,
                  ),
                )
              ]),
              const LoadingIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
