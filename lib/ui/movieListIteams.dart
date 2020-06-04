import 'package:cinema/models/city.dart';
import 'package:cinema/models/film.dart';
import 'package:cinema/state_management/mainNotifier.dart';
import 'package:cinema/ui/movieIteam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieListIteams extends StatefulWidget {
  final City currentCity;

  const MovieListIteams({Key key, this.currentCity}) : super(key: key);

  @override
  _MovieListIteamsState createState() => _MovieListIteamsState(currentCity);
}

class _MovieListIteamsState extends State<MovieListIteams> {
  City currentCity;
  TextEditingController searchController;
  bool isShearching;
  _MovieListIteamsState(this.currentCity);

  @override
  void initState() {
    super.initState();
    isShearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: !isShearching
            ? Text(
                "Movie List ",
                style: TextStyle(fontSize: 22),
              )
            : SearchInput(
                editingController: searchController,
                currentCity: currentCity,
              ),
        actions: <Widget>[
          !isShearching
              ? GestureDetector(
                  onTap: () {
                    this.setState(() {
                      isShearching = true;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Provider.of<CinemaNotifier>(context, listen: false).labelSearch = "";
                    Provider.of<CinemaNotifier>(context, listen: false).loadMovies(currentCity.id);
                    this.setState(() {
                      isShearching = false;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .05,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Results : " + currentCity.name,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            StreamBuilder<List<Film>>(
              stream: Provider.of<CinemaNotifier>(context)
                  .loadMovies(currentCity.id),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  if (snapshot.data.length != 0) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .85,
                      child: ListView.builder(
                          controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return MovieIteam(movieSelected : snapshot.data[index]);
                          }),
                    );
                  } else {
                    return Container(
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            CircularProgressIndicator(
                                backgroundColor: Colors.black),
                            Text("Data is loading please wait for it",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0)),
                          ],
                        ));
                  }
                } else {
                  return Container(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          CircularProgressIndicator(
                              backgroundColor: Colors.black),
                          Text("Data is loading please wait for it",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0)),
                        ],
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatefulWidget {
  final City currentCity;
  final TextEditingController editingController;

  const SearchInput({Key key, this.editingController, this.currentCity}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState(currentCity,editingController);
}

class _SearchInputState extends State<SearchInput> {
  final City currentCity;
  final TextEditingController editingController;

  _SearchInputState(this.currentCity,this.editingController);

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onSubmitted: (value) {
          print("168 : " + value);
          Provider.of<CinemaNotifier>(context, listen: false).setNewFilmsSearch(currentCity.id,value);
          // Provider.of<CinemaNotifier>(context,listen: false).setNewFilmsSearch();
        },
        controller: editingController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }
}
