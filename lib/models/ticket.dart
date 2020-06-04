class Ticket{
  final int id;
  final String nomClient;
  final double codePayement;
  final bool isAvailable;

  Ticket({this.id, this.nomClient, this.codePayement, this.isAvailable});
  
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'] as int,
      nomClient: json['nomClient'] as String,
      codePayement: json['codePayement'] as double,
      isAvailable: json['isAvailable'] as bool,
    );
  }
}