import 'package:flutter/material.dart';
import 'package:guest_management/features/auth/widgets/custom_text_field.dart';
import 'package:guest_management/utils/colors.dart';
import 'package:guest_management/utils/text.dart';
import 'package:guest_management/widgets/custom_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign In'.toUpperCase(),
                style: kTitleTextStyle.copyWith(fontSize: 25)),
            Text('Guest Management App'.toUpperCase(),
                style: kTitleTextStyle.copyWith(
                    fontSize: 20, color: kPrimaryColor)),
            CustomTextField(hint: 'Email'),
            CustomTextField(hint: 'Password'),
            CustomButton(btnText: 'Sign In', click: () {})
          ],
        ),
      ),
    );
  }
}
