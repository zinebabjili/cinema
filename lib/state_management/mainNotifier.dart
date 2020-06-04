import 'package:cinema/models/city.dart';
import 'package:cinema/repository/repoCinema.dart';
import 'package:flutter/foundation.dart';

class CinemaNotifier with ChangeNotifier{

  RepoCinema _repoCinema = new RepoCinema();

  List<City> _citiesLoad = [];


  //load cities 
  Stream<List<City>> loadCities() async*{
    _repoCinema.getCity().then((onValue){
      _citiesLoad = onValue;
    });
    yield _citiesLoad;
    notifyListeners();
  }


}