import 'package:cinema/models/city.dart';
import 'package:cinema/models/film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// String apiUrlCities = "http:///villes/";
String apiUrlCities = "http://192.168.1.102:8089/villes/";
// String apiUrlMovies = "https://cinema-backend-mundia.herokuapp.com/search/ville=";
String apiUrlMovies = "http://192.168.1.102:8089/search/ville=";


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
    
    // print("41 - " + i.toString() + " - " +label.toString());

    if(label != ""){
      print(response.body);
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
}
