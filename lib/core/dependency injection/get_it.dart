import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/movies/data/data sources/movies_remote_data_source.dart';
import '../../features/movies/data/repositories/movie_repository_impl.dart';
import '../../features/movies/domain/repositories/movie_repository.dart';
import '../../features/movies/domain/usecase/movie_details_usecase.dart';
import '../../features/movies/domain/usecase/now_playing_usecase.dart';
import '../../features/movies/domain/usecase/popular_movie_usecase.dart';
import '../../features/movies/domain/usecase/similar_movie_usecase.dart';
import '../../features/movies/domain/usecase/top_rated_usecase.dart';
import '../../features/tv_shows/data/data sources/tv_shows_remote_data_source.dart';
import '../../features/tv_shows/data/repositories/tv_show_repository_impl.dart';
import '../../features/tv_shows/domain/repositories/tv_show_repository.dart';
import '../../features/tv_shows/domain/usecase/on_the_air_tv_shows_usecase.dart';
import '../../features/tv_shows/domain/usecase/popular_tv_shows_usecase.dart';
import '../../features/tv_shows/domain/usecase/top_rated_tv_shows_usecase.dart';
import '../network/dio_factory.dart';
import '../network/network_info.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton(() => dio);
  getIt.registerLazySingleton(() => InternetConnectionChecker.instance);
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      getIt<InternetConnectionChecker>(),
    ),
  );
  getIt.registerFactory<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerFactory<TvShowsRemoteDataSource>(
    () => TvShowsRemoteDataSource(getIt<Dio>()),
  );

  getIt.registerFactory<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: getIt<MoviesRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  getIt.registerFactory<TvShowRepository>(
    () => TvShowRepositoryImpl(
      remoteDataSource: getIt<TvShowsRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  getIt.registerFactory(() => NowPlayingUseCase(getIt<MovieRepository>()));
  getIt.registerFactory(() => PopularMovieUsecase(getIt<MovieRepository>()));
  getIt.registerFactory(() => TopRatedUseCase(getIt<MovieRepository>()));
  getIt.registerFactory(() => MovieDetailsUsecase(getIt<MovieRepository>()));
  getIt.registerFactory(() => SimilarMovieUseCase(getIt<MovieRepository>()));

  getIt.registerFactory(
    () => OnTheAirTvShowsUseCase(getIt<TvShowRepository>()),
  );
  getIt.registerFactory(() => PopularTvShowsUseCase(getIt<TvShowRepository>()));
  getIt.registerFactory(
    () => TopRatedTvShowsUseCase(getIt<TvShowRepository>()),
  );
}
