import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/providers/analytics_provider.dart';


class PeopleScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(analyticsProvider).logEvent(name: 'people_screen');
    });

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('People Screen'),
      ),
    );
  }
}