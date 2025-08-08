import 'package:dartz/dartz.dart';

import '../../../../core/network/api_error_model.dart';
import '../entities/tv_show_entity.dart';

abstract class TvShowRepository {
  Future<Either<ApiErrorModel, List<TvShowEntity>>> getOnTheAirTvShows();
  Future<Either<ApiErrorModel, List<TvShowEntity>>> getPopularTvShows();
  Future<Either<ApiErrorModel, List<TvShowEntity>>> getTopRatedTvShows();
}
