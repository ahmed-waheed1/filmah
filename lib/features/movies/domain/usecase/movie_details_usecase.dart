import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/api_error_model.dart';
import '../entities/movie_details_entity.dart';
import '../repositories/movie_repository.dart';
import 'base_usecase.dart';

class MovieDetailsUsecase implements BaseUseCase<MovieDetailsEntity, MovieDetailsParams> {
  final MovieRepository _movieRepository;
  MovieDetailsUsecase(this._movieRepository);
  @override
  Future<Either<ApiErrorModel, MovieDetailsEntity>> call(MovieDetailsParams params) async {
    return await _movieRepository.getMovieDetails(params.movieId);
  }
}

class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams({
    required this.movieId,
  });

  @override
  List<Object?> get props => [movieId];
}
