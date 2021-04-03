import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_integrador/models/exercise.dart';

class ExerciseApiClient {
  final _baseUrl = 'https://wger.de/api/v2';
  final http.Client httpClient;

  Box _appDataBox = Hive.box('AppData');

  ExerciseApiClient({@required this.httpClient}) : assert(httpClient != null);

  //Return all of the exercises in english and with a limit of 200 exercises
  Future<void> fetchExercises() async {
    final url = '$_baseUrl/exercise?language=2&limit=200';
    final response = await this.httpClient.get(Uri.parse(url));
    final List<dynamic> exerciseList = [];

    print('_appDataBox.length: ${_appDataBox.length}');
    if (response.statusCode != 200) {
      throw new Exception('Error getting exercises');
    }

    //if there is no data in the box, fill it 
    else if(_appDataBox.length == 0){

    //Save the exercises from the response into an array using the json format function from the Exercise model
    final json = jsonDecode(response.body);
    //print(json[keys])
    for (int i = 0; i < json['results'].length; i++) {
      exerciseList.add(Exercise.fromJson(json['results'][i]));
    }

    // await _appDataBox.clear();
  
    await _appDataBox.put('exercises', exerciseList);
    }

     }
}