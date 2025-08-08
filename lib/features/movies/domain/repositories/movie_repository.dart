import 'package:dartz/dartz.dart';

import '../../../../core/network/api_error_model.dart';
import '../entities/movie_details_entity.dart';
import '../entities/movie_entity.dart';
import '../entities/similar_movie_entity.dart';

abstract class MovieRepository {
  Future<Either<ApiErrorModel, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<ApiErrorModel, List<MovieEntity>>> getPopularMovies();
  Future<Either<ApiErrorModel, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<ApiErrorModel, List<MovieEntity>>> getUpcomingMovies();
  Future<Either<ApiErrorModel, MovieDetailsEntity>> getMovieDetails(
    int movieId,
  );
  Future<Either<ApiErrorModel, List<SimilarMovieEntity>>> getSimilarMovies(
    int movieId,
  );
}
