import 'package:dartz/dartz.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_error_model.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/tv_show_entity.dart';
import '../../domain/repositories/tv_show_repository.dart';
import '../data sources/tv_shows_remote_data_source.dart';
import '../mapper/tv_show_mapper.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final TvShowsRemoteDataSource remoteDataSource;
  final NetworkInfo _networkInfo;

  TvShowRepositoryImpl({
    required this.remoteDataSource,
    required NetworkInfo networkInfo,
  }) : _networkInfo = networkInfo;

  @override
  Future<Either<ApiErrorModel, List<TvShowEntity>>> getOnTheAirTvShows() async {
    if (await _networkInfo.isConnected) {
      try {
        final onTheAirTvShowsModel = await remoteDataSource
            .getOnTheAirTvShows();
        final List<TvShowEntity> tvShowEntities = onTheAirTvShowsModel.results!
            .map((tvShowModel) => tvShowModel.toDomain())
            .toList();
        return Right(tvShowEntities);
      } catch (error) {
        return Left(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      return Left(ApiErrorType.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<ApiErrorModel, List<TvShowEntity>>> getPopularTvShows() async {
    if (await _networkInfo.isConnected) {
      try {
        final popularTvShowsModel = await remoteDataSource.getPopularTvShows();
        final List<TvShowEntity> tvShowEntities = popularTvShowsModel.results!
            .map((tvShowModel) => tvShowModel.toDomain())
            .toList();
        return Right(tvShowEntities);
      } catch (error) {
        return Left(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      return Left(ApiErrorType.noInternetConnection.getFailure);
    }
  }

  @override
  Future<Either<ApiErrorModel, List<TvShowEntity>>> getTopRatedTvShows() async {
    if (await _networkInfo.isConnected) {
      try {
        final topRatedTvShowsModel = await remoteDataSource
            .getTopRatedTvShows();
        final List<TvShowEntity> tvShowEntities = topRatedTvShowsModel.results!
            .map((tvShowModel) => tvShowModel.toDomain())
            .toList();
        return Right(tvShowEntities);
      } catch (error) {
        return Left(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      return Left(ApiErrorType.noInternetConnection.getFailure);
    }
  }
}
