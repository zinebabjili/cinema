import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';

class CurrentLoc extends StatefulWidget {
  @override
  _CurrentLocState createState() => _CurrentLocState();
}

class _CurrentLocState extends State<CurrentLoc> {
  List<Marker> _listMarker = new List();
  @override
  void initState() {
    super.initState();
    _listMarker.add(
      Marker(
        width: 75.0,
        height: 75.0,
        point: new LatLng(33.5906583, -7.579412),
        builder: (context) => new Container(
              child: Stack(
                children: <Widget>[
                  Align(
                  alignment: Alignment.topCenter,
                    child: Text(
                      'casablanca',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                      ),
                  ),
                  Center(
                    child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.orangeAccent,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Marker tapped');
                      },
                    ),
                  ),
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose Your Cinema Localisation'),
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
              options: new MapOptions(
                center: new LatLng(33.5906583, -7.579412),
                zoom: 6.0,
              ),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/shadowlight/ckc3k54f00xk01io8xf6yoore/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hhZG93bGlnaHQiLCJhIjoiY2tjM2RsOXdkMmM3dDJybGc4aTg2azF4NiJ9.eiXaHNro5WmGiry7zWBLpw",
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1Ijoic2hhZG93bGlnaHQiLCJhIjoiY2tjM2o2NHhmMTJyYzJ6bGY4M3IyZ2QycSJ9.UK_x6dlkx6qEhoFeS6zn1Q',
                      'id': 'mapbox.mapbox-streets-v8'
                    }),
                new MarkerLayerOptions(markers: _listMarker),
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () => {
                  // getCurrentLoc(model)
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.locationArrow,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Set Current Localisation',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                color: Colors.orangeAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
