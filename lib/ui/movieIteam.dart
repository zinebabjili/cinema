import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/models/film.dart';
import 'package:cinema/services/AppLocalizations.dart';
import 'package:cinema/state_management/mainNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie.dart';

class MovieIteam extends StatelessWidget {
  final Film movieSelected;

  const MovieIteam({Key key, this.movieSelected}) : super(key: key);

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
              child: Hero(
                tag: movieSelected.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    'assets/images/films/' + movieSelected.imageUrl,
                    fit: BoxFit.fill,
                    width: 150,
                    height: 200,
                  ),
                  // CachedNetworkImage(
                  //   width: 150,
                  //   height: 200,
                  //   imageUrl:  movieSelected.imageUrl,
                  //   placeholder: (context, url) =>
                  //       new CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: CircleAvatar(
                  //       radius: 38,
                  //       backgroundColor: Colors.white,
                  //       backgroundImage: AssetImage('assets/images/158834.jpg'),
                  //     ),
                  //   ),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      movieSelected.titre,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Text(
                    movieSelected.category,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        movieSelected.duree.floor().toString() + " h",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.access_time,
                        color: Colors.grey,
                        size: 25.0,
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*.08),

                  RaisedButton(
                      textColor: Colors.white,
                      color: Colors.deepOrange,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 10.0),
                        child: Text(
                          AppLocalizations.of(context).translate('view_movie'),
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                      onPressed: () async {
                        // loadMoviesDetails
                        initialData() async{
                         Provider.of<CinemaNotifier>(context,listen: false).loadMoviesDetails(movieSelected.id);
                        }
                        initialData().then((value){
                          Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Movie(movieDesc: movieSelected )));
                        });
                        
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
