import 'package:cinema/models/cinema.dart';
import 'package:cinema/models/creneau.dart';
import 'package:cinema/models/film.dart';
import 'package:cinema/models/salle.dart';
import 'package:cinema/models/ticket.dart';
import 'package:cinema/services/AppLocalizations.dart';
import 'package:cinema/state_management/mainNotifier.dart';
import 'package:cinema/styles.dart';
import 'package:cinema/ui/TicketPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MovieAvailable extends StatefulWidget {
  final Cinema cinema;
  final Film film;

  const MovieAvailable({Key key, this.cinema, this.film}) : super(key: key);

  @override
  MovieAvailableState createState() =>
      MovieAvailableState(this.cinema, this.film);
}

class MovieAvailableState extends State<MovieAvailable> {
  Cinema cinema;
  Film film;
  String currentSeance = "Choose Time";

  MovieAvailableState(this.cinema, this.film);

  @override
  Widget build(BuildContext context) {
    currentSeance = AppLocalizations.of(context).translate('select_time');
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
                  AppLocalizations.of(context).translate('available') +  " ${cinema.name}",
                  style: TitleTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                  Widget>[
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
                                    String v = cinemaNotf.getSalleSelectedName(cinema.id);
                                    if(cinemaNotf.getSalleSelectedName(cinema.id) == "Choose salle"){
                                      v = AppLocalizations.of(context).translate('select_salle');
                                    }
                                    return Text(v);
                                  },
                                ),
                              ],
                            ),
                          ),
                          onPressed: () => _submit(context, cinema.salles,
                              cinema.id, widget.film.id, "salle", 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                      // time button
                      Consumer<CinemaNotifier>(
                        builder: (_, cinemaNotf, __) {
                          for (var i = 0;
                              i < cinemaNotf.cinemasLoad.length;
                              i++) {
                            if (cinemaNotf.cinemasLoad[i].id == cinema.id) {
                              if (cinemaNotf.cinemasLoad[i].selectedSalle
                                          .creneaux !=
                                      null &&
                                  cinemaNotf.cinemasLoad[i].selectedSalle
                                          .creneaux.length !=
                                      0) {
                                currentSeance = AppLocalizations.of(context).translate('select_time');
                                for (var g = 0;
                                    g <
                                        cinemaNotf.cinemasLoad[i].selectedSalle
                                            .creneaux.length;
                                    g++) {
                                  if (cinemaNotf.cinemasLoad[i].selectedSalle
                                      .creneaux[g].isSelected) {
                                    currentSeance = cinemaNotf.cinemasLoad[i]
                                        .selectedSalle.creneaux[g].heure
                                        .substring(0, 5);
                                  }
                                }
                                // if (cinemaNotf.getSalleSelectedName(cinema.id) != cinemaNotf.cinemasLoad[i].selectedSalle.name ){
                                //   currentSeance = "choose time";
                                // }

                                return RaisedButton(
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
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Icon(
                                                FontAwesomeIcons.clock,
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(currentSeance),
                                        ],
                                      ),
                                    ),
                                    onPressed: () => _submit(
                                        context,
                                        cinema.salles,
                                        cinema.id,
                                        widget.film.id,
                                        "time",
                                        i),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)));
                              } else {
                                return RaisedButton(
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
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Icon(
                                                FontAwesomeIcons.clock,
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(AppLocalizations.of(context).translate('select_time')),
                                        ],
                                      ),
                                    ),
                                    onPressed: null,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)));
                              }
                            }
                          }
                        },
                      ),

                      // user button
                      Consumer<CinemaNotifier>(builder: (_, cinemaNotf, __) {
                        int nbrPlace = 0;
                        if (cinemaNotf.cinemasLoad != null) {
                          for (var i = 0;
                              i < cinemaNotf.cinemasLoad.length;
                              i++) {
                            if (cinemaNotf.cinemasLoad[i].id == cinema.id) {
                              bool state = false;
                              int endex = 100;
                              if (cinemaNotf.cinemasLoad[i].selectedSalle
                                          .creneaux !=
                                      null &&
                                  cinemaNotf.cinemasLoad[i].selectedSalle
                                          .creneaux.length !=
                                      0) {
                                for (var k = 0;
                                    k <
                                        cinemaNotf.cinemasLoad[i].selectedSalle
                                            .creneaux.length;
                                    k++) {
                                  if (cinemaNotf.cinemasLoad[i].selectedSalle
                                      .creneaux[k].isSelected) {
                                    state = true;
                                    endex = k;
                                  }
                                }
                                if (endex != 100) {
                                  for (var j = 0;
                                      j <
                                          cinemaNotf
                                              .cinemasLoad[i]
                                              .selectedSalle
                                              .creneaux[endex]
                                              .tickets
                                              .length;
                                      j++) {
                                    if (cinemaNotf
                                        .cinemasLoad[i]
                                        .selectedSalle
                                        .creneaux[endex]
                                        .tickets[j]
                                        .isAvailable) {
                                      nbrPlace++;
                                    }
                                  }
                                }
                              }

                              if (state) {
                                return RaisedButton(
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
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Icon(
                                                FontAwesomeIcons.receipt,
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          nbrPlace != 0
                                              ? Text(nbrPlace.toString() +
                                                  " Place")
                                              : Text(AppLocalizations.of(context).translate('select_place')),
                                        ],
                                      ),
                                    ),
                                    onPressed: () => _submit(
                                        context,
                                        cinema.salles,
                                        cinema.id,
                                        widget.film.id,
                                        "ticket",
                                        i),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)));
                              } else {
                                return RaisedButton(
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
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Icon(
                                                FontAwesomeIcons.receipt,
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(AppLocalizations.of(context).translate('select_place')),
                                        ],
                                      ),
                                    ),
                                    onPressed: null,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)));
                              }
                            }
                          }
                        } else {
                          return RaisedButton(
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
                                    Text("Choose PlaceX"),
                                  ],
                                ),
                              ),
                              onPressed: null,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)));
                        }
                      }),
                    ],
                  ),
                ),
                // right
                Consumer<CinemaNotifier>(builder: (_, cinemaNotf, __) {
                  int indexs = 1000;
                  int ticketsNotempty = 0;
                  double prixticket = 0.0;
                  String selectedCinemaName;
                  String selectedSalleName;
                  String selectedSeance;
                  String selectedMovie = widget.film.titre;
                  if (cinema.selectedSalle != null) {
                    selectedCinemaName = cinema.name;
                    if (cinema.selectedSalle.creneaux != null) {
                      selectedSalleName = cinema.selectedSalle.name;
                      for (var i = 0;
                          i < cinema.selectedSalle.creneaux.length;
                          i++) {
                        if (cinema.selectedSalle.creneaux[i].isSelected) {
                          indexs = i;
                          selectedSeance = cinema
                              .selectedSalle.creneaux[i].heure
                              .substring(0, 5);
                        }
                      }
                      if (indexs != 1000) {
                        for (var i = 0;
                            i <
                                cinema.selectedSalle.creneaux[indexs].tickets
                                    .length;
                            i++) {
                          if (cinema.selectedSalle.creneaux[indexs].tickets[i]
                              .isAvailable) {
                            ticketsNotempty++;
                            prixticket = cinema
                                .selectedSalle.creneaux[indexs].tickets[i].prix;
                          }
                        }
                      }
                    }
                  }
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        (ticketsNotempty != 0)
                            ? RaisedButton(
                                textColor: Colors.white,
                                color: Colors.deepOrange,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  child: Text(
                                    AppLocalizations.of(context).translate('reserve'),
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                                onPressed: () => _reserve(
                                    context,
                                    cinema,
                                    selectedCinemaName,
                                    selectedSalleName,
                                    selectedSeance,
                                    prixticket,
                                    ticketsNotempty,
                                    indexs,
                                    selectedMovie),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)))
                            : RaisedButton(
                                textColor: Colors.white,
                                color: Colors.deepOrange,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  child: Text(
                                    AppLocalizations.of(context).translate('reserve'),
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                                onPressed: null,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                        SizedBox(height: 15),
                        // Consumer<CinemaNotifier>(builder: (_, cinemaNotf, __) {
                        (ticketsNotempty == 0)
                            ? Text(
                                AppLocalizations.of(context).translate('price') + " : --,-- Dh",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                AppLocalizations.of(context).translate('price') + " : " +
                                    (prixticket * ticketsNotempty).toString() +
                                    " Dh",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                )),
                      ],
                    ),
                  );
                }),
              ])
            ],
          ),
        ),
      ),
    ]);
  }
}
// show salle or time or place

_submit(context, listSalle, idCenima, idFilm, type, indexListCurrentSalle) {
  if (type == "salle") {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogSalle(
              listSalle: listSalle, idCenima: idCenima, idFilm: idFilm);
        });
  } else if (type == "time") {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogTime(
              idCenima: idCenima,
              idFilm: idFilm,
              indexListCurrentSalle: indexListCurrentSalle);
        });
  } else if (type == "ticket") {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogTickets(
              idCenima: idCenima,
              idFilm: idFilm,
              indexListCurrentSalle: indexListCurrentSalle);
        });
  }
}

//Salle popup
class DialogSalle extends StatefulWidget {
  final int idCenima;
  final int idFilm;
  final List<Salle> listSalle;

  const DialogSalle({Key key, this.listSalle, this.idCenima, this.idFilm})
      : super(key: key);
  @override
  _DialogSalleState createState() =>
      _DialogSalleState(this.listSalle, this.idCenima, this.idFilm);
}

class _DialogSalleState extends State<DialogSalle> {
  List<Salle> listSalle;
  Salle currentSalle;
  bool saveIsClicked = false;
  String messageError;
  int idCenima;
  int idFilm;

  _DialogSalleState(this.listSalle, this.idCenima, this.idFilm);

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
                AppLocalizations.of(context).translate('select_salle_message'),
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
                            onPressed: () async {
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
                      AppLocalizations.of(context).translate('save'),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (this.currentSalle != null) {
                        Future.delayed(const Duration(seconds: 0), () {
                          saveIsClicked = true;
                          Provider.of<CinemaNotifier>(context, listen: false)
                              .setSalleSelected(idCenima, currentSalle);

                          Provider.of<CinemaNotifier>(context, listen: false)
                              .setSeancesToCurrentSalle(
                                  this.currentSalle, idFilm);
                        }).then((value) => {
                              Navigator.pop(context),
                            });
                      } else {
                        this.messageError = "* You should select something";
                      }
                      // print(currentSalle.creneaux);
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ],
          ),
        ));
  }
}

//Time Popup
class DialogTime extends StatefulWidget {
  final int idCenima;
  final int idFilm;
  final int indexListCurrentSalle;
  const DialogTime(
      {Key key, this.idCenima, this.idFilm, this.indexListCurrentSalle})
      : super(key: key);

  @override
  _DialogTimeState createState() =>
      _DialogTimeState(this.idFilm, this.idCenima, this.indexListCurrentSalle);
}

class _DialogTimeState extends State<DialogTime> {
  int idCenima;
  int idFilm;
  int indexListCurrentSalle;
  Creneau currentCreneau;
  String messageError;

  _DialogTimeState(this.idCenima, this.idFilm, this.indexListCurrentSalle);
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
                AppLocalizations.of(context).translate('select_time_message'),
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
                  child: Consumer<CinemaNotifier>(builder: (_, cinemaNotf, __) {
                    if (cinemaNotf.cinemasLoad[indexListCurrentSalle]
                            .selectedSalle.creneaux.length !=
                        0) {
                      return GridView.builder(
                          controller:
                              new ScrollController(keepScrollOffset: false),
                          padding: EdgeInsets.all(30),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10.0,
                          ),
                          itemCount: cinemaNotf
                              .cinemasLoad[indexListCurrentSalle]
                              .selectedSalle
                              .creneaux
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 100.0,
                              child: RaisedButton(
                                color: (this.currentCreneau ==
                                        cinemaNotf
                                            .cinemasLoad[indexListCurrentSalle]
                                            .selectedSalle
                                            .creneaux[index])
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                child: Text(
                                  cinemaNotf.cinemasLoad[indexListCurrentSalle]
                                      .selectedSalle.creneaux[index].heure
                                      .substring(0, 5),
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 12.0,
                                    color: (this.currentCreneau ==
                                            cinemaNotf
                                                .cinemasLoad[
                                                    indexListCurrentSalle]
                                                .selectedSalle
                                                .creneaux[index])
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () async {
                                  // setState(() {
                                  this.currentCreneau = cinemaNotf
                                      .cinemasLoad[indexListCurrentSalle]
                                      .selectedSalle
                                      .creneaux[index];
                                  // });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                      width: 2.0,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            );
                          });
                    }
                    return Text("Something is weird happned ");
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
                      AppLocalizations.of(context).translate('save'),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (this.currentCreneau != null) {
                        Provider.of<CinemaNotifier>(context, listen: false)
                            .setCurrentCreneau(currentCreneau.idProjection,
                                indexListCurrentSalle);
                        Navigator.pop(context);
                      } else {
                        this.messageError = "* You should select something";
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ],
          ),
        ));
  }
}

// place popup
class DialogTickets extends StatefulWidget {
  final int idCenima;
  final int idFilm;
  final int indexListCurrentSalle;

  const DialogTickets(
      {Key key, this.idCenima, this.idFilm, this.indexListCurrentSalle})
      : super(key: key);
  @override
  _DialogTicketsState createState() => _DialogTicketsState(
      this.idCenima, this.idFilm, this.indexListCurrentSalle);
}

class _DialogTicketsState extends State<DialogTickets> {
  int idCenima;
  int idFilm;
  int indexListCurrentSalle;

  int indexSeance = 0;
  List<Ticket> currentTicket = new List<Ticket>();

  String messageError;

  _DialogTicketsState(this.idCenima, this.idFilm, this.indexListCurrentSalle);
  @override
  Widget build(BuildContext context) {
    int key = 0;
    for (var f = 0;
        f <
            Provider.of<CinemaNotifier>(context, listen: false)
                .cinemasLoad[indexListCurrentSalle]
                .selectedSalle
                .creneaux
                .length;
        f++) {
      if (Provider.of<CinemaNotifier>(context, listen: false)
          .cinemasLoad[indexListCurrentSalle]
          .selectedSalle
          .creneaux[f]
          .isSelected) {
        key = f;
      }
    }
    for (var i = 0;
        i <
            Provider.of<CinemaNotifier>(context, listen: false)
                .cinemasLoad[indexListCurrentSalle]
                .selectedSalle
                .creneaux[key]
                .tickets
                .length;
        i++) {
      if (Provider.of<CinemaNotifier>(context, listen: false)
          .cinemasLoad[indexListCurrentSalle]
          .selectedSalle
          .creneaux[key]
          .tickets[i]
          .isAvailable) {
        currentTicket.add(Provider.of<CinemaNotifier>(context, listen: false)
            .cinemasLoad[indexListCurrentSalle]
            .selectedSalle
            .creneaux[key]
            .tickets[i]);
      }
    }

    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translate('select_place_message'),
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
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Consumer<CinemaNotifier>(builder: (_, cinemaNotf, __) {
                    for (var i = 0;
                        i <
                            cinemaNotf.cinemasLoad[indexListCurrentSalle]
                                .selectedSalle.creneaux.length;
                        i++) {
                      if (cinemaNotf.cinemasLoad[indexListCurrentSalle]
                          .selectedSalle.creneaux[i].isSelected) {
                        indexSeance = i;
                      }
                    }

                    if (cinemaNotf
                            .cinemasLoad[indexListCurrentSalle]
                            .selectedSalle
                            .creneaux[indexSeance]
                            .tickets
                            .length !=
                        0) {
                      return Scrollbar(
                        controller: ScrollController(initialScrollOffset: 0),
                        child: GridView.builder(
                            physics: ScrollPhysics(),
                            controller:
                                new ScrollController(keepScrollOffset: false),
                            padding: EdgeInsets.all(30),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 4.0,
                            ),
                            itemCount: cinemaNotf
                                .cinemasLoad[indexListCurrentSalle]
                                .selectedSalle
                                .creneaux[indexSeance]
                                .tickets
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              bool isSelelct = false;
                              if (cinemaNotf
                                  .cinemasLoad[indexListCurrentSalle]
                                  .selectedSalle
                                  .creneaux[indexSeance]
                                  .tickets[index]
                                  .isAvailable) {
                                isSelelct = true;
                              }
                              return SizedBox(
                                child: RaisedButton(
                                  color: isSelelct
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: isSelelct
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      if (cinemaNotf
                                          .cinemasLoad[indexListCurrentSalle]
                                          .selectedSalle
                                          .creneaux[indexSeance]
                                          .tickets[index]
                                          .isAvailable) {
                                        cinemaNotf
                                            .cinemasLoad[indexListCurrentSalle]
                                            .selectedSalle
                                            .creneaux[indexSeance]
                                            .tickets[index]
                                            .isAvailable = false;
                                        isSelelct = false;
                                      } else {
                                        isSelelct = true;
                                        cinemaNotf
                                            .cinemasLoad[indexListCurrentSalle]
                                            .selectedSalle
                                            .creneaux[indexSeance]
                                            .tickets[index]
                                            .isAvailable = true;
                                      }
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
                      );
                    }
                    return Text("No Tickets Available ",
                        style: TextStyle(
                          height: 3.0,
                          fontSize: 16.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),);
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
                      AppLocalizations.of(context).translate('save'),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      bool emptyCurrentTickets = false;
                      List<Ticket> listTicket =
                          Provider.of<CinemaNotifier>(context, listen: false)
                              .cinemasLoad[indexListCurrentSalle]
                              .selectedSalle
                              .creneaux[indexSeance]
                              .tickets;
                      for (var i = 0; i < listTicket.length; i++) {
                        if (listTicket[i].isAvailable) {
                          emptyCurrentTickets = true;
                        }
                      }
                      if (!emptyCurrentTickets) {
                        this.messageError =
                            "* You should select at least one place";
                      } else {
                        // Provider.of<CinemaNotifier>(context, listen: false).saveListTicket(this.currentTicket,this.indexListCurrentSalle);
                        Navigator.pop(context);
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ],
          ),
        ));
  }
}

_reserve(context, cinema, selectedCinemaName, selectedSalleName, selectedSeance,
    prixticket, ticketsNotempty, indexs, selectedMovie) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogReserve(
            cinema: cinema,
            selectedCinemaName: selectedCinemaName,
            selectedSalleName: selectedSalleName,
            selectedSeance: selectedSeance,
            prixticket: prixticket,
            ticketsNotempty: ticketsNotempty,
            indexs: indexs,
            selectedMovie: selectedMovie);
      });
}

class DialogReserve extends StatefulWidget {
  final Cinema cinema;
  final String selectedCinemaName;
  final String selectedSalleName;
  final String selectedSeance;
  final double prixticket;
  final int indexs;
  final int ticketsNotempty;
  final String selectedMovie;

  const DialogReserve(
      {Key key,
      this.cinema,
      this.selectedCinemaName,
      this.selectedSalleName,
      this.selectedSeance,
      this.prixticket,
      this.indexs,
      this.ticketsNotempty,
      this.selectedMovie})
      : super(key: key);

  @override
  _DialogReserveState createState() => _DialogReserveState(this.cinema);
}

class _DialogReserveState extends State<DialogReserve> {
  Cinema cinema;
  TextEditingController codePayement = new TextEditingController();
  String messageError;
  _DialogReserveState(this.cinema);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).translate('reserve_message_pp'),
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 14.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).translate('film'),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context).translate('cinema'),
                                style: TextStyle(
                                  fontSize: 14,
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
                                widget.selectedMovie,
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                widget.selectedCinemaName,
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
                                AppLocalizations.of(context).translate('salle'),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context).translate('seance'),
                                style: TextStyle(
                                  fontSize: 14,
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
                                widget.selectedSalleName,
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                widget.selectedSeance,
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
                                AppLocalizations.of(context).translate('num_place'),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context).translate('total'),
                                style: TextStyle(
                                  fontSize: 14,
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
                                widget.ticketsNotempty.toString() +
                                    "x place(s)",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                (widget.prixticket * widget.ticketsNotempty)
                                        .toString() +
                                    " DH",
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
                          )
                        ],
                      ),
                    ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: codePayement,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: AppLocalizations.of(context).translate('payement_code'),
                        prefixIcon: Icon(FontAwesomeIcons.paypal),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                RaisedButton(
                    textColor: Colors.white,
                    color: Colors.deepOrange,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                      child: Text(
                        AppLocalizations.of(context).translate('buy'),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (codePayement.text == "") {
                          messageError = "* You should put your code payement";
                        } else {
                          Provider.of<CinemaNotifier>(context, listen: false)
                              .sendTickets(widget.indexs, widget.cinema,
                                  codePayement.text, widget.ticketsNotempty,widget.prixticket, widget.selectedMovie);

                          Navigator.pop(context);
                          
                          Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => TicketPage()));
                        }
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ],
            ),
          )),
    );
  }
}
