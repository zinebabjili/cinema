class Seance{
  final int id;
  final double heureDebut;

  Seance({this.id, this.heureDebut});
  
  factory Seance.fromJson(Map<String, dynamic> json) {
    return Seance(
      id: json['id'] as int,
      heureDebut: json['heureDebut'] as double,
    );
  }
}