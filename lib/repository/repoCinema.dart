import 'package:cinema/models/city.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// apiUrl & apiId of https://openweathermap.org
String apiUrlCities = "https://cinema-backend-mundia.herokuapp.com/villes/";
// String apiUrlWeatherDetails = "https://api.openweathermap.org/data/2.5/forecast?q=";
// String apiId = "&appid=f134db3c43289be89de409a151e34178";

class RepoCinema {
  //Function to get city
  Future <List<City>> getCity() async {
    var result = await http.Client().get(apiUrlCities);
    if (result.statusCode != 200) {
      throw Exception();
    }
    return parseCityJson(result.body);
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
}
