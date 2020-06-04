import 'package:cinema/models/city.dart';
import 'package:cinema/models/film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String apiUrlCities = "https://cinema-backend-mundia.herokuapp.com/villes/";
String apiUrlMovies = "https://cinema-backend-mundia.herokuapp.com/search/ville=";


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

  Future <List<Film>> getMovies(var i) async {
    final http.Response response = await http.get(apiUrlMovies + i.toString() + "&film=");
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
