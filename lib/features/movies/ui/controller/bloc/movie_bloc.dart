import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/request_state_enum.dart';
import '../../../domain/usecase/base_usecase.dart';
import '../../../domain/usecase/now_playing_usecase.dart';
import '../../../domain/usecase/popular_movie_usecase.dart';
import '../../../domain/usecase/top_rated_usecase.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final NowPlayingUseCase getNowPlayingMoviesUseCase;
  final PopularMovieUsecase getPopularMoviesUseCase;
  final TopRatedUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<MoviesEvent>((event, emit) async {
      await event.when(
        getNowPlayingMovies: () => _getNowPlayingMovies(event, emit),
        getPopularMovies: () => _getPopularMovies(event, emit),
        getTopRatedMovies: () => _getTopRatedMovies(event, emit),
      );
    });
  }

  FutureOr<void> _getNowPlayingMovies(
    MoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMoviesUseCase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.statusMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
    MoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularMoviesUseCase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.statusMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
    MoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUseCase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMessage: l.statusMessage,
          topRatedState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.success,
        ),
      ),
    );
  }
}
