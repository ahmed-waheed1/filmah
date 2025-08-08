import 'package:dartz/dartz.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_error_model.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/similar_movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data sources/movies_remote_data_source.dart';
import '../mapper/movie_details_mapper.dart';
import '../mapper/movie_mapper.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final NetworkInfo _networkInfo;
  MovieRepositoryImpl({
    required this.remoteDataSource,
    required NetworkInfo networkInfo,
  }) : _networkInfo = networkInfo;

  @override
  Future<Either<ApiErrorModel, MovieDetailsEntity>> getMovieDetails(
    int movieId,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final movieDetailsModel = await remoteDataSource.getMovieDetails(
          movieId: movieId,
        );
        return Right(movieDetailsModel.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      return Left(ApiErrorType.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<ApiErrorModel, List<MovieEntity>>> getNowPlayingMovies() async {
    if (await _networkInfo.isConnected) {
      try {
        final nowPlayingMoviesModel = await remoteDataSource
            .getNowPlayingMovies();
        final List<MovieEntity> movieEntities = nowPlayingMoviesModel.results!
            .map((movieModel) => movieModel.toDomain())
            .toList();
        return Right(movieEntities);
      } catch (error) {
        return Left(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      return Left(ApiErrorType.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<ApiErrorModel, List<MovieEntity>>> getPopularMovies() async {
    if (await _networkInfo.isConnected) {
      try {
        final popularMoviesModel = await remoteDataSource.getPopularMovies();
        final List<MovieEntity> movieEntities = popularMoviesModel.results!
            .map((movieModel) => movieModel.toDomain())
            .toList();
        return Right(movieEntities);
      } catch (error) {
        return Left(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      return Left(ApiErrorType.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<ApiErrorModel, List<SimilarMovieEntity>>> getSimilarMovies(
    int movieId,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final similarMoviesModel = await remoteDataSource.getSimilarMovies(
          movieId: movieId,
        );
        final List<SimilarMovieEntity> similarMovieEntities = similarMoviesModel
            .results!
            .map((movieModel) => movieModel.toSimilarDomain())
            .toList();
        return Right(similarMovieEntities);
      } catch (error) {
        return Left(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      return Left(ApiErrorType.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<ApiErrorModel, List<MovieEntity>>> getTopRatedMovies() async {
    if (await _networkInfo.isConnected) {
      try {
        final topRatedMoviesModel = await remoteDataSource.getTopRatedMovies();
        final List<MovieEntity> movieEntities = topRatedMoviesModel.results!
            .map((movieModel) => movieModel.toDomain())
            .toList();
        return Right(movieEntities);
      } catch (error) {
        return Left(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      return Left(ApiErrorType.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<ApiErrorModel, List<MovieEntity>>> getUpcomingMovies() async {
    if (await _networkInfo.isConnected) {
      try {
        final upcomingMoviesModel = await remoteDataSource.getUpcomingMovies();
        final List<MovieEntity> movieEntities = upcomingMoviesModel.results!
            .map((movieModel) => movieModel.toDomain())
            .toList();
        return Right(movieEntities);
      } catch (error) {
        return Left(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      return Left(ApiErrorType.noInternetConnection.getFailure);
    }
  }
}
