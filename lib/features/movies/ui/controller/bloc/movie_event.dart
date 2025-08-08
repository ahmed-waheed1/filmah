import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_event.freezed.dart';
@freezed
abstract class MoviesEvent with _$MoviesEvent {
  const factory MoviesEvent.getNowPlayingMovies() = GetNowPlayingMoviesEvent;
  const factory MoviesEvent.getPopularMovies() = GetPopularMoviesEvent;
  const factory MoviesEvent.getTopRatedMovies() = GetTopRatedMoviesEvent;
}
