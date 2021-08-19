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
                      Stack(
                        children: [
                          Stack(
                            children: [
                              Image.network(_state.data![index].poster,
                                  height: 248, width: 166),
                              Container(
                                width: 166,
                                height: 248,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Color(0xFF191926),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 166,
                            height: 248,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(6),
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Color(0xFF191926),
                                      ),
                                      child: Text(
                                          _state.data![index].isAdult
                                              ? "16+"
                                              : "13+",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    ),
                                    IconButton(
                                      onPressed: () => {},
                                      icon: Icon(
                                        Icons.favorite,
                                        color:
                                            // _stateFavorite
                                            //     ?
                                            Color(0xFFFF3F6E),
                                        // : Colors.transparent, //Theme.of(context).iconTheme.color,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 166,
                                        height: 10,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _state
                                                .data![index].genres.length,
                                            itemBuilder: (context, indexGenre) {
                                              var maxGenre = _state.data![index]
                                                      .genres.length -
                                                  1;
                                              bool _useComma = true;
                                              if (indexGenre == maxGenre) {
                                                _useComma = false;
                                              }
                                              return Row(
                                                children: [
                                                  Text(
                                                      _useComma
                                                          ? "${_state.data![index].genres[indexGenre]}, "
                                                          : _state.data![index]
                                                                  .genres[
                                                              indexGenre],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                ],
                                              );
                                            }),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 15,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: 5,
                                                itemBuilder:
                                                    (context, indexGenre) {
                                                  return Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        size: 8,
                                                        color:
                                                            Color(0xFFFF3365),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          ),
                                          Text(" 98 REVIEWS",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_state.data![index].title,
                                    style:
                                        Theme.of(context).textTheme.headline2),
                                Text("${_state.data![index].runtime} MIN",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                SizedBox(height: 16),
                                Container(
                                  width: 190,
                                  height: 72,
                                  child: RichText(
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                    // strutStyle: StrutStyle(fontSize: 12, fontFamily: 'Open Sans'),
                                    text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        text: _state.data![index].overview),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                primary: Colors.transparent,
                                fixedSize: Size(159, 24),
                                padding: EdgeInsets.all(0),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xFF8036E7),
                                      Color(0xFFFF3365),
                                    ],
                                  ),
                                ),
                                child: Text('BOOK YOUR TICKET',
                                    style:
                                        Theme.of(context).textTheme.headline6),
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
