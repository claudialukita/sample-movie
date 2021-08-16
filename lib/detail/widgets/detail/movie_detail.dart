import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/detail/widgets/movie_detail_view_model.dart';

class MovieDetail extends ConsumerWidget{
  @override
  Widget build(BuildContext context, watch) {
    final movieId = ModalRoute.of(context)!.settings.arguments as int;
    context.read(movieDetailViewModelProvider.notifier).loadData(movieId);
    final _state = watch(movieDetailViewModelProvider);
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.network(_state.data[0].backdrop, fit: BoxFit.cover, height: 375),
          ),
        ],
      )
    );
  }

}