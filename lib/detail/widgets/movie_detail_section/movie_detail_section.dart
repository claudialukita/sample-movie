import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/detail/widgets/movie_casts_view_model.dart';
import 'package:moviedb/detail/widgets/movie_detail_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailSection extends ConsumerWidget {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent
    //         //color set to transperent or set your own color
    //         ));
    //dipanggil ketika widget sudah ready

    // context.read(movieDetailViewModelProvider.notifier).loadData(movieId)
    final _state = watch(movieDetailViewModelProvider);
    final _stateCast = watch(movieCastViewModelProvider);
    // (_stateCast is Success) ? print(_stateCast.data[1]) : CircularProgressIndicator();

    print("coba: appbarsection");
    return (_state is Success)
        ? CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 360.0,
                floating: true,
                pinned: true,
                snap: true,
                // actionsIconTheme: IconThemeData(opacity: 0.0),
                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Image.network(
                      _state.data[0].backdrop,
                      fit: BoxFit.cover,
                      // height: 360,
                      // width: 375,
                    )),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black12,
                          ],
                        ),
                      ),
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors
                              .transparent, //Theme.of(context).iconTheme.color,
                        ),
                      ),
                      actions: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 25.0,
                            ),
                            SizedBox(width: 10)
                          ],
                        ),
                      ],
                    ),
                    FlexibleSpaceBar(
                      collapseMode: CollapseMode.none,
                      titlePadding: EdgeInsets.all(20),
                      centerTitle: true,
                      // title: Container(
                      //   alignment: Alignment.bottomLeft,
                      //   width: 375,
                      //   height: 360,
                      //   child: Text(_state.data[0].title,
                      //       style: Theme.of(context).textTheme.headline2),
                      // ),
                      background: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(_state.data[0].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                  Container(
                                    width: 200,
                                    height: 20,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _state.data[0].genres.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                child: Icon(
                                                  Icons.circle,
                                                  color: Color(0xFF777777),
                                                  size: 5.0,
                                                ),
                                              ),
                                              Text(_state.data[0].genres[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1),
                                            ],
                                          );
                                        }),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 3, 0),
                                          child: Icon(
                                            Icons.star,
                                            color: Color(0xFFF99601),
                                            size: 18,
                                          ),
                                        ),
                                        Text(_state.data[0].rating.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Text(" / 10",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 3, 0),
                                          child: Icon(
                                            Icons.thumb_up_alt_outlined,
                                            color: Color(0xFFA4A3A9),
                                            size: 18,
                                          ),
                                        ),
                                        Text(
                                            _state.data[0].voteCount
                                                .toInt()
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Text(" Users",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => {
                                      /*Navigator.pushNamed(context, '/CarsCard')*/
                                    },
                                    style: Theme.of(context)
                                        .elevatedButtonTheme
                                        .style,
                                    child: Text('Watch Now',
                                        style:
                                            Theme.of(context).textTheme.button),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  _state.data[0].poster,
                                  height: 236.0,
                                  width: 162,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return
                      Container(
                      margin: EdgeInsets.all(16),
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("sinopsis",
                              style: Theme.of(context).textTheme.headline1),
                          // Flexible(
                          //   child:
                          RichText(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            // strutStyle: StrutStyle(fontSize: 12, fontFamily: 'Open Sans'),
                            text: TextSpan(
                                style: Theme.of(context).textTheme.bodyText2,
                                text: _state.data[0].overview),
                          ),
                          // ),
                          SizedBox(height: 10),
                          Text("Trailer",
                              style: Theme.of(context).textTheme.headline1),
                          YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: 'RFZG_IG9EqA', //Add videoID.
                              flags: YoutubePlayerFlags(
                                hideControls: false,
                                controlsVisibleAtStart: true,
                                autoPlay: false,
                                mute: false,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                            // progressIndicatorColor: Color.primary,
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Cast",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                    // Opacity(
                                      // opacity: 0.5,
                                      // child:
                                      Text("See All",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    // ),

                                  ],
                                ),
                                Container(
                                  // width: 200,
                                  height: 120,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _stateCast.data[0].casts.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(4),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                    'https://www.themoviedb.org/t/p/w780' +
                                                        _stateCast.data[0]
                                                                .casts[index]
                                                            ['profile_path'],
                                                    height: 80,
                                                    width: 80,
                                                    fit: BoxFit.cover),
                                                Container(
                                                  width: 80,
                                                  child: Text(
                                                      _stateCast.data[0]
                                                          .casts[index]['name'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline4),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
              // SliverFillRemaining(
              //   child: Container(
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("sinopsis",
              //             style: Theme.of(context).textTheme.headline1),
              //         Flexible(
              //           child: RichText(
              //             maxLines: 3,
              //             overflow: TextOverflow.ellipsis,
              //             // strutStyle: StrutStyle(fontSize: 12, fontFamily: 'Open Sans'),
              //             text: TextSpan(
              //                 style: Theme.of(context).textTheme.bodyText2,
              //                 text: _state.data[0].overview),
              //           ),
              //         ),
              //         SizedBox(height: 10),
              //         Text("Trailer",
              //             style: Theme.of(context).textTheme.headline1),
              //         YoutubePlayer(
              //           controller: YoutubePlayerController(
              //             initialVideoId: 'RFZG_IG9EqA', //Add videoID.
              //             flags: YoutubePlayerFlags(
              //               hideControls: false,
              //               controlsVisibleAtStart: true,
              //               autoPlay: false,
              //               mute: false,
              //             ),
              //           ),
              //           showVideoProgressIndicator: true,
              //           // progressIndicatorColor: Color.primary,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          )
        : CircularProgressIndicator();
  }
}
