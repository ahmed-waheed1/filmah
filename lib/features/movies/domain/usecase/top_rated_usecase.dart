import 'package:dartz/dartz.dart';

import '../../../../core/network/api_error_model.dart';
import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';
import 'base_usecase.dart';

class TopRatedUseCase implements BaseUseCase<List<MovieEntity>, NoParams> {
  final MovieRepository _movieRepository;

  TopRatedUseCase(this._movieRepository);

  @override
  Future<Either<ApiErrorModel, List<MovieEntity>>> call(NoParams params) async {
    return await _movieRepository.getTopRatedMovies();
  }
}
