import 'package:flutter/material.dart';

ThemeData themeData(){
  TextTheme _textTheme(TextTheme base){
    return base.copyWith(
        headline: base.headline.copyWith(
          fontFamily: 'OpenSans-Bold',
          fontSize: 30,
          color: Colors.white,
        ),

        body1: base.button.copyWith(
          fontFamily: 'OpenSans-Bold',
          fontSize: 30,
          color: Colors.deepOrange,
        ),
    );
  }

  final ThemeData base=ThemeData.light();
  return base.copyWith(
    textTheme: _textTheme(base.textTheme),
  );
}