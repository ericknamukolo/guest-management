import 'package:flutter/material.dart';
import 'package:guest_management/features/auth/providers/auth.dart';
import 'package:guest_management/features/guests/providers/guests.dart';
import 'package:guest_management/features/guests/widgets/guest_card.dart';
import 'package:guest_management/utils/colors.dart';
import 'package:guest_management/utils/text.dart';
import 'package:guest_management/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class GuestsScreen extends StatefulWidget {
  const GuestsScreen({super.key});

  @override
  State<GuestsScreen> createState() => _GuestsScreenState();
}

class _GuestsScreenState extends State<GuestsScreen> {
  bool isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      getGuests();
    });
    super.initState();
  }

  Future<void> getGuests() async {
    setState(() => isLoading = true);
    context
        .read<Guests>()
        .getGuests(context: context)
        .then((_) => setState(() => isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guests', style: kTitleTextStyle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TextButton(
                onPressed: () => Auth.logOut(context),
                child: Text('Logout',
                    style: kBodyTitleTextStyle.copyWith(color: kPrimaryColor))),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: isLoading
            ? LoadingIndicator()
            : Consumer<Guests>(builder: (_, val, __) {
                return val.guests.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 15,
                          children: [
                            Text('Failed to fetch guests',
                                style: kBodyTitleTextStyle.copyWith(
                                    color: kGreyColor)),
                            TextButton(
                                onPressed: getGuests,
                                child: Text('Retry',
                                    style: kBodyTitleTextStyle.copyWith(
                                        color: kPrimaryColor)))
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: getGuests,
                        child: ListView.separated(
                          separatorBuilder: (_, __) => SizedBox(height: 15),
                          itemBuilder: (_, i) {
                            return GuestCard(guest: val.guests[i]);
                          },
                          itemCount: val.guests.length,
                          shrinkWrap: true,
                        ),
                      );
              }),
      ),
    );
  }
}
