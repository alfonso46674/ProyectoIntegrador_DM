import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:proyecto_integrador/auth/user_auth_provider.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  //atuh provider
  UserAuthProvider _authProvider = UserAuthProvider();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    //logins auths
    if (event is VerifyLogInEvent) {
      try {
        if (_authProvider.isLogged()) {
          yield LoginSuccessState();
        } else {
          yield LoginInitial();
        }
      } catch (e) {
        print(e.toString());
        yield LoginInitial();
      }
    } else if (event is LoginWithGoogleEvent) {
      try {
        yield LoginLoadingState();
        await _authProvider.signInWithGoogle();
        yield LoginSuccessState();
      } catch (e) {
        print(e.toString());
        yield LoginErrorState(error: "Error al hacer login: ${e.toString()}");
      }
    }
  }
}
