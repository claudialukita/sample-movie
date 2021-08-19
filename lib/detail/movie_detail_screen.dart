import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/detail/view_model/movie_detail_view_model.dart';
import 'package:moviedb/detail/view_model/movie_casts_view_model.dart';
import 'package:moviedb/detail/widgets/movie_detail_section.dart';

class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
          //color set to transperent or set your own color
        )
    );
    var movieId = ModalRoute.of(context)!.settings.arguments as int;
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(movieDetailViewModelProvider.notifier).loadData(movieId);
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(movieCastViewModelProvider.notifier).loadData(movieId);
    });

    return Scaffold(
      body:
          MovieDetailSection(),
      );
  }
}
