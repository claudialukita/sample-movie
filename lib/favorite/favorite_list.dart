import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/detail/view_model/favorite_list_view_model.dart';

class FavoriteList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _state = watch(favoriteListViewModelProvider);
    return (_state is Success)
        ? Container(
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _state.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(14),
                  width: 351,
                  height: 250,
                  child: Row(
                    children: [
                      Image.network(_state.data![index].poster,
                          height: 248),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_state.data![index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2),
                            Text("${_state.data![index].runtime} MIN",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5),
                            SizedBox(height: 16),
                            Container(
                              width: 190,
                              height: 72,
                              child: RichText(
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                // strutStyle: StrutStyle(fontSize: 12, fontFamily: 'Open Sans'),
                                text: TextSpan(
                                    style: Theme.of(context).textTheme.headline6,
                                    text: _state.data![index].overview),
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          )
        : CircularProgressIndicator();
  }
}
