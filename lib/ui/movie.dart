import 'package:cinema/models/film.dart';
import 'package:flutter/material.dart';
import 'package:cinema/ui/movieDescription.dart';
import 'package:cinema/ui/moviesAvailable.dart';

class Movie extends StatefulWidget {
  final Film movieDesc;

  const Movie({Key key, this.movieDesc}) : super(key: key);
  @override
  _MovieState createState() => _MovieState(this.movieDesc);
}

class _MovieState extends State<Movie> {
  final Film movieDesc;

  _MovieState(this.movieDesc);

  List<String> cinemas = ["mega", "imax", "saada"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Stack(
                children: <Widget>[
                 
                  Container(
                    height: MediaQuery.of(context).size.width * .7,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            // offset: Offset(0.0, 2.0),
                            // blurRadius: 6.0
                          )
                        ]),
                    child: Hero(
                      tag: movieDesc.id,
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(30.0),
                        child: Image.network(
                          movieDesc.imageUrl,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * .7,

                    decoration: BoxDecoration(
                      color: Colors.black38,
                    ),
                  )),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 40.0),
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
                          // Row(
                          //   children: <Widget>[
                          //     IconButton(
                          //         icon: Icon(Icons.search),
                          //         // iconSize: 30.0,
                          //         iconSize: 35.0,
                          //         // color: Colors.black,
                          //         color: Colors.white,
                          //         onPressed: () => {Navigator.pop(context)})
                          //   ],
                          // )
                        ],
                      )),
                  Positioned(
                    left: 20.0,
                    bottom: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movieDesc.titre,
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
                              "(" +
                                  movieDesc.date.split('-')[0] +
                                  ") " +
                                  movieDesc.duree.round().toString() +
                                  "h00min",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    bottom: 20.0,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 30.0,
                    ),
                  ),
                  
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: MovieDescription(
                desc: movieDesc.description,
                realisateur: movieDesc.realisateur,
              ),
            ),
            ListView.builder(
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                itemCount: cinemas.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return MovieAvailable();
                })
          ],
        ),
      ),
    );
  }
}
