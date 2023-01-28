// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  String? get userName => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get balance => throw _privateConstructorUsedError;
  bool get isSignIn => throw _privateConstructorUsedError;
  String? get messageResponse => throw _privateConstructorUsedError;
  String? get messageError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {String? userName,
      String? password,
      bool isLoading,
      String balance,
      bool isSignIn,
      String? messageResponse,
      String? messageError});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? isLoading = null,
    Object? balance = null,
    Object? isSignIn = null,
    Object? messageResponse = freezed,
    Object? messageError = freezed,
  }) {
    return _then(_value.copyWith(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      isSignIn: null == isSignIn
          ? _value.isSignIn
          : isSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      messageResponse: freezed == messageResponse
          ? _value.messageResponse
          : messageResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      messageError: freezed == messageError
          ? _value.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userName,
      String? password,
      bool isLoading,
      String balance,
      bool isSignIn,
      String? messageResponse,
      String? messageError});
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? isLoading = null,
    Object? balance = null,
    Object? isSignIn = null,
    Object? messageResponse = freezed,
    Object? messageError = freezed,
  }) {
    return _then(_$_AuthState(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      isSignIn: null == isSignIn
          ? _value.isSignIn
          : isSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      messageResponse: freezed == messageResponse
          ? _value.messageResponse
          : messageResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      messageError: freezed == messageError
          ? _value.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {this.userName,
      this.password,
      this.isLoading = false,
      this.balance = "0.0",
      this.isSignIn = false,
      this.messageResponse,
      this.messageError});

  @override
  final String? userName;
  @override
  final String? password;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String balance;
  @override
  @JsonKey()
  final bool isSignIn;
  @override
  final String? messageResponse;
  @override
  final String? messageError;

  @override
  String toString() {
    return 'AuthState(userName: $userName, password: $password, isLoading: $isLoading, balance: $balance, isSignIn: $isSignIn, messageResponse: $messageResponse, messageError: $messageError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.isSignIn, isSignIn) ||
                other.isSignIn == isSignIn) &&
            (identical(other.messageResponse, messageResponse) ||
                other.messageResponse == messageResponse) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password, isLoading,
      balance, isSignIn, messageResponse, messageError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final String? userName,
      final String? password,
      final bool isLoading,
      final String balance,
      final bool isSignIn,
      final String? messageResponse,
      final String? messageError}) = _$_AuthState;

  @override
  String? get userName;
  @override
  String? get password;
  @override
  bool get isLoading;
  @override
  String get balance;
  @override
  bool get isSignIn;
  @override
  String? get messageResponse;
  @override
  String? get messageError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
