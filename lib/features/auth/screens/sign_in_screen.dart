import 'package:flutter/material.dart';
import 'package:guest_management/features/auth/providers/auth.dart';
import 'package:guest_management/features/auth/widgets/custom_text_field.dart';
import 'package:guest_management/utils/colors.dart';
import 'package:guest_management/utils/text.dart';
import 'package:guest_management/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  bool isAutoValidate = false;
  bool isHidden = true;
  bool isLoading = false;

  bool isValidEmail(String email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          autovalidateMode: isAutoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign In'.toUpperCase(),
                  style: kTitleTextStyle.copyWith(fontSize: 25)),
              Text('Guest Management App'.toUpperCase(),
                  style: kTitleTextStyle.copyWith(
                      fontSize: 20, color: kPrimaryColor)),
              CustomTextField(
                hint: 'Email',
                data: email,
                preIcon: Icons.email_rounded,
                type: TextInputType.emailAddress,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'This field is required';
                  } else if (!isValidEmail(val)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              CustomTextField(
                hint: 'Password',
                data: pwd,
                preIcon: Icons.lock_rounded,
                type: TextInputType.visiblePassword,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'This field is required';
                  } else if (val.length < 4) {
                    return 'Password should be 4 or more characters';
                  }
                  return null;
                },
                obs: isHidden,
                suffIcon: IconButton(
                  onPressed: () {
                    setState(() => isHidden = !isHidden);
                  },
                  icon: Icon(
                    isHidden
                        ? Icons.remove_red_eye_rounded
                        : Icons.remove_red_eye_outlined,
                    color: kGreyColor,
                  ),
                ),
              ),
              CustomButton(
                btnText: 'Sign In',
                isLoading: isLoading,
                click: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  bool isValid = formKey.currentState!.validate();
                  if (isValid) {
                    setState(() => isLoading = true);
                    await context
                        .read<Auth>()
                        .signIn(
                          email: email.text.trim(),
                          password: pwd.text.trim(),
                          context: context,
                        )
                        .then((_) => setState(() => isLoading = false));
                  } else {
                    setState(() => isAutoValidate = true);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
