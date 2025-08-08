import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dependency injection/get_it.dart';
import '../../../../core/helpers/request_state_enum.dart';
import '../../../../core/helpers/runtime_cache.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/usecase/base_usecase.dart';
import '../../domain/usecase/now_playing_usecase.dart';
import '../../domain/usecase/popular_movie_usecase.dart';
import '../../domain/usecase/top_rated_usecase.dart';
import 'movie_state.dart';

final getNowPlayingMoviesUseCaseProvider = Provider<NowPlayingUseCase>(
  (ref) {
    return getIt<NowPlayingUseCase>();
  },
);

final getPopularMoviesUseCaseProvider = Provider<PopularMovieUsecase>((
  ref,
) {
  return getIt<PopularMovieUsecase>();
});

final getTopRatedMoviesUseCaseProvider = Provider<TopRatedUseCase>((
  ref,
) {
  return getIt<TopRatedUseCase>();
});

class MoviesNotifier extends StateNotifier<MoviesState> {
  final NowPlayingUseCase _getNowPlayingMoviesUseCase;
  final PopularMovieUsecase _getPopularMoviesUseCase;
  final TopRatedUseCase _getTopRatedMoviesUseCase;
  final RuntimeCache _cache = RuntimeCache();

  MoviesNotifier({
    required NowPlayingUseCase getNowPlayingMoviesUseCase,
    required PopularMovieUsecase getPopularMoviesUseCase,
    required TopRatedUseCase getTopRatedMoviesUseCase,
  }) : _getNowPlayingMoviesUseCase = getNowPlayingMoviesUseCase,
       _getPopularMoviesUseCase = getPopularMoviesUseCase,
       _getTopRatedMoviesUseCase = getTopRatedMoviesUseCase,
       super(const MoviesState());

  Future<void> getNowPlayingMovies() async {
    // Check cache first
    final cachedMovies = _cache.get<List<MovieEntity>>(
      MovieCacheKeys.nowPlaying,
    );
    if (cachedMovies != null) {
      state = state.copyWith(
        nowPlayingMovies: cachedMovies,
        nowPlayingState: RequestState.success,
        nowPlayingMessage: '',
      );
      return;
    }

    state = state.copyWith(nowPlayingState: RequestState.loading);

    final result = await _getNowPlayingMoviesUseCase(NoParams());
    result.fold(
      (failure) => state = state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: failure.statusMessage,
      ),
      (movies) {
        _cache.store(MovieCacheKeys.nowPlaying, movies);
        state = state.copyWith(
          nowPlayingMovies: movies,
          nowPlayingState: RequestState.success,
          nowPlayingMessage: '',
        );
      },
    );
  }

  Future<void> getPopularMovies() async {
    final cachedMovies = _cache.get<List<MovieEntity>>(MovieCacheKeys.popular);
    if (cachedMovies != null) {
      state = state.copyWith(
        popularMovies: cachedMovies,
        popularState: RequestState.success,
      );
      return;
    }

    state = state.copyWith(popularState: RequestState.loading);

    final result = await _getPopularMoviesUseCase(NoParams());
    result.fold(
      (failure) => state = state.copyWith(
        popularState: RequestState.error,
        popularMessage: failure.statusMessage,
      ),
      (movies) {
        _cache.store(MovieCacheKeys.popular, movies);
        state = state.copyWith(
          popularMovies: movies,
          popularState: RequestState.success,
        );
      },
    );
  }

  Future<void> getTopRatedMovies() async {
    final cachedMovies = _cache.get<List<MovieEntity>>(MovieCacheKeys.topRated);
    if (cachedMovies != null) {
      state = state.copyWith(
        topRatedMovies: cachedMovies,
        topRatedState: RequestState.success,
        topRatedMessage: '',
      );
      return;
    }

    state = state.copyWith(topRatedState: RequestState.loading);

    final result = await _getTopRatedMoviesUseCase(NoParams());
    result.fold(
      (failure) => state = state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: failure.statusMessage,
      ),
      (movies) {
        _cache.store(MovieCacheKeys.topRated, movies);
        state = state.copyWith(
          topRatedMovies: movies,
          topRatedState: RequestState.success,
          topRatedMessage: '',
        );
      },
    );
  }

  Future<void> loadAllMovies() async {
    await Future.wait([
      getNowPlayingMovies(),
      getPopularMovies(),
      getTopRatedMovies(),
    ]);
  }

  Future<void> refreshAllMovies() async {
    _cache.clear(MovieCacheKeys.nowPlaying);
    _cache.clear(MovieCacheKeys.popular);
    _cache.clear(MovieCacheKeys.topRated);

    state = const MoviesState();
    await loadAllMovies();
  }

  Future<void> forceRefreshNowPlaying() async {
    _cache.clear(MovieCacheKeys.nowPlaying);
    await getNowPlayingMovies();
  }

  Future<void> forceRefreshPopular() async {
    _cache.clear(MovieCacheKeys.popular);
    await getPopularMovies();
  }

  Future<void> forceRefreshTopRated() async {
    _cache.clear(MovieCacheKeys.topRated);
    await getTopRatedMovies();
  }
}

final moviesProvider = StateNotifierProvider<MoviesNotifier, MoviesState>((
  ref,
) {
  return MoviesNotifier(
    getNowPlayingMoviesUseCase: ref.read(getNowPlayingMoviesUseCaseProvider),
    getPopularMoviesUseCase: ref.read(getPopularMoviesUseCaseProvider),
    getTopRatedMoviesUseCase: ref.read(getTopRatedMoviesUseCaseProvider),
  );
});

final nowPlayingMoviesProvider = Provider<List<MovieEntity>>((ref) {
  return ref.watch(moviesProvider).nowPlayingMovies;
});

final popularMoviesProvider = Provider<List<MovieEntity>>((ref) {
  return ref.watch(moviesProvider).popularMovies;
});

final topRatedMoviesProvider = Provider<List<MovieEntity>>((ref) {
  return ref.watch(moviesProvider).topRatedMovies;
});

final nowPlayingStateProvider = Provider<RequestState>((ref) {
  return ref.watch(moviesProvider).nowPlayingState;
});

final popularStateProvider = Provider<RequestState>((ref) {
  return ref.watch(moviesProvider).popularState;
});

final topRatedStateProvider = Provider<RequestState>((ref) {
  return ref.watch(moviesProvider).topRatedState;
});

final isAnyMovieCategoryLoadingProvider = Provider<bool>((ref) {
  final moviesState = ref.watch(moviesProvider);
  return moviesState.nowPlayingState == RequestState.loading ||
      moviesState.popularState == RequestState.loading ||
      moviesState.topRatedState == RequestState.loading;
});

final nowPlayingErrorProvider = Provider<String?>((ref) {
  final state = ref.watch(moviesProvider);
  return state.nowPlayingState == RequestState.error
      ? state.nowPlayingMessage
      : null;
});

final popularErrorProvider = Provider<String?>((ref) {
  final state = ref.watch(moviesProvider);
  return state.popularState == RequestState.error ? state.popularMessage : null;
});

final topRatedErrorProvider = Provider<String?>((ref) {
  final state = ref.watch(moviesProvider);
  return state.topRatedState == RequestState.error
      ? state.topRatedMessage
      : null;
});

// Cache status providers for debugging
final moviesCacheStatusProvider = Provider<Map<String, bool>>((ref) {
  return RuntimeCache().getCacheStatus();
});

final hasMoviesCachedDataProvider = Provider<bool>((ref) {
  final cache = RuntimeCache();
  return cache.hasValidData(MovieCacheKeys.nowPlaying) ||
      cache.hasValidData(MovieCacheKeys.popular) ||
      cache.hasValidData(MovieCacheKeys.topRated);
});
