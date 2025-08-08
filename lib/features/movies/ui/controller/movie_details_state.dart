import 'package:equatable/equatable.dart';
import '../../../../core/helpers/request_state_enum.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/similar_movie_entity.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.similar = const [],
    this.similarState = RequestState.loading,
    this.similarMessage = '',
  });

  final MovieDetailsEntity? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<SimilarMovieEntity> similar;
  final RequestState similarState;
  final String similarMessage;

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<SimilarMovieEntity>? similar,
    RequestState? similarState,
    String? similarMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      similar: similar ?? this.similar,
      similarState: similarState ?? this.similarState,
      similarMessage: similarMessage ?? this.similarMessage,
    );
  }

  @override
  List<Object?> get props => [
    movieDetail,
    movieDetailsState,
    movieDetailsMessage,
    similar,
    similarState,
    similarMessage,
  ];
}
