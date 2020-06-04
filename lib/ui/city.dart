//crossAxisCount means “How many grid you want to display”
//mainAxisSpacing = A space between grid (top -> bottom)
//crossAxisSpacing = A Space between widget (side by side)

import 'package:cinema/models/city.dart';
import 'package:cinema/models/place.dart';
import 'package:cinema/state_management/mainNotifier.dart';
import 'package:cinema/ui/TicketPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movieListIteams.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<City> cities = Provider.of<CinemaNotifier>(context).citiesLoad;
    return StreamBuilder<List<City>>(
        stream: Provider.of<CinemaNotifier>(context).loadCities(),
        builder: (context, snapshot) {
          if (snapshot.data.isEmpty) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                        0.2,
                        0.3,
                        0.5
                      ],
                          colors: [
                        Colors.grey[600],
                        Colors.grey[700],
                        Colors.black87
                      ])),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Choose City",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => TicketPage()));
                              },
                              child: Icon(
                                Icons.assignment,
                                size: 30,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(
                                  backgroundColor: Colors.white),
                              Text(
                                "Data is loading please wait for it",
                                style: Theme.of(context).textTheme.body1,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                        0.2,
                        0.3,
                        0.5
                      ],
                          colors: [
                        Colors.grey[600],
                        Colors.grey[700],
                        Colors.black87
                      ])),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Choose City",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => TicketPage()));
                              },
                              child: Icon(
                                Icons.assignment,
                                size: 30,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Stack(children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                snapshot.data[index].imageUrl),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black12,
                                    ),
                                  )),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    MovieListIteams()));
                                      },
                                      child: Text(
                                        snapshot.data[index].name,
                                        style:
                                            Theme.of(context).textTheme.body1,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ]),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
