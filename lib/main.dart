import 'package:cinema/state_management/mainNotifier.dart';
import 'package:cinema/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router.dart' as router;

void main() {
  runApp(
  ChangeNotifierProvider<CinemaNotifier>(
    create: (BuildContext context)  => CinemaNotifier(),
    // builder: (context) => CinemaNotifier(),
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      initialRoute: '/',
      onGenerateRoute: router.generateRoute,
    );
  }
}