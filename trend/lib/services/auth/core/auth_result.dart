import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_result.freezed.dart';

@freezed
abstract class AuthResult with _$AuthResult {
  const factory AuthResult.loading() = Loading;
  const factory AuthResult.none() = None;
  const factory AuthResult.autherized() = Autherized;
  const factory AuthResult.error() = Error;
}
