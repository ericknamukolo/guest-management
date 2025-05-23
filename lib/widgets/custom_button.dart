import 'package:flutter/material.dart';
import 'package:guest_management/utils/text.dart';

import '../utils/colors.dart';
import 'loading_indicator.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final Color btnColor;
  const CustomButton({
    super.key,
    required this.btnText,
    required this.click,
    this.btnColor = kPrimaryColor,
    this.isLoading = false,
  });

  final String btnText;
  final Function() click;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : click,
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: Size.fromHeight(55),
        backgroundColor: btnColor,
      ),
      child: isLoading
          ? LoadingIndicator(spinnerColor: Colors.white.withOpacity(.5))
          : Text(
              btnText,
              style: kBodyTitleTextStyle.copyWith(color: Colors.white),
            ),
    );
  }
}
