import 'package:cinema/models/city.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// apiUrl & apiId of https://openweathermap.org
String apiUrlCities = "https://cinema-backend-mundia.herokuapp.com/villes/";
// String apiUrlWeatherDetails = "https://api.openweathermap.org/data/2.5/forecast?q=";
// String apiId = "&appid=f134db3c43289be89de409a151e34178";

class RepoCinema {
  //Function to get city
  Future<City> getCity(int id) async {

    final result = await http.Client().get(apiUrlCities + id.toString());

    if (result.statusCode != 200) {
      throw Exception();
    }

    return parseCityJson(result.body);
  }

  // will past the value of json response to a model Weather
  City parseCityJson(final response){
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded;
    return City.fromJson(jsonWeather);
  }
}
