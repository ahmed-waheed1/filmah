import 'package:dartz/dartz.dart';

import '../../../../core/network/api_error_model.dart';
import '../../../movies/domain/usecase/base_usecase.dart';
import '../entities/tv_show_entity.dart';
import '../repositories/tv_show_repository.dart';

class TopRatedTvShowsUseCase
    implements BaseUseCase<List<TvShowEntity>, NoParams> {
  final TvShowRepository _tvShowRepository;

  TopRatedTvShowsUseCase(this._tvShowRepository);

  @override
  Future<Either<ApiErrorModel, List<TvShowEntity>>> call(
    NoParams params,
  ) async {
    return await _tvShowRepository.getTopRatedTvShows();
  }
}
