class Salle{
  final int id;
  final String name;
  final int nbrPlaces;

  Salle({this.id,this.name, this.nbrPlaces});
  
  factory Salle.fromJson(Map<String, dynamic> json) {
    return Salle(
      id: json['id'] as int,
      nbrPlaces: json['nombrePlaces'] as int,
      name: json['name'] as String,
    );
  }
}