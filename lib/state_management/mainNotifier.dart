import 'package:cinema/models/cinema.dart';
import 'package:cinema/models/city.dart';
import 'package:cinema/models/creneau.dart';
import 'package:cinema/models/film.dart';
import 'package:cinema/models/salle.dart';
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
    cinemasLoad =null;
    _repoCinema.getMoviesDetails(currentCityId,idFilm).then((onValue){
      cinemasLoad = onValue;
    });
    notifyListeners();
    // print(_cinemasLoad);
  }

  void setSalleSelected(int idCinema, Salle currenSalle){
    for (var i = 0; i < currenSalle.creneaux.length; i++) {
      currenSalle.creneaux[i].isSelected = false;
    }
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

  void reSetValue(){
    _moviesLoad = [];
    cinemasLoad = [];
    labelSearch = "";
    currentCityId= null;
  }

  void setSeancesToCurrentSalle(Salle currentSalle, int idFilm)  {
    print(currentSalle.name);
    List<Creneau> creneaux = new List<Creneau>();
    _repoCinema.getSeancesByFilmAndSalle(currentSalle.id, idFilm).then((value)  {
      for(var i = 0; i < value.length ; i++){
        creneaux.add(value[i]);
        print(creneaux[i].idProjection);

      }
      print("-----------------");
      currentSalle.creneaux = creneaux;
      for(var h = 0 ; h < currentSalle.creneaux.length; h++){
        print(currentSalle.creneaux[h].idProjection);
      }
    });
    // print("HH");
    // notifyListeners();
    // return currentSalle;
    
  }

  void setCurrentCreneau(int idProj, int index){
    cinemasLoad[index].selectedSalle.creneaux.forEach((element) {
      if(element.idProjection == idProj){
        element.isSelected = true;
      }
      else{
        element.isSelected = false;
      }
    });
  }
}