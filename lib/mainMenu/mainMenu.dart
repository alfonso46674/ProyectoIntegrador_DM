import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/exercises/menu_exercises.dart';
import 'package:proyecto_integrador/workouts/add_workout/bloc/addworkout_bloc.dart';
import 'package:proyecto_integrador/workouts/menu_workouts/bloc/menuworkout_bloc.dart';
import 'package:proyecto_integrador/workouts/menu_workouts/menu_workouts.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentPageIndex = 0;
  final _pagesList = [
    MenuExercises(),
    MenuWorkouts(),
  ];

  @override
  Widget build(BuildContext context) {
    //declare these bloc here so it accesing it from below can be easier
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MenuWorkoutBloc()..add(MenuWorkoutRequestWorkouts()),
        ),
        BlocProvider(
          create: (context) => AddworkoutBloc(),
        ),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _currentPageIndex,
          children: _pagesList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center), label: "Exercises"),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_list), label: "Workouts")
          ],
        ),
      ),
    );
  }
}
