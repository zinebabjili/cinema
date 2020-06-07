import 'package:cinema/models/cinema.dart';
import 'package:cinema/models/city.dart';
import 'package:cinema/models/creneau.dart';
import 'package:cinema/models/film.dart';
import 'package:cinema/models/recu.dart';
import 'package:cinema/models/salle.dart';
import 'package:cinema/models/ticket.dart';
import 'package:cinema/repository/repoCinema.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class CinemaNotifier with ChangeNotifier{

  RepoCinema _repoCinema = new RepoCinema();

  List<City> _citiesLoad = [];
  List<Film> _moviesLoad = [];
  List<Cinema> cinemasLoad = [];
  String labelSearch = "";
  int  currentCityId ;
  Recu reservedTicket;
  // DateTime now = new DateTime.now();   
  // DateFormat formatter = new DateFormat('yyyy-MM-dd');  
  // String formatted = formatter.format(now);

  // List<>
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
    List<Creneau> creneaux = new List<Creneau>();
    _repoCinema.getSeancesByFilmAndSalle(currentSalle.id, idFilm).then((value)  {
      for(var i = 0; i < value.length ; i++){
        creneaux.add(value[i]);
        // print(creneaux[i].idProjection);

      }
      // print("-----------------");
      currentSalle.creneaux = creneaux;
      // for(var h = 0 ; h < currentSalle.creneaux.length; h++){
      //   print(currentSalle.creneaux[h].idProjection);
      // }
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

  void saveListTicket(List<Ticket> comingTicket, int indexCinema){
    int key;
    for (var f = 0 ; f < cinemasLoad[indexCinema].selectedSalle.creneaux.length; f++ ) {
      if(cinemasLoad[indexCinema].selectedSalle.creneaux[f].isSelected){
        key = f;
      }
    }

    for(var i = 0 ; i < cinemasLoad[indexCinema].selectedSalle.creneaux[key].tickets.length; i++){
      if(containTicket(comingTicket, cinemasLoad[indexCinema].selectedSalle.creneaux[key].tickets[i].id)){
        cinemasLoad[indexCinema].selectedSalle.creneaux[key].tickets[i].isAvailable = true;
      }else{
        cinemasLoad[indexCinema].selectedSalle.creneaux[key].tickets[i].isAvailable = false;
      }
    }

  }

  bool containTicket( List<Ticket> comingTicket , int id){
    for(var i = 0 ; i < comingTicket.length; i++) {
      if(comingTicket[i].id == id){
        return true;
      }
    }
    return false;
  }

  void sendTickets(int indexSeance, Cinema cinema, String codePayement, int nbrPlace, double prix, String nameMovie){

    _repoCinema.payerTickets(indexSeance, cinema, codePayement).then((value) {
      
      List<Ticket> ticketsremoved = new List<Ticket>();

      if(value != null){
        for(var i = 0 ; i < cinema.selectedSalle.creneaux[indexSeance].tickets.length ; i++){
          if(cinema.selectedSalle.creneaux[indexSeance].tickets[i].isAvailable){
            ticketsremoved.add(cinema.selectedSalle.creneaux[indexSeance].tickets[i]);
          }
        }
        for(var r = 0; r < ticketsremoved.length; r++){
          cinema.selectedSalle.creneaux[indexSeance].tickets.remove(ticketsremoved[r]);
        }
        cinema.selectedSalle.creneaux[indexSeance].isSelected = false;

        // reservedTicket = new Recu(cinema.name, nbrPlace, cinema.selectedSalle.name, nameCinema, prix, codePayement)


        DateTime today = new DateTime.now();
        String day = today.day.toString();
        if(today.day < 10){
          day = "0"+today.day.toString();
        }
        String dateSlug ="${day}-${today.month.toString().padLeft(2,'0')}-${today.year.toString().padLeft(2,'0')}";
        reservedTicket = new Recu(nameMovie, nbrPlace, cinema.selectedSalle.name, cinema.name, prix, codePayement ,cinema.selectedSalle.creneaux[indexSeance].heure, dateSlug );
      }
    
    });

    notifyListeners();

  }
}