import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/detail/view_model/favorite_list_view_model.dart';
import 'package:moviedb/favorite/widgets/favorite_list.dart';
import 'package:moviedb/main_tab/main_tab_view_model.dart';

class FavoriteScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context, watch) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(favoriteListViewModelProvider.notifier).loadData();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favorite Movies',
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () =>
              context.read(mainTabViewModelProvider.notifier).setTab(0),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors
                .white,
          ),
        ),
      ),
      body: FavoriteList(),
    );
  }
}