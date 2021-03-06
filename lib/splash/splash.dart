import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 3000),
        () => {Navigator.of(context).pushNamed('/welcome')});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/main/wellcomeBackground.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          //Espaciado
          SizedBox(
            height: 50.0,
            width: 400,
          ),
          //Imagen de cupping
          Image.asset(
            'assets/main/logo.png',
          ),
        ],
      ),
    ));
  }
}
