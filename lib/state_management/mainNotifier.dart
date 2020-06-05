import 'package:cinema/models/cinema.dart';
import 'package:cinema/models/city.dart';
import 'package:cinema/models/film.dart';
import 'package:cinema/repository/repoCinema.dart';
import 'package:flutter/foundation.dart';

class CinemaNotifier with ChangeNotifier{

  RepoCinema _repoCinema = new RepoCinema();

  List<City> _citiesLoad = [];
  List<Film> _moviesLoad = [];
  List<Cinema> cinemasLoad = [];
  String labelSearch = "";
  int  currentCityId  ;
  // bool salleIsSelected = false;
  List<String> salleSelect;



  //load cities 
  Stream<List<City>> loadCities() async*{
    _repoCinema.getCity().then((onValue){
      _citiesLoad = onValue;
    });
    yield _citiesLoad;
    notifyListeners();
  }

  Stream<List<Film>> loadMovies(id) async*{
    currentCityId = id;
    _repoCinema.getMovies(id,this.labelSearch).then((onValue){
      _moviesLoad = onValue;
    });
    yield _moviesLoad;
    notifyListeners();
  }

  void setNewFilmsSearch(id,label){
    currentCityId = id;
    this.labelSearch = label;
    this.loadMovies(id);
    notifyListeners();
  }


  void loadMoviesDetails(idFilm) {

    _repoCinema.getMoviesDetails(currentCityId,idFilm).then((onValue){
      cinemasLoad = onValue;
    });
    notifyListeners();
    // print(_cinemasLoad);
  }

  void setSalleSelected(int idCinema, currenSalle){

    for(var i = 0;  i < cinemasLoad.length ; i++){
      if(cinemasLoad[i].id == idCinema){
        this.cinemasLoad[i].selectedSalle = currenSalle;
      }

    }
    
    notifyListeners();
  }

  String getSalleSelectedName(int idCinema){
    for(var i = 0;  i < cinemasLoad.length ; i++){
      if(cinemasLoad[i].id == idCinema){
        return this.cinemasLoad[i].selectedSalle.name ;
      }
    }
    notifyListeners();
    return "Achik";
    
  }

}