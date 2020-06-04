import 'package:cinema/ui/movieIteam.dart';
import 'package:flutter/material.dart';

class MovieListIteams extends StatefulWidget {
  @override
  _MovieListIteamsState createState() => _MovieListIteamsState();
}

class _MovieListIteamsState extends State<MovieListIteams> {
  TextEditingController searchController ;
  bool isShearching;
  List<String> cinemas = ["Breaking Bad", "Breaking Bad", "Breaking Bad"];
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
        title: 
        !isShearching
        ? Text(
          "Movie List ",
          style: TextStyle(fontSize: 22),
        )
        : SearchInput (editingController: searchController,),
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
                padding: const EdgeInsets.only(top:8.0),
                child: Text(
                  "Results : 2",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .85,
              child: ListView.builder(
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  itemCount: cinemas.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return MovieIteam();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  final TextEditingController editingController;

  const SearchInput({Key key, this.editingController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onChanged: (value) {
          print(value);
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
