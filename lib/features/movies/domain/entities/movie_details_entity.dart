import 'package:equatable/equatable.dart';

import 'movie_genre_entity.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final double runTime;
  final String releaseDate;
  final List<MovieGenreEntity> genres;

  const MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.runTime,
    required this.genres,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    overview,
    voteAverage,
    runTime,
    genres,
    releaseDate,
  ];
}
