// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'failuers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ValueFailuerTearOff {
  const _$ValueFailuerTearOff();

// ignore: unused_element
  InvalidEmail<T> invalidEmail<T>({@required T faildValue}) {
    return InvalidEmail<T>(
      faildValue: faildValue,
    );
  }

// ignore: unused_element
  ShortPassword<T> shortPassword<T>({@required T faildValue}) {
    return ShortPassword<T>(
      faildValue: faildValue,
    );
  }
}

// ignore: unused_element
const $ValueFailuer = _$ValueFailuerTearOff();

mixin _$ValueFailuer<T> {
  T get faildValue;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(T faildValue),
    @required Result shortPassword(T faildValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(T faildValue),
    Result shortPassword(T faildValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    @required Result orElse(),
  });

  $ValueFailuerCopyWith<T, ValueFailuer<T>> get copyWith;
}

abstract class $ValueFailuerCopyWith<T, $Res> {
  factory $ValueFailuerCopyWith(
          ValueFailuer<T> value, $Res Function(ValueFailuer<T>) then) =
      _$ValueFailuerCopyWithImpl<T, $Res>;
  $Res call({T faildValue});
}

class _$ValueFailuerCopyWithImpl<T, $Res>
    implements $ValueFailuerCopyWith<T, $Res> {
  _$ValueFailuerCopyWithImpl(this._value, this._then);

  final ValueFailuer<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailuer<T>) _then;

  @override
  $Res call({
    Object faildValue = freezed,
  }) {
    return _then(_value.copyWith(
      faildValue: faildValue == freezed ? _value.faildValue : faildValue as T,
    ));
  }
}

abstract class $InvalidEmailCopyWith<T, $Res>
    implements $ValueFailuerCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail<T> value, $Res Function(InvalidEmail<T>) then) =
      _$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({T faildValue});
}

class _$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailuerCopyWithImpl<T, $Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail<T> _value, $Res Function(InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmail<T>));

  @override
  InvalidEmail<T> get _value => super._value as InvalidEmail<T>;

  @override
  $Res call({
    Object faildValue = freezed,
  }) {
    return _then(InvalidEmail<T>(
      faildValue: faildValue == freezed ? _value.faildValue : faildValue as T,
    ));
  }
}

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({@required this.faildValue})
      : assert(faildValue != null);

  @override
  final T faildValue;

  @override
  String toString() {
    return 'ValueFailuer<$T>.invalidEmail(faildValue: $faildValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail<T> &&
            (identical(other.faildValue, faildValue) ||
                const DeepCollectionEquality()
                    .equals(other.faildValue, faildValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(faildValue);

  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(T faildValue),
    @required Result shortPassword(T faildValue),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return invalidEmail(faildValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(T faildValue),
    Result shortPassword(T faildValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(faildValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailuer<T> {
  const factory InvalidEmail({@required T faildValue}) = _$InvalidEmail<T>;

  @override
  T get faildValue;
  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith;
}

abstract class $ShortPasswordCopyWith<T, $Res>
    implements $ValueFailuerCopyWith<T, $Res> {
  factory $ShortPasswordCopyWith(
          ShortPassword<T> value, $Res Function(ShortPassword<T>) then) =
      _$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  $Res call({T faildValue});
}

class _$ShortPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailuerCopyWithImpl<T, $Res>
    implements $ShortPasswordCopyWith<T, $Res> {
  _$ShortPasswordCopyWithImpl(
      ShortPassword<T> _value, $Res Function(ShortPassword<T>) _then)
      : super(_value, (v) => _then(v as ShortPassword<T>));

  @override
  ShortPassword<T> get _value => super._value as ShortPassword<T>;

  @override
  $Res call({
    Object faildValue = freezed,
  }) {
    return _then(ShortPassword<T>(
      faildValue: faildValue == freezed ? _value.faildValue : faildValue as T,
    ));
  }
}

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({@required this.faildValue})
      : assert(faildValue != null);

  @override
  final T faildValue;

  @override
  String toString() {
    return 'ValueFailuer<$T>.shortPassword(faildValue: $faildValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShortPassword<T> &&
            (identical(other.faildValue, faildValue) ||
                const DeepCollectionEquality()
                    .equals(other.faildValue, faildValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(faildValue);

  @override
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith =>
      _$ShortPasswordCopyWithImpl<T, ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(T faildValue),
    @required Result shortPassword(T faildValue),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return shortPassword(faildValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(T faildValue),
    Result shortPassword(T faildValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(faildValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
  }) {
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailuer<T> {
  const factory ShortPassword({@required T faildValue}) = _$ShortPassword<T>;

  @override
  T get faildValue;
  @override
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith;
}
