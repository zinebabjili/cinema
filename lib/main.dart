import 'package:cinema/theme.dart';
import 'package:flutter/material.dart';
import 'router.dart' as router;

void main() {
  runApp( MyApp(),);
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