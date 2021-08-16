import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/detail/widgets/app_bar/app_bar.dart';
import 'package:moviedb/detail/widgets/movie_detail_view_model.dart';

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
    // final movieId = ModalRoute.of(context)!.settings.arguments as int;
    // context.read(movieDetailViewModelProvider.notifier).loadData(movieId);
    // final _state = watch(movieDetailViewModelProvider);

    // if (_state is Loading) {
    //   print("coba: loading");
    // } else {
    //   print("coba: success");
    // }
    return Scaffold(
      body:
          AppBarSection(),
      );
  }
}
