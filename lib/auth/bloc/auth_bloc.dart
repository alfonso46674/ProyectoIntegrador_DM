import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:proyecto_integrador/repositories/exerciseApiClient.dart';
import 'package:proyecto_integrador/repositories/exercise_repository.dart';
import 'package:http/http.dart' as http;
import '../user_auth_provider.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //auth provider
  UserAuthProvider _authProvider = UserAuthProvider();

  //exercise repository
  ExerciseRepository repositorioEjercicios = ExerciseRepository(
    exerciseApiClient: ExerciseApiClient(
      httpClient: http.Client(),
    ),
  );

  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is VerifyAuthenticationEvent) {
      if (_authProvider.isLogged()) {
        //REQUEST A APIS - Cargar los ejercicios desde que se intenta hacer verificacion en el main
        repositorioEjercicios.fetchExercises();
        Future.delayed(Duration(seconds: 3));

        //ACCESO A BD LOCALES
        //REVISAR ACCESO A INTERNET
        //Lo necesario para inicializar datos de la app

        yield AlreadyAuthState();
      } else
        yield UnAuthState();
    }

    if (event is SignOutAuthenticationEvent) {
      await _authProvider.signOut();

      yield UnAuthState();
    }
  }
}
