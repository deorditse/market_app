import 'dart:async';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_auth_event.dart';

part 'bloc_auth_bloc.freezed.dart';

part 'bloc_auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo = AuthRepo();

  AuthBloc() : super(const AuthState()) {
    on<SignInEvent>(_signInAuth);
    on<InitialAuthEvent>(_initialAuthEvent);
    on<AddBalanceAuthEvent>(_addBalanceAuthEvent);
  }

  Future<void> _signInAuth(SignInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState(isLoading: true));
    print("LoadingAuthState");

    final authResponse = await _authRepo.signInAuthData(
      userName: event.login,
      password: event.password,
    );

    if (authResponse?.keys.first == 200) {
      print("LoadedAuthState");
      emit(
        AuthState(
          isSignIn: true,
          userName: event.login,
          password: event.password,
          messageResponse: authResponse?.values.first,
        ),
      );
    } else {
      print("ErrorAuthState");
      emit(
        AuthState(
          messageError: authResponse?.values.first,
        ),
      );
    }
    //save in local storage secure
    await _authRepo.savePassAndLoginInLocalStorage(
      username: event.login,
      newPassword: event.password,
    );
  }

  Future<void> _initialAuthEvent(
      InitialAuthEvent event, Emitter<AuthState> emit) async {
    //initial from local storage secure

    Map<String, dynamic> mapLoginAndPass =
        await _authRepo.initialLoginAndPassword();

    print("mapLoginAndPass $mapLoginAndPass");
    if (mapLoginAndPass["userName"] != null ||
        mapLoginAndPass["password"] != null) {
      emit(
        AuthState(
          userName: mapLoginAndPass["userName"],
          password: mapLoginAndPass["password"],
        ),
      );
    }
  }

  FutureOr<void> _addBalanceAuthEvent(
      AddBalanceAuthEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        balance: event.newBalance,
      ),
    );
  }
}
