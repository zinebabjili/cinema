import 'package:cinema/ui/city.dart';
// import 'package:cinema/ui/movieListIteams.dart';
import 'package:flutter/material.dart';

// ignore: missing_return
Route<dynamic> generateRoute (RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => CityPage());
      // return MaterialPageRoute(builder: (context) => MovieListIteams());
  }
}