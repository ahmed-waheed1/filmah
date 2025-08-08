import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_constants.dart';
import '../models/movie_details_model.dart';
import '../models/movie_response_model.dart';

part 'movies_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class MoviesRemoteDataSource {
  factory MoviesRemoteDataSource(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _MoviesRemoteDataSource;
  @GET(ApiConstants.apiNowPlayingMovies)
  Future<MovieResponseModel> getNowPlayingMovies();
  @GET(ApiConstants.apiPopularMovies)
  Future<MovieResponseModel> getPopularMovies();
  @GET(ApiConstants.apiTopRatedMovies)
  Future<MovieResponseModel> getTopRatedMovies();
  @GET(ApiConstants.apiUpcomingMovies)
  Future<MovieResponseModel> getUpcomingMovies();
  @GET(ApiConstants.apiMovieDetails)
  Future<MovieDetailsModel> getMovieDetails({
    @Path('movie_id') required int movieId,
  });
  @GET(ApiConstants.apiMovieSimilar)
  Future<MovieResponseModel> getSimilarMovies({
    @Path('movie_id') required int movieId,
  });
}
