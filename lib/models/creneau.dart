import 'package:cinema/models/ticket.dart';

class Creneau{
  final int id;
  final int idProjection;
  final String heure;
  bool isSelected ;
  List<Ticket> tickets;
  

  Creneau({this.id, this.idProjection, this.heure, this.isSelected, this.tickets});
  
  factory Creneau.fromJson(Map<String, dynamic> json) {
    List<Ticket> ticketsBitch = new List<Ticket>();
    for (var i = 0; i < json["tickets"].length ; i++) {
      ticketsBitch.add(
        Ticket.fromJson(json["tickets"][i])
      );
    }
    // Ticket(
        //   codePayement: json["tickets"][i]["codePayement"],
        //   isAvailable: json["tickets"][i][],
        //   nomClient: json["tickets"][i][],
        // )
    return Creneau(
      id: json['seance']['id'] as int,
      heure: json['seance']['heureDebut'] as String,
      idProjection: json['id'] as int,
      isSelected: false,
      tickets: ticketsBitch
    );
  }
}