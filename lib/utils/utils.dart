import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

import 'text.dart';

class Toast {
  static void showToast(
      {required String message, required BuildContext context}) {
    String errMessage = message.replaceAll('Exception:', '');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          errMessage,
          style: kBodyTextStyle.copyWith(color: Colors.white),
        ),
        showCloseIcon: true,
        duration: Duration(seconds: 6),
      ),
    );
  }
}

var logger = Logger(
  printer: PrettyPrinter(
    colors: true,
    printEmojis: true,
  ),
);
