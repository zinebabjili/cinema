//crossAxisCount means “How many grid you want to display”
//mainAxisSpacing = A space between grid (top -> bottom)
//crossAxisSpacing = A Space between widget (side by side)

import 'package:cinema/models/place.dart';
import 'package:cinema/ui/TicketPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  List cities = [
    Place(image: 'assets/images/casa.jpg', name: "Casablanca"),
    Place(image: 'assets/images/rabat.jpg', name: "Rabat"),
    Place(image: 'assets/images/agadir.jpg', name: "Agadir"),
    Place(image: 'assets/images/marrakech.jpg', name: "Marrakech"),
    Place(image: 'assets/images/tanger.png', name: "Tanger"),
    Place(image: 'assets/images/two.jpg', name: "Fés"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                   stops: [0.2,0.3,0.5],
                  colors: [Colors.grey[600],Colors.grey[700],Colors.black87])),
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
                        "Choose Cities Names",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => TicketPage()));
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Stack(children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(cities[index].image),
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
                                if (cities[index].image ==
                                    "assets/images/casa.jpg")
                                  Navigator.of(context).pushNamed("casa");
                              },
                              child: Text(
                                cities[index].name,
                                style: Theme.of(context).textTheme.body1,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ]),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
