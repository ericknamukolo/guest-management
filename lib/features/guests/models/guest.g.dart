// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      roomNumber: (json['roomNumber'] as num).toInt(),
      lengthOfStay: (json['lengthOfStay'] as num).toInt(),
    );

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'roomNumber': instance.roomNumber,
      'lengthOfStay': instance.lengthOfStay,
    };
