import 'package:cinema/styles.dart';
import 'package:flutter/material.dart';

class MovieAvailable extends StatefulWidget {
  @override
  MovieAvailableState createState() => MovieAvailableState();
}

class MovieAvailableState extends State<MovieAvailable> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
                  child: Text("Available on IMAX", style: TitleTextStyle , textAlign: TextAlign.start,),
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
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Icon(Icons.room, color: Colors.black,)
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Press Me"),
                                ],
                              ),
                            ),
                            onPressed: (){print("weslt");},
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                          ),
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
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Icon(Icons.access_alarm, color: Colors.black,)
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Press Me"),
                                ],
                              ),
                            ),
                            onPressed: (){print("weslt");},
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                          ),
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
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Icon(Icons.child_care , color: Colors.black,)
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Press Me"),
                                ],
                              ),
                            ),
                            onPressed: (){print("weslt");},
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                          ),
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
                                padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0),
                                child: Text("Reserve", 
                                  style: TextStyle(
                                    fontSize: 16.0
                                  ),
                                ),
                              ),
                              onPressed: (){print("resrve");},
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0))
                          ),
                          SizedBox(height:15),
                          Text("Price : \$ 120",
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
      ]
    );
  }
}
