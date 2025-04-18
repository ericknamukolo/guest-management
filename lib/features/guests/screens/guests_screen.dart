import 'package:flutter/material.dart';
import 'package:guest_management/utils/colors.dart';
import 'package:guest_management/utils/text.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guets', style: kTitleTextStyle),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: TextButton(
            onPressed: () {},
            child: Text('Refresh',
                style: kBodyTitleTextStyle.copyWith(color: kPrimaryColor))),
      ),
    );
  }
}
