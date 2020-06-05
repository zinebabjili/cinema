import 'package:cinema/models/cinema.dart';
import 'package:cinema/models/salle.dart';
import 'package:cinema/state_management/mainNotifier.dart';
import 'package:cinema/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MovieAvailable extends StatefulWidget {
  final Cinema cinema;

  const MovieAvailable({Key key, this.cinema}) : super(key: key);

  @override
  MovieAvailableState createState() => MovieAvailableState(this.cinema);
}

class MovieAvailableState extends State<MovieAvailable> {
  Cinema cinema;

  MovieAvailableState(this.cinema);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              // color: Colors.red,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                child: Text(
                  "Available on ${cinema.name}",
                  style: TitleTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // left
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        // salle button
                        RaisedButton(
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Icon(
                                        FontAwesomeIcons.personBooth,
                                        color: Colors.black,
                                        size: 22,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // (cinema.selectedSalle.name != null)
                                  // ? Text(cinema.selectedSalle.name)
                                  // : Text("Choose Salle "),
                                  Consumer<CinemaNotifier>(
                                    builder: (_, cinemaNotf, __) {
                                      if(Provider.of<CinemaNotifier>(context,listen: false).getSalleSelectedName(cinema.id) != null){
                                         return Text(Provider.of<CinemaNotifier>(context,listen: false)
                                              .getSalleSelectedName(cinema.id));
                                      }else{
                                         return Text("Choose Salle OK");
                                      }
                                     
                                    },
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () =>
                                _submit(context, cinema.salles, cinema.id),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0))),
                        // time button
                        RaisedButton(
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Icon(
                                        FontAwesomeIcons.clock,
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Choose Time"),
                                ],
                              ),
                            ),
                            onPressed: null,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0))),
                        // user button
                        RaisedButton(
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Icon(
                                        FontAwesomeIcons.receipt,
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Choose Place"),
                                ],
                              ),
                            ),
                            onPressed: null,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0))),
                      ],
                    ),
                  ),
                  // right
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                            textColor: Colors.white,
                            color: Colors.deepOrange,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Text(
                                "Reserve",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            onPressed: () {
                              print(cinema.salles);
                              print("resrve");
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        SizedBox(height: 15),
                        Text(
                          "Price : \$ 120",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
// show option or sauce or choix

_submit(context, listSalle, idCenima) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogSalle(listSalle: listSalle, idCenima: idCenima);
      });
}

class DialogSalle extends StatefulWidget {
  final int idCenima;
  final List<Salle> listSalle;

  const DialogSalle({Key key, this.listSalle, this.idCenima}) : super(key: key);
  @override
  _DialogSalleState createState() =>
      _DialogSalleState(this.listSalle, this.idCenima);
}

class _DialogSalleState extends State<DialogSalle> {
  List<Salle> listSalle;
  Salle currentSalle;
  bool saveIsClicked = false;
  String messageError;
  int idCenima;

  _DialogSalleState(this.listSalle, this.idCenima);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You can easly choose the Salle :)",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 14.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: GridView.builder(
                      controller: new ScrollController(keepScrollOffset: false),
                      padding: EdgeInsets.all(30),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: listSalle.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 100.0,
                          child: RaisedButton(
                            color: (currentSalle == listSalle[index] &&
                                    currentSalle != null)
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            child: Text(
                              listSalle[index].name,
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 12.0,
                                color: (currentSalle == listSalle[index] &&
                                        currentSalle != null)
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              setState(() {
                                this.currentSalle = listSalle[index];
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                  width: 2.0,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              messageError != null
                  ? Text(
                      messageError,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 14.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : SizedBox(),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.deepOrange,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (this.currentSalle != null) {
                        saveIsClicked = true;
                        Provider.of<CinemaNotifier>(context, listen: false)
                            .setSalleSelected(idCenima, currentSalle);
                        Navigator.pop(context);
                      } else {
                        this.messageError = "* You should select something";
                      }
                    });
                    print("resrve");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ],
          ),
        ));
  }
}
