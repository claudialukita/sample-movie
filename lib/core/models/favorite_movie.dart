class FavoriteMovie{
  final List? favorite;
  // final Map<int, dynamic> id;

  FavoriteMovie(this.favorite);

  // FavoriteMovie.fromJson(Map<String, dynamic> json)
  //     : id = json['id'];

  Map<String, dynamic> toJson() => {
    'favoriteMovie' : favorite
  };

}



