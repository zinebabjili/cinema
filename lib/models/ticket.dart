class Ticket{
  final int codePayement;
  final int id;
  final String nomClient;
  final double prix;
  bool isAvailable;

  Ticket({this.id,this.codePayement, this.nomClient, this.isAvailable,this.prix});
  
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      nomClient: json['nomClient'] as String,
      id: json['id'] as int,
      codePayement: json['codePayement'] as int,
      isAvailable: json['reserve'] as bool,
      prix: json['prix'] as double
    );
  }
}