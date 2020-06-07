import 'package:cinema/models/recu.dart';
import 'package:cinema/state_management/mainNotifier.dart';
import 'package:cinema/ui/city.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketPage extends StatelessWidget {
  // final String nameFilm;

  // const TicketPage({Key key, this.nameFilm}) : super(key: key);
  // final String seanceDuree;
  // final String price;
  // final String placesNbr;


  @override
  Widget build(BuildContext context) {
    return Consumer<CinemaNotifier>(
      builder: (_, cinemaNotf, __) {
        if(cinemaNotf.reservedTicket != null){
          return Scaffold(
          appBar: AppBar(
            title: Text(
              "Ticket Page",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0,
            actions: <Widget>[
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => CityPage() ));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.home,
                      size: 30,
                    ),
                  ),
                )
            ],
          ),
          body: Stack(
            children: <Widget>[
              Container(
                child: Container(
                  height: 150,
                  color: Colors.black,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 15.0,
                    left: 15.0,
                    top: 30.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Align(
                                  child: OutlineButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    textColor: Colors.black,
                                    child: Text(
                                      "code payement #"+cinemaNotf.reservedTicket.codePayement,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1),
                                    onPressed: () {},
                                  ),
                                  alignment: Alignment.bottomLeft,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(cinemaNotf.reservedTicket.nameMovie,
                                      style: TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.left),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Places",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Quicksand"),
                                  ),
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Quicksand"),
                                  ),
                                ],
                              ),
                              SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    cinemaNotf.reservedTicket.numberPlace.toString()+ "x Place(s)",
                                    style: TextStyle(
                                      height: 1.5,
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    cinemaNotf.reservedTicket.today,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Salle",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Cenima",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    cinemaNotf.reservedTicket.nameSeance,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "MEGA",
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Total Price",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Seance',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    (cinemaNotf.reservedTicket.price * cinemaNotf.reservedTicket.numberPlace ).toString() + " DH",
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    cinemaNotf.reservedTicket.seanceBitch.substring(0,5),
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                                width: 20,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: Colors.grey[200]),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Flex(
                                        children: List.generate(
                                            (constraints.constrainWidth() / 10)
                                                .floor(),
                                            (index) => SizedBox(
                                                  height: 1,
                                                  width: 5,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.grey.shade400),
                                                  ),
                                                )),
                                        direction: Axis.horizontal,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 20,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: Colors.grey[200]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          height: 100,
                          width: double.infinity,
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/barcode.gif',
                                height: 80.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
            overflow: Overflow.clip,
          ),
          backgroundColor: Colors.grey[200],
        );
        }else{
          return Column(
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.deepOrange,
              ),
              Text("Please wait for it"),
            ],
          );
        }
        
      },
    );
  }
}
