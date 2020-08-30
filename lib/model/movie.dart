part of 'model.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final double voteAverenge;
  final String overview;
  final String posterPath;
  final String backdropPath;

  Movie(
      {@required this.id,
      @required this.title,
      @required this.voteAverenge,
      @required this.overview,
      @required this.posterPath,
      @required this.backdropPath});

  factory Movie.fromJson(Map<String, dynamic> json)=> Movie(id: json['id'],title: json['title'],voteAverenge: (json['vote_average'] as num).toDouble(),
  overview: json['overview'],posterPath: json['poster_path'],backdropPath: json['backdrop_path']);

  @override
 
  List<Object> get props =>
      [id, title, voteAverenge, overview, posterPath, backdropPath];
}
