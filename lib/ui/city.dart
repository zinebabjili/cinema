//crossAxisCount means “How many grid you want to display”
//mainAxisSpacing = A space between grid (top -> bottom)
//crossAxisSpacing = A Space between widget (side by side)

import 'package:cinema/models/place.dart';
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
    Place(image: 'assets/images/two.jpg', name: "Machu Picchu"),
    Place(image: 'assets/images/two.jpg', name: "Chichén Itzá"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Cities",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
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
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(cities[index].image),
                                  fit: BoxFit.cover)),
                          child: InkWell(
                              onTap: () {
                                if(cities[index].image=="assets/images/casa.jpg")
                                  Navigator.of(context).pushNamed("casa");
                              },
                              child: Center(
                                child: Text(cities[index].name,
                                    style: Theme.of(context).textTheme.body1),
                              )),
                        ),
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
