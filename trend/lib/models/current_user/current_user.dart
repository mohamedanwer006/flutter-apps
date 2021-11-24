import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user.freezed.dart';
part 'current_user.g.dart';

@freezed
abstract class CurrentUser with _$CurrentUser {
  factory CurrentUser({
    String uid,
    String name,
    String profilePicture,
    String email,
    String role,
  }) = _CurrentUser;

  factory CurrentUser.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserFromJson(json);
}
