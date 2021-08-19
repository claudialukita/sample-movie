import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/detail/widgets/movie_detail_view_model.dart';

class FavoriteList extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _state = watch(movieDetailViewModelProvider);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _state.data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(top: 5, left: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(
                      context, '/MovieDetailScreen', arguments: _state.data[index].id)
                },
                child: Image.network(_state.data[index].poster,
                    height: 300, width: 150),
              ));
        });
  }

}