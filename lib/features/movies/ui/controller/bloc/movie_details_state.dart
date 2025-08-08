import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/helpers/request_state_enum.dart';
import '../../../domain/entities/movie_details_entity.dart';
import '../../../domain/entities/similar_movie_entity.dart';

part 'movie_details_state.freezed.dart';

@freezed
abstract class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState({
    @Default(RequestState.loading) RequestState movieDetailsState,
    @Default('') String movieDetailsMessage,
    @Default(null) MovieDetailsEntity? movieDetails,
    @Default(RequestState.loading) RequestState similarMoviesState,
    @Default('') String similarMoviesMessage,
    @Default(<SimilarMovieEntity>[]) List<SimilarMovieEntity> similarMovies,
  }) = _MovieDetailsState;
}
