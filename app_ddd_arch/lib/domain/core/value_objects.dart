import 'package:app_ddd_arch/domain/core/failuers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailuer<T>, T> get value;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value: $value';
}
