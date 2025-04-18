import 'package:flutter/material.dart';
import 'package:guest_management/utils/colors.dart';

import '../../../utils/text.dart';
import '../models/guest.dart';

class GuestCard extends StatelessWidget {
  final Guest guest;
  const GuestCard({
    super.key,
    required this.guest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      // margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        spacing: 10,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor.withOpacity(.15),
            ),
            child: Icon(
              Icons.person_2_rounded,
              color: kPrimaryColor.withOpacity(.6),
              size: 20.0,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${guest.firstName} ${guest.lastName}',
                  style: kTitleTextStyle),
              Text('${guest.lengthOfStay} Day Stay',
                  style: kBodyTextStyle.copyWith(fontWeight: FontWeight.w500)),
            ],
          ),
          const Spacer(),
          FittedBox(
            child: Text('Room ${guest.roomNumber}'.toUpperCase(),
                style: kBodyTitleTextStyle.copyWith(
                    fontWeight: FontWeight.bold, color: kGreyColor)),
          ),
        ],
      ),
    );
  }
}
