class Film{
  final int id;
  final double duree;
  final String titre;
  final String description;
  final String realisateur;
  final String imageUrl;
  final String date;

  Film({this.id, this.duree, this.titre, this.description, this.realisateur, this.imageUrl, this.date});
  
  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] as int,
      duree: json['duree'] as double,
      titre: json['titre'] as String,
      description: json['description'] as String,
      realisateur: json['realisateur'] as String,
      imageUrl: json['photo'] as String,
      date: json['date'] as String,
    );
  }
}