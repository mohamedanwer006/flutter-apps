// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrentUser _$_$_CurrentUserFromJson(Map<String, dynamic> json) {
  return _$_CurrentUser(
    uid: json['uid'] as String,
    name: json['name'] as String,
    profilePicture: json['profilePicture'] as String,
    email: json['email'] as String,
    role: json['role'] as String,
  );
}

Map<String, dynamic> _$_$_CurrentUserToJson(_$_CurrentUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'email': instance.email,
      'role': instance.role,
    };
