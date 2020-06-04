import 'package:cinema/models/film.dart';
import 'package:cinema/models/salle.dart';
import 'package:cinema/models/seance.dart';

class Projection{
  final int id;
  final Film film;
  final Seance seance;
  final Salle	salle;

  Projection({this.id, this.film, this.seance, this.salle});


  factory Projection.fromJson(Map<String, dynamic> json) {
    return Projection(
      id: json['id'] as int,
      film: json['films'] as Film,
      salle: json['salles'] as Salle,
    );
  }
}