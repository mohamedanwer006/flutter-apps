import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
abstract class Chat with _$Chat {
  factory Chat({
    String cid,
    List<MessageDetails> messageDetails,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

@freezed
abstract class MessageDetails with _$MessageDetails {
  factory MessageDetails({
    String id,
    String message,
    DateTime dateTime,
    String senderID,
    String type,
    bool seen,
  }) = _MessageDetails;

  factory MessageDetails.fromJson(Map<String, dynamic> json) =>
      _$MessageDetailsFromJson(json);
}
