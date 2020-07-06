import 'package:cinema/models/city.dart';
import 'package:cinema/services/AppLocalizations.dart';
import 'package:cinema/services/locationService.dart';
import 'package:cinema/state_management/mainNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import 'movieListIteams.dart';

class CurrentLoc extends StatefulWidget {
  @override
  _CurrentLocState createState() => _CurrentLocState();
}

class _CurrentLocState extends State<CurrentLoc> {
  List<Marker> _listMarker = new List();
  @override
  void initState() {
    super.initState();
  }

  createMarkers() {
    List<City> cities = Provider.of<CinemaNotifier>(context).citiesLoad;
    for (var i = 0; i < cities.length; i++) {
      _listMarker.add(Marker(
          width: 75.0,
          height: 75.0,
          point: new LatLng(cities[i].lat, cities[i].lng),
          builder: (context) => new Container(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        cities[i].name,
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.orangeAccent,
                        iconSize: 45.0,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => MovieListIteams(
                                    currentCity: cities[i],
                                  )));
                        },
                      ),
                    ),
                  ],
                ),
              )));
    }
  }

  useCurrentLoc(UserLocation userLocation, context) async {
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(
      
        userLocation.latitude, userLocation.longitude);
    bool find = false;
    List<City> cities =
        Provider.of<CinemaNotifier>(context, listen: false).citiesLoad;
    for (var i = 0; i < cities.length; i++) {
      if (cities[i].name.toLowerCase() == placemark[0].locality.toLowerCase()) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => MovieListIteams(
                  currentCity: cities[i],
                )));
        find = true;
      }
    }
    if (!find) {
      print("NOTHING");
      reserve(context, placemark[0].locality);
      // Scaffold.of(context)
      // ..removeCurrentSnackBar()
      // ..showSnackBar(SnackBar(
      //   duration: Duration(seconds: 2),
      //   content:
      //       Text('there are no cinema in your city' + placemark[0].locality),
      // ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    createMarkers();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context).translate('select_cinema_loc')),
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
              options: new MapOptions(
                center: new LatLng(34.033333, -5.0),
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
                  useCurrentLoc(userLocation, context)
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
                        AppLocalizations.of(context).translate('set_curr_loc'),
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

reserve(context, cityName) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialoge(cityName);
      });
}

class Dialoge extends StatelessWidget {
  final String cityName;

  const Dialoge(this.cityName);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "No Film Found : " + cityName,
                style: TextStyle(
                  height: .5,
                  fontSize: 14.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.deepOrange,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)))
            ],
          ),
        ));
  }
}
