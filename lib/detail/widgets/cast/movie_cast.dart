import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieCastSection extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Column(
      children: [
        Text("Sinopsis", style: Theme.of(context).textTheme.headline1),
      ],
    );
  }

}