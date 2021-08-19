import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/main_tab/main_tab_screen.dart';

import 'detail/screen/movie_detail_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie Data',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Open Sans',
            scaffoldBackgroundColor: Color.fromRGBO(25, 25, 38, 100),
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w700),
              headline2: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w700),
              subtitle1: TextStyle(fontSize: 13, color: Colors.white),
              bodyText1: TextStyle(fontSize: 13, color: Color(0xFF777777)),
              bodyText2: TextStyle(fontSize: 12,color: Color(0xFFDEDDDF), height: 1.8),
              headline3: TextStyle(fontSize: 14,color: Color(0xFFECECEC), letterSpacing: -0.17),
              headline4: TextStyle(fontSize: 12,color: Color(0xFFD8D8D8), fontWeight: FontWeight.w700),
              headline5: TextStyle(fontSize: 10,color: Color(0xFF565665)),
              headline6: TextStyle(fontSize: 10,color: Colors.white),
              overline: TextStyle(fontSize: 8,color: Color(0xFFFF3466)),
              button: TextStyle(fontSize: 14,color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
            ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              primary: Color(0xFFE82626),
              fixedSize: Size(160, 30),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MainTabScreen(),
          '/MovieDetailScreen': (context) => MovieDetailScreen(),
        });
  }
}
