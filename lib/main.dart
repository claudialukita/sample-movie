import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/detail/widgets/movie_detail_screen.dart';
import 'package:moviedb/movie/movie_screen.dart';

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
              headline2: TextStyle(color: Colors.white),
              headline1: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w700),
              subtitle1: TextStyle(fontSize: 13, color: Colors.white),
              bodyText1: TextStyle(fontSize: 13, color: Color(0xFF777777)),
              bodyText2: TextStyle(fontSize: 12,color: Color(0xFFDEDDDF), height: 1.8),
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
        // home: MainTabScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => MovieScreen(),
          '/MovieDetailScreen': (context) => MovieDetailScreen(),
        });
  }
}
