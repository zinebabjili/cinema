import 'package:cinema/ui/casacinema.dart';
import 'package:cinema/ui/city.dart';
import 'package:cinema/ui/movieDesc.dart';
import 'package:flutter/material.dart';

// ignore: missing_return
Route<dynamic> generateRoute (RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => MovieDescription());
    case 'casa':
      return MaterialPageRoute(builder: (context) => Casa());
  }
}