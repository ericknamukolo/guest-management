import 'package:json_annotation/json_annotation.dart';
part 'guest.g.dart';

@JsonSerializable()
class Guest {
  String firstName;
  String lastName;
  int roomNumber;
  int lengthOfStay;

  Guest({
    required this.firstName,
    required this.lastName,
    required this.roomNumber,
    required this.lengthOfStay,
  });

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
  Map<String, dynamic> toJson() => _$GuestToJson(this);

  static List<Guest> toList(List<dynamic> list) {
    List<Guest> loadedGuests = [];
    for (var element in list) {
      Guest guest = Guest.fromJson(element as Map<String, dynamic>);

      loadedGuests.add(guest);
    }
    return loadedGuests;
  }
}
