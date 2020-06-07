import 'package:cinema/models/cinema.dart';
import 'package:cinema/models/city.dart';
import 'package:cinema/models/creneau.dart';
import 'package:cinema/models/film.dart';
import 'package:cinema/models/sender.dart';
import 'package:cinema/models/ticket.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// String apiUrlCities = "http:///villes/";
// String apiUrlMovies = "https://cinema-backend-mundia.herokuapp.com/search/ville=";

String apiUrlCities = "http://192.168.1.102:8089/villes/";
String apiUrlMovies = "http://192.168.1.102:8089/search/ville=";
String apiUrlMoviesDetails = "http://192.168.1.102:8089/getCinemasSalles/ville=";
String apiUrlSeancesOfSalle = "http://192.168.1.102:8089/getSeances/salle=";
String apiUrlPayement = "http://192.168.1.102:8089/payerLmok";


class RepoCinema {
  //Function to get city
  Future <List<City>> getCity() async {
    final http.Response response = await http.get(apiUrlCities);
    if (response.statusCode != 200) {
      throw Exception();
    }
    return parseCityJson(response.body);
  }

  // will past the value of json response to a model Weather
  List<City> parseCityJson(response){
    final jsonDecoded = json.decode(response);
    final jsonCities = jsonDecoded;
    List<City> cities =[];
    for (var i = 0; i < jsonCities["_embedded"]["villes"].length; i++) {
      // print(jsonCities["_embedded"]["villes"][i]);
      cities.add(City.fromJson(jsonCities["_embedded"]["villes"][i]));
    }
    return cities ;
  }

  Future <List<Film>> getMovies(var i, var label) async {
    
    final http.Response response = await http.get(apiUrlMovies + i.toString() + "&film=" + label);    

    if(label != ""){
      // print(response.body);
    }
    if (response.statusCode != 200) {
      throw Exception();
    }
    return parseMovieJson(response.body);
  }

  // will past the value of json response to a model Weather
  List<Film> parseMovieJson(response){
    final jsonDecoded = json.decode(response);
    final jsonMovies = jsonDecoded;
    List<Film> films =[];

    Map map = jsonMovies;
    
    map.forEach((key, value) {
      films.add(Film.fromJson(jsonMovies[key][0]['films']));
    });

    return films ;
  }

  Future <List<Cinema>> getMoviesDetails(var idCity, var idFilm) async {
    
    final http.Response response = await http.get(apiUrlMoviesDetails + idCity.toString() + "&film=" + idFilm.toString());
    
    if (response.statusCode != 200) {
      throw Exception();
    }
    return parseMovieDetailsJson(response.body);
  }

  List<Cinema> parseMovieDetailsJson(response){
    final jsonDecoded = json.decode(response);
    final jsonCines = jsonDecoded;

    List<Cinema> cinemas =[];

    Map map = jsonCines;
    
    map.forEach((key, value) {
      cinemas.add(Cinema.fromJson(jsonCines[key]));
    });

    return cinemas ;
  }

  Future <List<Creneau>> getSeancesByFilmAndSalle(var idSalle, var idFilm) async {
    
    final http.Response response = await http.get(apiUrlSeancesOfSalle + idSalle.toString() + "&film=" + idFilm.toString());    
    
    if (response.statusCode != 200) {
      throw Exception();
    }

    return parseCreneaux(response.body);
  }

  List<Creneau> parseCreneaux(response){
    final jsonDecoded = json.decode(response);
    final jsonCreneaux = jsonDecoded;

    List<Creneau> seances =[];

    for(var i = 0; i < jsonCreneaux.length; i++){
      seances.add(Creneau.fromJson(jsonCreneaux[i]));
    }

    return seances ;
  }
 
  Future<List<Ticket>> payerTickets(int indexSeance, Cinema cinema, String codePayement) async {
    List<int> ticks = new List<int>();

    for(var i= 0 ; i<cinema.selectedSalle.creneaux[indexSeance].tickets.length ; i++){
      if(cinema.selectedSalle.creneaux[indexSeance].tickets[i].isAvailable){
        ticks.add( cinema.selectedSalle.creneaux[indexSeance].tickets[i].id);
      }
    }

    Sender sender = new Sender(ticks, int.parse(codePayement));
  
    var json = jsonEncode(sender.toJson());
  

    var responseSpecia = await http.post(apiUrlPayement,
          headers: {"Content-Type": "application/json"},
          body: json
    );

    if (responseSpecia.statusCode != 200) {
      throw Exception();
    }



    return parseTickets(responseSpecia.body);

  }

  List<Ticket> parseTickets(response){

    final jsonDecoded = json.decode(response);
    final jsonCreneaux = jsonDecoded;

    List<Ticket> tickets =[];

    for(var i = 0; i < jsonCreneaux.length; i++){
      tickets.add(Ticket.fromJson(jsonCreneaux[i]));
    }

    return tickets ;
  }

}