// import 'package:equatable/equatable.dart';

class City{
  final int id;
  final String name;
  final String imageUrl;
  final double lng;
  final double lat;


  City({this.lng, this.lat, this.id, this.name, this.imageUrl});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['link'] as String,
      lng: json['longitude'] as double,
      lat: json['latitude'] as double,

    );
  }
}