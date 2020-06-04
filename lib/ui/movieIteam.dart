import 'package:flutter/material.dart';

import 'movie.dart';

class MovieIteam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: 0.0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                child: Image.asset(
                  "assets/images/158834.jpg",
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 160,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Breaking Bad",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Text(
                    "joaquin phoenix",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 160,
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.yellow,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 30.0,
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  RaisedButton(
                      textColor: Colors.white,
                      color: Colors.deepOrange,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 10.0),
                        child: Text(
                          "View",
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Movie()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}