import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/helpers/request_state_enum.dart';
import '../../../domain/entities/movie_entity.dart';

part 'movie_state.freezed.dart';



@freezed
abstract class MoviesState with _$MoviesState {
  const factory MoviesState({
    @Default([]) List<MovieEntity> nowPlayingMovies,
    @Default(RequestState.loading) RequestState nowPlayingState,
    @Default('') String nowPlayingMessage,
    @Default([]) List<MovieEntity> popularMovies,
    @Default(RequestState.loading) RequestState popularState,
    @Default('') String popularMessage,
    @Default([]) List<MovieEntity> topRatedMovies,
    @Default(RequestState.loading) RequestState topRatedState,
    @Default('') String topRatedMessage,
  }) = _MoviesState;
}
