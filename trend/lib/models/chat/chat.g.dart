// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$_$_ChatFromJson(Map<String, dynamic> json) {
  return _$_Chat(
    cid: json['cid'] as String,
    messageDetails: (json['messageDetails'] as List)
        ?.map((e) => e == null
            ? null
            : MessageDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'cid': instance.cid,
      'messageDetails': instance.messageDetails,
    };

_$_MessageDetails _$_$_MessageDetailsFromJson(Map<String, dynamic> json) {
  return _$_MessageDetails(
    id: json['id'] as String,
    message: json['message'] as String,
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    senderID: json['senderID'] as String,
    type: json['type'] as String,
    seen: json['seen'] as bool,
  );
}

Map<String, dynamic> _$_$_MessageDetailsToJson(_$_MessageDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'dateTime': instance.dateTime?.toIso8601String(),
      'senderID': instance.senderID,
      'type': instance.type,
      'seen': instance.seen,
    };
