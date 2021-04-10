import 'package:flutter/material.dart';
import 'package:proyecto_integrador/utils/constants.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/main/logo.png',
                  // width: 300,
                ),
                SizedBox(height: 16.0),
              ],
            ),
            SizedBox(height: 20.0),

            //INPUTS PARA USUARIO Y CONTRASEÑA
            //Username
            Text(
              'Full name :',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: TextStyle(height: 0.5),
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'Full name',
                  fillColor: Colors.transparent),
            ),
            //Espaciado
            SizedBox(height: 12.0),

            SizedBox(
              height: 20,
            ),
            //Password
            Text(
              'Password',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: TextStyle(color: Colors.white, height: 0.5),
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
                ),
              ),
              obscureText: true,
            ),

            SizedBox(
              height: 40,
            ),
            // Añadir los botones de cancelar y siguiente
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: BLUE_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/mainMenu');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
