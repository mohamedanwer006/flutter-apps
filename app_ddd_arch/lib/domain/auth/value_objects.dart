import 'package:app_ddd_arch/domain/core/failuers.dart';
import 'package:app_ddd_arch/domain/core/value_objects.dart';
import 'package:app_ddd_arch/domain/core/value_validator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class EmailAdress extends ValueObject<String> {
  @override
  final Either<ValueFailuer<String>, String> value;

  factory EmailAdress(String input) {
    assert(input != null);
    return EmailAdress._(value: validateEmailAdress(input));
  }

  const EmailAdress._({
    @required this.value,
  });
}

@immutable
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailuer<String>, String> value;
  factory Password(String input) {
    assert(input != null);
    return Password._(value: validateEmailAdress(input));
  }

  const Password._({
    @required this.value,
  });
}
