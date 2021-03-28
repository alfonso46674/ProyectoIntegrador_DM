import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:proyecto_integrador/auth/bloc/auth_bloc.dart';
import 'package:proyecto_integrador/ejercicios/busqueda_ejercicios.dart';
import 'package:proyecto_integrador/ejercicios/menu_ejercicios.dart';
import 'package:proyecto_integrador/login/login.dart';
import 'package:proyecto_integrador/register/register.dart';
import 'package:proyecto_integrador/rutinas/crear_rutina.dart';
import 'package:proyecto_integrador/rutinas/mis_rutinas.dart';
import 'package:proyecto_integrador/splash/splash.dart';
import 'package:proyecto_integrador/utils/constants.dart';
import 'package:proyecto_integrador/welcome/welcome.dart';

import 'ejercicios/details_ejercicios.dart';
import 'ejercicios/lista_ejercicios.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) => AuthBloc()..add(VerifyAuthenticationEvent()),
    child: MyApp(),
  ));
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if(state is AlreadyAuthState) return MenuEjercicios();
          if(state is UnAuthState) return Splash();
          return Splash();
        },
      ),
      // initialRoute: '/',
      
      routes: {
        // '/': (context) => Splash(),
        '/welcome': (context) => Welcome(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => MenuEjercicios(),
        '/listaEjercicios': (context) => ListaEjercicios(),
        '/detailsEjercicios': (context) => DetailsEjercicios(),
        '/busquedaEjercicios': (context) => BusquedaEjercicios(),
        '/misRutinas':(context) => MisRutinas(),
        '/crearRutina':(context) => CrearRutina(),
      },
    );
  }
}
