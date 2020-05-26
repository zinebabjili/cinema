import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieDescription extends StatefulWidget {
  @override
  _MovieDescriptionState createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        // offset: Offset(0.0, 2.0),
                        // blurRadius: 6.0
                      )
                    ]),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image: AssetImage("assets/images/158834.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          // iconSize: 30.0,
                          iconSize: 35.0,
                          // color: Colors.black,
                          color: Colors.white,
                          onPressed: () => {Navigator.pop(context)}),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.search),
                              // iconSize: 30.0,
                              iconSize: 35.0,
                              // color: Colors.black,
                              color: Colors.white,
                              onPressed: () => {Navigator.pop(context)})
                        ],
                      )
                    ],
                  )),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Breaking Bad",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        // Icon(
                        //   FontAwesomeIcons.times,
                        //   size: 15.0,
                        //   color: Colors.white,
                        // ),
                        SizedBox(width: 5.0),
                        Text(
                          "(2016) 1h30min",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(Icons.star,
                  color: Colors.yellow,
                  size: 30.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
