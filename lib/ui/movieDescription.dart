import 'package:cinema/styles.dart';
import 'package:flutter/material.dart';

class MovieDescription extends StatefulWidget {
  @override
  _MovieDescriptionState createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  var seeMoreIsSelected;
  static const double _hPad = 16.0;
  @override
  void initState() {
    super.initState();
    seeMoreIsSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, 4.0),
          child: Text("Resume", style: TitleTextStyle),
        ),
        (seeMoreIsSelected == 0)
            ? Container(
                padding:
                    const EdgeInsets.fromLTRB(_hPad, 05.0, _hPad, 4.0),
                child: Text(
                  "bla bla bla bla bla bla bla bla bla bla bla blabla bla bla ()bla bla bla bla bla bla bla blabla bla bla bla bla bla bla bla bla bla bla bla",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : Container(
                padding:
                    const EdgeInsets.fromLTRB(_hPad, 05.0, _hPad, 4.0),
                child: Text(
                    "bla bla bla bla bla bla bla bla bla bla bla blabla bla bla ()bla bla bla bla bla bla bla blabla bla bla bla bla bla bla bla bla bla bla bla",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[600],
                    )),
              ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (seeMoreIsSelected == 0) {
                seeMoreIsSelected = 1;
              } else {
                seeMoreIsSelected = 0;
              }
            });
          },
          child: (seeMoreIsSelected == 0)
              ? Text(
                  "See More!",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                )
              : Text(
                  "See Less!",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
      ],
    );
  }
}
