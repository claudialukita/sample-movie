class MovieDetail{
  final int id;
  final String title;
  final double rating;
  final int voteCount;
  final String poster;
  final String backdrop;
  final Map<int, dynamic> genres;
  final String overview;
  final int runtime;
  final bool isAdult;//durasi
  //review
  //star
  //age


  MovieDetail(this.id, this.title, this.rating, this.voteCount, this.poster, this.backdrop, this.genres, this.overview, this.runtime, this.isAdult);


}
