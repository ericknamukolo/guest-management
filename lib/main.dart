import 'package:flutter/material.dart';
import 'package:guest_management/features/auth/providers/auth.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/sign_in_screen.dart';

void main() {
  runApp(const GuestApp());
}

class GuestApp extends StatelessWidget {
  const GuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffF5F5F5),
        ),
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}
