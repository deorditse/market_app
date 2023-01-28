part of 'bloc_auth_bloc.dart';

/// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    String? userName,
    String? password,
    @Default(false) bool isLoading,
    @Default("0.0") String balance,
    @Default(false) bool isSignIn,
    String? messageResponse,
    String? messageError,
  }) = _AuthState;
}
