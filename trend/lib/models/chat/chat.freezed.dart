// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

class _$ChatTearOff {
  const _$ChatTearOff();

// ignore: unused_element
  _Chat call({String cid, List<MessageDetails> messageDetails}) {
    return _Chat(
      cid: cid,
      messageDetails: messageDetails,
    );
  }
}

// ignore: unused_element
const $Chat = _$ChatTearOff();

mixin _$Chat {
  String get cid;
  List<MessageDetails> get messageDetails;

  Map<String, dynamic> toJson();
  $ChatCopyWith<Chat> get copyWith;
}

abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res>;
  $Res call({String cid, List<MessageDetails> messageDetails});
}

class _$ChatCopyWithImpl<$Res> implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  final Chat _value;
  // ignore: unused_field
  final $Res Function(Chat) _then;

  @override
  $Res call({
    Object cid = freezed,
    Object messageDetails = freezed,
  }) {
    return _then(_value.copyWith(
      cid: cid == freezed ? _value.cid : cid as String,
      messageDetails: messageDetails == freezed
          ? _value.messageDetails
          : messageDetails as List<MessageDetails>,
    ));
  }
}

abstract class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) then) =
      __$ChatCopyWithImpl<$Res>;
  @override
  $Res call({String cid, List<MessageDetails> messageDetails});
}

class __$ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res>
    implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(_Chat _value, $Res Function(_Chat) _then)
      : super(_value, (v) => _then(v as _Chat));

  @override
  _Chat get _value => super._value as _Chat;

  @override
  $Res call({
    Object cid = freezed,
    Object messageDetails = freezed,
  }) {
    return _then(_Chat(
      cid: cid == freezed ? _value.cid : cid as String,
      messageDetails: messageDetails == freezed
          ? _value.messageDetails
          : messageDetails as List<MessageDetails>,
    ));
  }
}

@JsonSerializable()
class _$_Chat implements _Chat {
  _$_Chat({this.cid, this.messageDetails});

  factory _$_Chat.fromJson(Map<String, dynamic> json) =>
      _$_$_ChatFromJson(json);

  @override
  final String cid;
  @override
  final List<MessageDetails> messageDetails;

  @override
  String toString() {
    return 'Chat(cid: $cid, messageDetails: $messageDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Chat &&
            (identical(other.cid, cid) ||
                const DeepCollectionEquality().equals(other.cid, cid)) &&
            (identical(other.messageDetails, messageDetails) ||
                const DeepCollectionEquality()
                    .equals(other.messageDetails, messageDetails)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cid) ^
      const DeepCollectionEquality().hash(messageDetails);

  @override
  _$ChatCopyWith<_Chat> get copyWith =>
      __$ChatCopyWithImpl<_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChatToJson(this);
  }
}

abstract class _Chat implements Chat {
  factory _Chat({String cid, List<MessageDetails> messageDetails}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String get cid;
  @override
  List<MessageDetails> get messageDetails;
  @override
  _$ChatCopyWith<_Chat> get copyWith;
}

MessageDetails _$MessageDetailsFromJson(Map<String, dynamic> json) {
  return _MessageDetails.fromJson(json);
}

class _$MessageDetailsTearOff {
  const _$MessageDetailsTearOff();

// ignore: unused_element
  _MessageDetails call(
      {String id,
      String message,
      DateTime dateTime,
      String senderID,
      String type,
      bool seen}) {
    return _MessageDetails(
      id: id,
      message: message,
      dateTime: dateTime,
      senderID: senderID,
      type: type,
      seen: seen,
    );
  }
}

// ignore: unused_element
const $MessageDetails = _$MessageDetailsTearOff();

mixin _$MessageDetails {
  String get id;
  String get message;
  DateTime get dateTime;
  String get senderID;
  String get type;
  bool get seen;

  Map<String, dynamic> toJson();
  $MessageDetailsCopyWith<MessageDetails> get copyWith;
}

abstract class $MessageDetailsCopyWith<$Res> {
  factory $MessageDetailsCopyWith(
          MessageDetails value, $Res Function(MessageDetails) then) =
      _$MessageDetailsCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String message,
      DateTime dateTime,
      String senderID,
      String type,
      bool seen});
}

class _$MessageDetailsCopyWithImpl<$Res>
    implements $MessageDetailsCopyWith<$Res> {
  _$MessageDetailsCopyWithImpl(this._value, this._then);

  final MessageDetails _value;
  // ignore: unused_field
  final $Res Function(MessageDetails) _then;

  @override
  $Res call({
    Object id = freezed,
    Object message = freezed,
    Object dateTime = freezed,
    Object senderID = freezed,
    Object type = freezed,
    Object seen = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      message: message == freezed ? _value.message : message as String,
      dateTime: dateTime == freezed ? _value.dateTime : dateTime as DateTime,
      senderID: senderID == freezed ? _value.senderID : senderID as String,
      type: type == freezed ? _value.type : type as String,
      seen: seen == freezed ? _value.seen : seen as bool,
    ));
  }
}

abstract class _$MessageDetailsCopyWith<$Res>
    implements $MessageDetailsCopyWith<$Res> {
  factory _$MessageDetailsCopyWith(
          _MessageDetails value, $Res Function(_MessageDetails) then) =
      __$MessageDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String message,
      DateTime dateTime,
      String senderID,
      String type,
      bool seen});
}

class __$MessageDetailsCopyWithImpl<$Res>
    extends _$MessageDetailsCopyWithImpl<$Res>
    implements _$MessageDetailsCopyWith<$Res> {
  __$MessageDetailsCopyWithImpl(
      _MessageDetails _value, $Res Function(_MessageDetails) _then)
      : super(_value, (v) => _then(v as _MessageDetails));

  @override
  _MessageDetails get _value => super._value as _MessageDetails;

  @override
  $Res call({
    Object id = freezed,
    Object message = freezed,
    Object dateTime = freezed,
    Object senderID = freezed,
    Object type = freezed,
    Object seen = freezed,
  }) {
    return _then(_MessageDetails(
      id: id == freezed ? _value.id : id as String,
      message: message == freezed ? _value.message : message as String,
      dateTime: dateTime == freezed ? _value.dateTime : dateTime as DateTime,
      senderID: senderID == freezed ? _value.senderID : senderID as String,
      type: type == freezed ? _value.type : type as String,
      seen: seen == freezed ? _value.seen : seen as bool,
    ));
  }
}

@JsonSerializable()
class _$_MessageDetails implements _MessageDetails {
  _$_MessageDetails(
      {this.id,
      this.message,
      this.dateTime,
      this.senderID,
      this.type,
      this.seen});

  factory _$_MessageDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageDetailsFromJson(json);

  @override
  final String id;
  @override
  final String message;
  @override
  final DateTime dateTime;
  @override
  final String senderID;
  @override
  final String type;
  @override
  final bool seen;

  @override
  String toString() {
    return 'MessageDetails(id: $id, message: $message, dateTime: $dateTime, senderID: $senderID, type: $type, seen: $seen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessageDetails &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.senderID, senderID) ||
                const DeepCollectionEquality()
                    .equals(other.senderID, senderID)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.seen, seen) ||
                const DeepCollectionEquality().equals(other.seen, seen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(senderID) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(seen);

  @override
  _$MessageDetailsCopyWith<_MessageDetails> get copyWith =>
      __$MessageDetailsCopyWithImpl<_MessageDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageDetailsToJson(this);
  }
}

abstract class _MessageDetails implements MessageDetails {
  factory _MessageDetails(
      {String id,
      String message,
      DateTime dateTime,
      String senderID,
      String type,
      bool seen}) = _$_MessageDetails;

  factory _MessageDetails.fromJson(Map<String, dynamic> json) =
      _$_MessageDetails.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  DateTime get dateTime;
  @override
  String get senderID;
  @override
  String get type;
  @override
  bool get seen;
  @override
  _$MessageDetailsCopyWith<_MessageDetails> get copyWith;
}
