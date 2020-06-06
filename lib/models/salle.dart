import 'package:cinema/models/creneau.dart';

class Salle{
  final int id;
  final String name;
  final int nbrPlaces;
  List<Creneau> creneaux;

  Salle({this.id,this.name, this.nbrPlaces,this.creneaux});
  
  factory Salle.fromJson(Map<String, dynamic> json) {
    
    List<Creneau> seancesBitch = new List<Creneau>();
    print("BITCH");
    print(seancesBitch);

    return Salle(
      id: json['id'] as int,
      nbrPlaces: json['nombrePlaces'] as int,
      name: json['name'] as String,
      creneaux: seancesBitch
    );
  }
}