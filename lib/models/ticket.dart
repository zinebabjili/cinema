class Ticket{
  final int codePayement;
  final String nomClient;
  final double prix;
  final bool isAvailable;

  Ticket({this.codePayement, this.nomClient, this.isAvailable,this.prix});
  
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      nomClient: json['nomClient'] as String,
      codePayement: json['codePayement'] as int,
      isAvailable: json['reserve'] as bool,
      prix: json['prix'] as double
    );
  }
}