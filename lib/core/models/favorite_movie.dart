class FavoriteMovie{
  final String? id;
  // final Map<int, dynamic> id;

  FavoriteMovie(this.id);

  FavoriteMovie.fromJson(Map<int, dynamic> json)
      : id = json['id'];

  Map<int, dynamic> toJson() => {
    0 : id
  };

}



