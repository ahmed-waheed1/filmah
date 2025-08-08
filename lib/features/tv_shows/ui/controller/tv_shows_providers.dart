import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dependency injection/get_it.dart';
import '../../../../core/helpers/request_state_enum.dart';
import '../../../../core/helpers/runtime_cache.dart';
import '../../../movies/domain/usecase/base_usecase.dart';
import '../../domain/entities/tv_show_entity.dart';
import '../../domain/usecase/on_the_air_tv_shows_usecase.dart';
import '../../domain/usecase/popular_tv_shows_usecase.dart';
import '../../domain/usecase/top_rated_tv_shows_usecase.dart';
import 'tv_shows_state.dart';

final getOnTheAirTvShowsUseCaseProvider = Provider<OnTheAirTvShowsUseCase>(
  (ref) {
    return getIt<OnTheAirTvShowsUseCase>();
  },
);

final getPopularTvShowsUseCaseProvider = Provider<PopularTvShowsUseCase>((
  ref,
) {
  return getIt<PopularTvShowsUseCase>();
});

final getTopRatedTvShowsUseCaseProvider = Provider<TopRatedTvShowsUseCase>((
  ref,
) {
  return getIt<TopRatedTvShowsUseCase>();
});

class TvShowsNotifier extends StateNotifier<TvShowsState> {
  final OnTheAirTvShowsUseCase _getOnTheAirTvShowsUseCase;
  final PopularTvShowsUseCase _getPopularTvShowsUseCase;
  final TopRatedTvShowsUseCase _getTopRatedTvShowsUseCase;
  final RuntimeCache _cache = RuntimeCache();

  TvShowsNotifier({
    required OnTheAirTvShowsUseCase getOnTheAirTvShowsUseCase,
    required PopularTvShowsUseCase getPopularTvShowsUseCase,
    required TopRatedTvShowsUseCase getTopRatedTvShowsUseCase,
  }) : _getOnTheAirTvShowsUseCase = getOnTheAirTvShowsUseCase,
       _getPopularTvShowsUseCase = getPopularTvShowsUseCase,
       _getTopRatedTvShowsUseCase = getTopRatedTvShowsUseCase,
       super(const TvShowsState());

  Future<void> getOnTheAirTvShows() async {
    // Check cache first
    final cachedTvShows = _cache.get<List<TvShowEntity>>(
      TvShowCacheKeys.onTheAir,
    );
    if (cachedTvShows != null) {
      state = state.copyWith(
        onTheAirTvShows: cachedTvShows,
        onTheAirState: RequestState.success,
        onTheAirMessage: '',
      );
      return;
    }

    state = state.copyWith(onTheAirState: RequestState.loading);

    final result = await _getOnTheAirTvShowsUseCase(NoParams());
    result.fold(
      (failure) => state = state.copyWith(
        onTheAirState: RequestState.error,
        onTheAirMessage: failure.statusMessage,
      ),
      (tvShows) {
        // Store in cache
        _cache.store(TvShowCacheKeys.onTheAir, tvShows);
        state = state.copyWith(
          onTheAirTvShows: tvShows,
          onTheAirState: RequestState.success,
          onTheAirMessage: '',
        );
      },
    );
  }

  Future<void> getPopularTvShows() async {
    // Check cache first
    final cachedTvShows = _cache.get<List<TvShowEntity>>(
      TvShowCacheKeys.popular,
    );
    if (cachedTvShows != null) {
      state = state.copyWith(
        popularTvShows: cachedTvShows,
        popularState: RequestState.success,
      );
      return;
    }

    state = state.copyWith(popularState: RequestState.loading);

    final result = await _getPopularTvShowsUseCase(NoParams());
    result.fold(
      (failure) => state = state.copyWith(
        popularState: RequestState.error,
        popularMessage: failure.statusMessage,
      ),
      (tvShows) {
        // Store in cache
        _cache.store(TvShowCacheKeys.popular, tvShows);
        state = state.copyWith(
          popularTvShows: tvShows,
          popularState: RequestState.success,
        );
      },
    );
  }

  Future<void> getTopRatedTvShows() async {
    // Check cache first
    final cachedTvShows = _cache.get<List<TvShowEntity>>(
      TvShowCacheKeys.topRated,
    );
    if (cachedTvShows != null) {
      state = state.copyWith(
        topRatedTvShows: cachedTvShows,
        topRatedState: RequestState.success,
        topRatedMessage: '',
      );
      return;
    }

    state = state.copyWith(topRatedState: RequestState.loading);

    final result = await _getTopRatedTvShowsUseCase(NoParams());
    result.fold(
      (failure) => state = state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: failure.statusMessage,
      ),
      (tvShows) {
        // Store in cache
        _cache.store(TvShowCacheKeys.topRated, tvShows);
        state = state.copyWith(
          topRatedTvShows: tvShows,
          topRatedState: RequestState.success,
          topRatedMessage: '',
        );
      },
    );
  }

  Future<void> loadAllTvShows() async {
    await Future.wait([
      getOnTheAirTvShows(),
      getPopularTvShows(),
      getTopRatedTvShows(),
    ]);
  }

  Future<void> refreshAllTvShows() async {
    // Clear cache before refreshing
    _cache.clear(TvShowCacheKeys.onTheAir);
    _cache.clear(TvShowCacheKeys.popular);
    _cache.clear(TvShowCacheKeys.topRated);

    state = const TvShowsState();
    await loadAllTvShows();
  }

  // Force refresh specific categories
  Future<void> forceRefreshOnTheAir() async {
    _cache.clear(TvShowCacheKeys.onTheAir);
    await getOnTheAirTvShows();
  }

  Future<void> forceRefreshPopular() async {
    _cache.clear(TvShowCacheKeys.popular);
    await getPopularTvShows();
  }

  Future<void> forceRefreshTopRated() async {
    _cache.clear(TvShowCacheKeys.topRated);
    await getTopRatedTvShows();
  }
}

final tvShowsProvider = StateNotifierProvider<TvShowsNotifier, TvShowsState>((
  ref,
) {
  return TvShowsNotifier(
    getOnTheAirTvShowsUseCase: ref.read(getOnTheAirTvShowsUseCaseProvider),
    getPopularTvShowsUseCase: ref.read(getPopularTvShowsUseCaseProvider),
    getTopRatedTvShowsUseCase: ref.read(getTopRatedTvShowsUseCaseProvider),
  );
});

final onTheAirTvShowsProvider = Provider<List<TvShowEntity>>((ref) {
  return ref.watch(tvShowsProvider).onTheAirTvShows;
});

final popularTvShowsProvider = Provider<List<TvShowEntity>>((ref) {
  return ref.watch(tvShowsProvider).popularTvShows;
});

final topRatedTvShowsProvider = Provider<List<TvShowEntity>>((ref) {
  return ref.watch(tvShowsProvider).topRatedTvShows;
});

final onTheAirStateProvider = Provider<RequestState>((ref) {
  return ref.watch(tvShowsProvider).onTheAirState;
});

final popularStateProvider = Provider<RequestState>((ref) {
  return ref.watch(tvShowsProvider).popularState;
});

final topRatedStateProvider = Provider<RequestState>((ref) {
  return ref.watch(tvShowsProvider).topRatedState;
});

final isAnyTvShowCategoryLoadingProvider = Provider<bool>((ref) {
  final tvShowsState = ref.watch(tvShowsProvider);
  return tvShowsState.onTheAirState == RequestState.loading ||
      tvShowsState.popularState == RequestState.loading ||
      tvShowsState.topRatedState == RequestState.loading;
});

final onTheAirErrorProvider = Provider<String?>((ref) {
  final state = ref.watch(tvShowsProvider);
  return state.onTheAirState == RequestState.error
      ? state.onTheAirMessage
      : null;
});

final popularErrorProvider = Provider<String?>((ref) {
  final state = ref.watch(tvShowsProvider);
  return state.popularState == RequestState.error ? state.popularMessage : null;
});

final topRatedErrorProvider = Provider<String?>((ref) {
  final state = ref.watch(tvShowsProvider);
  return state.topRatedState == RequestState.error
      ? state.topRatedMessage
      : null;
});

// Cache status providers for debugging
final tvShowsCacheStatusProvider = Provider<Map<String, bool>>((ref) {
  return RuntimeCache().getCacheStatus();
});

final hasTvShowsCachedDataProvider = Provider<bool>((ref) {
  final cache = RuntimeCache();
  return cache.hasValidData(TvShowCacheKeys.onTheAir) ||
      cache.hasValidData(TvShowCacheKeys.popular) ||
      cache.hasValidData(TvShowCacheKeys.topRated);
});
