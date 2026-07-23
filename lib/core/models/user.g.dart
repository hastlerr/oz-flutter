// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  token: json['token'] as String?,
  phone: json['phone'] as String,
  name: json['name'] as String,
  contactNumber: json['contact_number'] as String?,
  avatar: json['avatar'] as String?,
  isActive: json['is_active'] as bool,
  isStaff: json['is_staff'] as bool,
  dateJoined: json['date_joined'] == null
      ? null
      : DateTime.parse(json['date_joined'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'token': instance.token,
  'phone': instance.phone,
  'name': instance.name,
  'contact_number': instance.contactNumber,
  'avatar': instance.avatar,
  'is_active': instance.isActive,
  'is_staff': instance.isStaff,
  'date_joined': instance.dateJoined?.toIso8601String(),
};
