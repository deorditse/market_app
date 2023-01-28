part of 'bloc_auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class InitialAuthEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final String login;
  final String password;

  SignInEvent({
    required this.password,
    required this.login,
  });
}

class AddBalanceAuthEvent extends AuthEvent {
  final String newBalance;

  AddBalanceAuthEvent({required this.newBalance});
}
