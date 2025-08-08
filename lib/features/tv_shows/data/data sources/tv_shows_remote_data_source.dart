import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_constants.dart';
import '../models/tv_show_response_model.dart';

part 'tv_shows_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class TvShowsRemoteDataSource {
  factory TvShowsRemoteDataSource(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _TvShowsRemoteDataSource;

  @GET(ApiConstants.apiAiringTodayTvShows)
  Future<TvShowResponseModel> getOnTheAirTvShows();

  @GET(ApiConstants.apiPopularTvShows)
  Future<TvShowResponseModel> getPopularTvShows();

  @GET(ApiConstants.apiTopRatedTvShows)
  Future<TvShowResponseModel> getTopRatedTvShows();
}
