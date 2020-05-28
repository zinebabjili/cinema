import 'package:cinema/ui/movieIteam.dart';
import 'package:flutter/material.dart';

class MovieListIteams extends StatefulWidget {
  @override
  _MovieListIteamsState createState() => _MovieListIteamsState();
}

class _MovieListIteamsState extends State<MovieListIteams> {
  List<String> cinemas = ["Breaking Bad", "Breaking Bad", "Breaking Bad"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Movie List ",
          style: TextStyle(fontSize: 22),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
            width: double.infinity,
            height: 60,
            color: Colors.black,
              child: Text("Results : 2", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
            ),
            ListView.builder(
              controller:ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
                itemCount: cinemas.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return MovieIteam();
                }
            ),
            
          ],
        ),
      ),
    );
  }
}
