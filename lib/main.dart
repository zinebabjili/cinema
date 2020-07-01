import 'package:cinema/services/AppLocalizations.dart';
import 'package:cinema/services/locationService.dart';
import 'package:cinema/state_management/mainNotifier.dart';
import 'package:cinema/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'router.dart' as router;

void main() {
  runApp(ChangeNotifierProvider<CinemaNotifier>(
    create: (BuildContext context) => CinemaNotifier(),
    // builder: (context) => CinemaNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: MaterialApp(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('fr', '')
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocaleLanguage in supportedLocales) {
            if (supportedLocaleLanguage.languageCode == locale.languageCode &&
                supportedLocaleLanguage.countryCode == locale.countryCode) {
              return supportedLocaleLanguage;
            }
          }
          // If device not support with locale to get language code then default get first on from the list
          return supportedLocales.first;
        },
        locale: Locale('fr', ''),
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        initialRoute: '/',
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
