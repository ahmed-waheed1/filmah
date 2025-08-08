import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/request_state_enum.dart';
import '../../../domain/usecase/movie_details_usecase.dart';
import '../../../domain/usecase/similar_movie_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsUsecase movieDetailsUsecase;
  final SimilarMovieUseCase similarMoviesUsecase;
  MovieDetailsBloc(
    this.movieDetailsUsecase,
    this.similarMoviesUsecase,
  ) : super(const MovieDetailsState()) {
    on<MovieDetailsEvent>((event, emit) async {
      await event.when(
        getMovieDetails: (movieId) => _getMovieDetails(movieId, emit),
        getSimilarMovies: (movieId) => _getSimilarMovies(movieId, emit),
      );
    });

  }
  Future<void> _getMovieDetails(
    int movieId,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await movieDetailsUsecase(MovieDetailsParams(movieId: movieId));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.statusMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.success,
        ),
      ),
    );
  }
  Future<void> _getSimilarMovies(
    int movieId,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await similarMoviesUsecase(SimilarMovieParams(movieId: movieId));
    result.fold(
      (l) => emit(
        state.copyWith(
          similarMoviesState: RequestState.error,
          similarMoviesMessage: l.statusMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          similarMovies: r,
          similarMoviesState: RequestState.success,
        ),
      ),
    );
  }
}
