import 'package:flutter/material.dart';

import '../../../utils/endpoints.dart';
import '../../../utils/local_storage.dart';
import '../../../utils/requests.dart';
import '../../../utils/utils.dart';
import '../models/guest.dart';

class Guests with ChangeNotifier {
  List<Guest> guests = [];
  Future<void> getGuests({required BuildContext context}) async {
    try {
      logger.i(prefs.getString(LocalStorage.accessToken));
      final res = await Requests.get(url: Endpoints.guests);
      guests = Guest.toList(res!['data']);
    } catch (e) {
      Toast.showToast(message: e.toString(), context: context);
    }
    notifyListeners();
  }
}
