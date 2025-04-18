import 'package:flutter/material.dart';

import 'features/auth/screens/sign_in_screen.dart';

void main() {
  runApp(const GuestApp());
}

class GuestApp extends StatelessWidget {
  const GuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffF5F5F5),
      ),
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
