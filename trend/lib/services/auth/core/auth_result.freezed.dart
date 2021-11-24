// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthResultTearOff {
  const _$AuthResultTearOff();

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  None none() {
    return const None();
  }

// ignore: unused_element
  Autherized autherized() {
    return const Autherized();
  }

// ignore: unused_element
  Error error() {
    return const Error();
  }
}

// ignore: unused_element
const $AuthResult = _$AuthResultTearOff();

mixin _$AuthResult {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result none(),
    @required Result autherized(),
    @required Result error(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result none(),
    Result autherized(),
    Result error(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result none(None value),
    @required Result autherized(Autherized value),
    @required Result error(Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result none(None value),
    Result autherized(Autherized value),
    Result error(Error value),
    @required Result orElse(),
  });
}

abstract class $AuthResultCopyWith<$Res> {
  factory $AuthResultCopyWith(
          AuthResult value, $Res Function(AuthResult) then) =
      _$AuthResultCopyWithImpl<$Res>;
}

class _$AuthResultCopyWithImpl<$Res> implements $AuthResultCopyWith<$Res> {
  _$AuthResultCopyWithImpl(this._value, this._then);

  final AuthResult _value;
  // ignore: unused_field
  final $Res Function(AuthResult) _then;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$AuthResultCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'AuthResult.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result none(),
    @required Result autherized(),
    @required Result error(),
  }) {
    assert(loading != null);
    assert(none != null);
    assert(autherized != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result none(),
    Result autherized(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result none(None value),
    @required Result autherized(Autherized value),
    @required Result error(Error value),
  }) {
    assert(loading != null);
    assert(none != null);
    assert(autherized != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result none(None value),
    Result autherized(Autherized value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AuthResult {
  const factory Loading() = _$Loading;
}

abstract class $NoneCopyWith<$Res> {
  factory $NoneCopyWith(None value, $Res Function(None) then) =
      _$NoneCopyWithImpl<$Res>;
}

class _$NoneCopyWithImpl<$Res> extends _$AuthResultCopyWithImpl<$Res>
    implements $NoneCopyWith<$Res> {
  _$NoneCopyWithImpl(None _value, $Res Function(None) _then)
      : super(_value, (v) => _then(v as None));

  @override
  None get _value => super._value as None;
}

class _$None implements None {
  const _$None();

  @override
  String toString() {
    return 'AuthResult.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result none(),
    @required Result autherized(),
    @required Result error(),
  }) {
    assert(loading != null);
    assert(none != null);
    assert(autherized != null);
    assert(error != null);
    return none();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result none(),
    Result autherized(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result none(None value),
    @required Result autherized(Autherized value),
    @required Result error(Error value),
  }) {
    assert(loading != null);
    assert(none != null);
    assert(autherized != null);
    assert(error != null);
    return none(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result none(None value),
    Result autherized(Autherized value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class None implements AuthResult {
  const factory None() = _$None;
}

abstract class $AutherizedCopyWith<$Res> {
  factory $AutherizedCopyWith(
          Autherized value, $Res Function(Autherized) then) =
      _$AutherizedCopyWithImpl<$Res>;
}

class _$AutherizedCopyWithImpl<$Res> extends _$AuthResultCopyWithImpl<$Res>
    implements $AutherizedCopyWith<$Res> {
  _$AutherizedCopyWithImpl(Autherized _value, $Res Function(Autherized) _then)
      : super(_value, (v) => _then(v as Autherized));

  @override
  Autherized get _value => super._value as Autherized;
}

class _$Autherized implements Autherized {
  const _$Autherized();

  @override
  String toString() {
    return 'AuthResult.autherized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Autherized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result none(),
    @required Result autherized(),
    @required Result error(),
  }) {
    assert(loading != null);
    assert(none != null);
    assert(autherized != null);
    assert(error != null);
    return autherized();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result none(),
    Result autherized(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (autherized != null) {
      return autherized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result none(None value),
    @required Result autherized(Autherized value),
    @required Result error(Error value),
  }) {
    assert(loading != null);
    assert(none != null);
    assert(autherized != null);
    assert(error != null);
    return autherized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result none(None value),
    Result autherized(Autherized value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (autherized != null) {
      return autherized(this);
    }
    return orElse();
  }
}

abstract class Autherized implements AuthResult {
  const factory Autherized() = _$Autherized;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
}

class _$ErrorCopyWithImpl<$Res> extends _$AuthResultCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;
}

class _$Error implements Error {
  const _$Error();

  @override
  String toString() {
    return 'AuthResult.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result none(),
    @required Result autherized(),
    @required Result error(),
  }) {
    assert(loading != null);
    assert(none != null);
    assert(autherized != null);
    assert(error != null);
    return error();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result none(),
    Result autherized(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result none(None value),
    @required Result autherized(Autherized value),
    @required Result error(Error value),
  }) {
    assert(loading != null);
    assert(none != null);
    assert(autherized != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result none(None value),
    Result autherized(Autherized value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AuthResult {
  const factory Error() = _$Error;
}
