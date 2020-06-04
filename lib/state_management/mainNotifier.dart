import 'package:cinema/models/city.dart';
import 'package:cinema/models/film.dart';
import 'package:cinema/repository/repoCinema.dart';
import 'package:flutter/foundation.dart';

class CinemaNotifier with ChangeNotifier{

  RepoCinema _repoCinema = new RepoCinema();

  List<City> _citiesLoad = [];
  List<Film> _moviesLoad = [];


  //load cities 
  Stream<List<City>> loadCities() async*{
    _repoCinema.getCity().then((onValue){
      _citiesLoad = onValue;
    });
    yield _citiesLoad;
    notifyListeners();
  }

  Stream<List<Film>> loadMovies(id) async*{
    _repoCinema.getMovies(id).then((onValue){
      _moviesLoad = onValue;
    });
    yield _moviesLoad;
    notifyListeners();
  }


}