import 'package:flutter/material.dart';

import '../../../utils/endpoints.dart';
import '../../../utils/requests.dart';
import '../../../utils/utils.dart';

class Guests with ChangeNotifier {
  Future<void> getGuests({required BuildContext context}) async {
    try {
      final res = await Requests.get(url: Endpoints.guests);
      logger.i(res);
    } catch (e) {
      Toast.showToast(message: e.toString(), context: context);
    }
  }
}
