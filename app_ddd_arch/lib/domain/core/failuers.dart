import 'package:freezed_annotation/freezed_annotation.dart';
part 'failuers.freezed.dart';

@freezed
abstract class ValueFailuer<T> with _$ValueFailuer<T> {
  const factory ValueFailuer.invalidEmail({@required T faildValue}) =
      InvalidEmail<T>;
  const factory ValueFailuer.shortPassword({@required T faildValue}) =
      ShortPassword<T>;
}
