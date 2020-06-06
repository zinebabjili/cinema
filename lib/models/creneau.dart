class Creneau{
  final int id;
  final int idProjection;
  final String heure;
  bool isSelected ;
  

  Creneau({this.id, this.idProjection, this.heure, this.isSelected});
  
  factory Creneau.fromJson(Map<String, dynamic> json) {
    return Creneau(
      id: json['seance']['id'] as int,
      heure: json['seance']['heureDebut'] as String,
      idProjection: json['id'] as int,
      isSelected: false
    );
  }
}