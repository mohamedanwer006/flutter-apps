import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failuers.freezed.dart';

@freezed
abstract class AuthFailuers with _$AuthFailuers {
  const factory AuthFailuers.cancelledByUser() = CancelledByUser;
  const factory AuthFailuers.serverError() = ServerError;
  const factory AuthFailuers.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailuers.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}
