import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/providers/analytics_provider.dart';
import 'package:moviedb/main_tab/main_tab_screen.dart';
import 'package:moviedb/main_tab/main_tab_view_model.dart';

import 'detail/movie_detail_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  Future<void> setupInteractedMessage(BuildContext context) async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("coba: msg firebase");
      print(message.data['path']);
      print(message.data['arguments']);
      if (message.data['path'] != null) {
        if (message.data['arguments'] != null) {
          navigatorKey.currentState!.pushNamed(message.data['path'],
              arguments: int.parse(message.data['arguments']));
        } else {
          if (message.data['path'] == "/FavoriteScreen") {
            context.read(mainTabViewModelProvider.notifier).setTab(1);
          } else {
            navigatorKey.currentState!.pushNamed(message.data['path']);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await setupInteractedMessage(context);
    });
    return MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Movie Data',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Open Sans',
          scaffoldBackgroundColor: Color.fromRGBO(25, 25, 38, 100),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 21, color: Colors.white, fontWeight: FontWeight.w700),
            headline2: TextStyle(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.w700),
            subtitle1: TextStyle(fontSize: 13, color: Colors.white),
            bodyText1: TextStyle(fontSize: 13, color: Color(0xFF777777)),
            bodyText2:
                TextStyle(fontSize: 12, color: Color(0xFFDEDDDF), height: 1.8),
            headline3: TextStyle(
                fontSize: 14, color: Color(0xFFECECEC), letterSpacing: -0.17),
            headline4: TextStyle(
                fontSize: 12,
                color: Color(0xFFD8D8D8),
                fontWeight: FontWeight.w700),
            headline5: TextStyle(fontSize: 10, color: Color(0xFF565665)),
            headline6: TextStyle(fontSize: 10, color: Colors.white),
            overline: TextStyle(fontSize: 8, color: Color(0xFFFF3466)),
            button: TextStyle(
                fontSize: 14,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold),
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
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: context.read(analyticsProvider)),
        ],
        routes: {
          '/': (context) => MainTabScreen(),
          '/MovieDetailScreen': (context) => MovieDetailScreen(),
        });
  }
}
