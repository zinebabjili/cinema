class Sender{
  final List<int> tickets;

  final int codePayement;

  Sender(this.tickets, this.codePayement);

  Map<String, dynamic> toJson() =>
  {
    'tickets': tickets,
    'codePayement': codePayement,
  }; 

}