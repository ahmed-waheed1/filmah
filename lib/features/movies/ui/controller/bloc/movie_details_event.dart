import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_event.freezed.dart';

@freezed
abstract class MovieDetailsEvent with _$MovieDetailsEvent {
  const factory MovieDetailsEvent.getMovieDetails(int movieId) =
      GetMovieDetailsEvent;
  const factory MovieDetailsEvent.getSimilarMovies(int movieId) =
      GetSimilarMoviesEvent;
}
