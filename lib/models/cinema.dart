import 'package:cinema/models/salle.dart';

class Cinema{
  final int id;
  final String name;
  final int nombrePlaces;
  final List<Salle> salles;
  Salle selectedSalle;

  Cinema({this.id, this.name, this.nombrePlaces, this.salles, this.selectedSalle});

  factory Cinema.fromJson(List<dynamic> json) {
    List<Salle> newSalle = [];
    Salle _selectedSalle = new Salle();

    for( var i = 0; i< json.length ; i++){
      newSalle.add(Salle(
        id: json[i]['id'],  
        name: json[i]['name'],  
        nbrPlaces: json[i]['nombrePlaces']
      ));
    }

    return Cinema(
      id: json[0]['cinema']['id'] as int,
      name: json[0]['cinema']['name'] as String,
      nombrePlaces: json[0]['cinema']['nombrePlaces'] as int,
      salles: newSalle,
      selectedSalle: _selectedSalle
    );
  }
}