import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/api_error_model.dart';
import '../entities/similar_movie_entity.dart';
import '../repositories/movie_repository.dart';
import 'base_usecase.dart';

class SimilarMovieUseCase
    implements BaseUseCase<List<SimilarMovieEntity>, SimilarMovieParams> {
  final MovieRepository _movieRepository;

  SimilarMovieUseCase(this._movieRepository);

  @override
  Future<Either<ApiErrorModel, List<SimilarMovieEntity>>> call(
    SimilarMovieParams params,
  ) async {
    return await _movieRepository.getSimilarMovies(params.movieId);
  }
}

class SimilarMovieParams extends Equatable {
  final int movieId;
  const SimilarMovieParams({
    required this.movieId,
  });
  @override
  List<Object?> get props => [movieId];
}
