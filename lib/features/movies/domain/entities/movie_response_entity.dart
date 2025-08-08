import 'package:equatable/equatable.dart';

import 'movie_dates_entity.dart';
import 'movie_entity.dart';

class MovieResponseEntity extends Equatable {
  final int page;
  final List<MovieEntity> movies;
  final int totalPages;
  final int totalResults;
  final MovieDatesEntity? dates;

  const MovieResponseEntity({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
    this.dates,
  });

  @override
  List<Object?> get props => [page, movies, totalPages, totalResults, dates];

  bool get hasNextPage => page < totalPages;
  bool get hasPreviousPage => page > 1;
}
