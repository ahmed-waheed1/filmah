import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dependency injection/get_it.dart';
import '../../../../core/helpers/request_state_enum.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/similar_movie_entity.dart';
import '../../domain/usecase/movie_details_usecase.dart';
import '../../domain/usecase/similar_movie_usecase.dart';
import 'movie_details_state.dart';

final getMovieDetailsUseCaseProvider = Provider<MovieDetailsUsecase>((ref) {
  return getIt<MovieDetailsUsecase>();
});

final getSimilarMovieUseCaseProvider = Provider<SimilarMovieUseCase>((ref) {
  return getIt<SimilarMovieUseCase>();
});

class MovieDetailsNotifier extends StateNotifier<MovieDetailsState> {
  final MovieDetailsUsecase _getMovieDetailsUsecase;
  final SimilarMovieUseCase _getSimilarUseCase;

  MovieDetailsNotifier({
    required MovieDetailsUsecase getMovieDetailsUsecase,
    required SimilarMovieUseCase getSimilarUseCase,
  }) : _getMovieDetailsUsecase = getMovieDetailsUsecase,
       _getSimilarUseCase = getSimilarUseCase,
       super(const MovieDetailsState());

  Future<void> getMovieDetails(int movieId) async {
    state = state.copyWith(movieDetailsState: RequestState.loading);

    final result = await _getMovieDetailsUsecase(
      MovieDetailsParams(movieId: movieId),
    );
    result.fold(
      (failure) => state = state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: failure.statusMessage,
      ),
      (movieDetails) => state = state.copyWith(
        movieDetail: movieDetails,
        movieDetailsState: RequestState.success,
      ),
    );
  }

  Future<void> getMovieSimilar(int movieId) async {
    state = state.copyWith(similarState: RequestState.loading);

    final result = await _getSimilarUseCase(
      SimilarMovieParams(movieId: movieId),
    );

    result.fold(
      (failure) => state = state.copyWith(
        similarState: RequestState.error,
        similarMessage: failure.statusMessage,
      ),
      (similarMovies) => state = state.copyWith(
        similar: similarMovies,
        similarState: RequestState.success,
      ),
    );
  }

  Future<void> loadMovieData(int movieId) async {
    await Future.wait([
      getMovieDetails(movieId),
      getMovieSimilar(movieId),
    ]);
  }

  Future<void> refreshMovieData(int movieId) async {
    state = const MovieDetailsState();
    await loadMovieData(movieId);
  }

  void resetState() {
    state = const MovieDetailsState();
  }
}

final movieDetailsProvider =
    StateNotifierProvider<MovieDetailsNotifier, MovieDetailsState>((ref) {
      return MovieDetailsNotifier(
        getMovieDetailsUsecase: ref.read(getMovieDetailsUseCaseProvider),
        getSimilarUseCase: ref.read(getSimilarMovieUseCaseProvider),
      );
    });

final movieDetailProvider = Provider<MovieDetailsEntity?>((ref) {
  return ref.watch(movieDetailsProvider).movieDetail;
});

final movieSimilarProvider = Provider<List<SimilarMovieEntity>>((ref) {
  return ref.watch(movieDetailsProvider).similar;
});

final movieDetailsStateProvider = Provider<RequestState>((ref) {
  return ref.watch(movieDetailsProvider).movieDetailsState;
});

final movieSimilarStateProvider = Provider<RequestState>((ref) {
  return ref.watch(movieDetailsProvider).similarState;
});

final isMovieDetailsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(movieDetailsProvider).movieDetailsState ==
      RequestState.loading;
});

final isSimilarLoadingProvider = Provider<bool>((ref) {
  return ref.watch(movieDetailsProvider).similarState == RequestState.loading;
});

final isAnyLoadingProvider = Provider<bool>((ref) {
  final state = ref.watch(movieDetailsProvider);
  return state.movieDetailsState == RequestState.loading ||
      state.similarState == RequestState.loading;
});

final movieDetailsErrorProvider = Provider<String?>((ref) {
  final state = ref.watch(movieDetailsProvider);
  return state.movieDetailsState == RequestState.error
      ? state.movieDetailsMessage
      : null;
});

final similarMoviesErrorProvider = Provider<String?>((ref) {
  final state = ref.watch(movieDetailsProvider);
  return state.similarState == RequestState.error ? state.similarMessage : null;
});

final movieDetailsFamily =
    StateNotifierProvider.family<MovieDetailsNotifier, MovieDetailsState, int>(
      (ref, movieId) {
        final notifier = MovieDetailsNotifier(
          getMovieDetailsUsecase: ref.read(getMovieDetailsUseCaseProvider),
          getSimilarUseCase: ref.read(getSimilarMovieUseCaseProvider),
        );

        Future.microtask(() => notifier.loadMovieData(movieId));

        return notifier;
      },
    );
