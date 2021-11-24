// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'current_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CurrentUser _$CurrentUserFromJson(Map<String, dynamic> json) {
  return _CurrentUser.fromJson(json);
}

class _$CurrentUserTearOff {
  const _$CurrentUserTearOff();

// ignore: unused_element
  _CurrentUser call(
      {String uid,
      String name,
      String profilePicture,
      String email,
      String role}) {
    return _CurrentUser(
      uid: uid,
      name: name,
      profilePicture: profilePicture,
      email: email,
      role: role,
    );
  }
}

// ignore: unused_element
const $CurrentUser = _$CurrentUserTearOff();

mixin _$CurrentUser {
  String get uid;
  String get name;
  String get profilePicture;
  String get email;
  String get role;

  Map<String, dynamic> toJson();
  $CurrentUserCopyWith<CurrentUser> get copyWith;
}

abstract class $CurrentUserCopyWith<$Res> {
  factory $CurrentUserCopyWith(
          CurrentUser value, $Res Function(CurrentUser) then) =
      _$CurrentUserCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      String profilePicture,
      String email,
      String role});
}

class _$CurrentUserCopyWithImpl<$Res> implements $CurrentUserCopyWith<$Res> {
  _$CurrentUserCopyWithImpl(this._value, this._then);

  final CurrentUser _value;
  // ignore: unused_field
  final $Res Function(CurrentUser) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object name = freezed,
    Object profilePicture = freezed,
    Object email = freezed,
    Object role = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
      name: name == freezed ? _value.name : name as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture as String,
      email: email == freezed ? _value.email : email as String,
      role: role == freezed ? _value.role : role as String,
    ));
  }
}

abstract class _$CurrentUserCopyWith<$Res>
    implements $CurrentUserCopyWith<$Res> {
  factory _$CurrentUserCopyWith(
          _CurrentUser value, $Res Function(_CurrentUser) then) =
      __$CurrentUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      String profilePicture,
      String email,
      String role});
}

class __$CurrentUserCopyWithImpl<$Res> extends _$CurrentUserCopyWithImpl<$Res>
    implements _$CurrentUserCopyWith<$Res> {
  __$CurrentUserCopyWithImpl(
      _CurrentUser _value, $Res Function(_CurrentUser) _then)
      : super(_value, (v) => _then(v as _CurrentUser));

  @override
  _CurrentUser get _value => super._value as _CurrentUser;

  @override
  $Res call({
    Object uid = freezed,
    Object name = freezed,
    Object profilePicture = freezed,
    Object email = freezed,
    Object role = freezed,
  }) {
    return _then(_CurrentUser(
      uid: uid == freezed ? _value.uid : uid as String,
      name: name == freezed ? _value.name : name as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture as String,
      email: email == freezed ? _value.email : email as String,
      role: role == freezed ? _value.role : role as String,
    ));
  }
}

@JsonSerializable()
class _$_CurrentUser implements _CurrentUser {
  _$_CurrentUser(
      {this.uid, this.name, this.profilePicture, this.email, this.role});

  factory _$_CurrentUser.fromJson(Map<String, dynamic> json) =>
      _$_$_CurrentUserFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String profilePicture;
  @override
  final String email;
  @override
  final String role;

  @override
  String toString() {
    return 'CurrentUser(uid: $uid, name: $name, profilePicture: $profilePicture, email: $email, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CurrentUser &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(role);

  @override
  _$CurrentUserCopyWith<_CurrentUser> get copyWith =>
      __$CurrentUserCopyWithImpl<_CurrentUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CurrentUserToJson(this);
  }
}

abstract class _CurrentUser implements CurrentUser {
  factory _CurrentUser(
      {String uid,
      String name,
      String profilePicture,
      String email,
      String role}) = _$_CurrentUser;

  factory _CurrentUser.fromJson(Map<String, dynamic> json) =
      _$_CurrentUser.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get profilePicture;
  @override
  String get email;
  @override
  String get role;
  @override
  _$CurrentUserCopyWith<_CurrentUser> get copyWith;
}
