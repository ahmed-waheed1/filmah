import '../../domain/entities/movie_details_entity.dart';
import '../models/movie_details_model.dart';
import 'mapper.dart';

extension MovieDetailsMapper on MovieDetailsModel {
  MovieDetailsEntity toDomain() {
    return MovieDetailsEntity(
      id: id.orZero(),
      title: title.orEmpty(),
      backdropPath: backdropPath.orEmpty(),
      overview: overview.orEmpty(),
      voteAverage: voteAverage.orZero(),
      runTime: runTime.orZero(),
      genres: genres.orEmpty(),
      releaseDate: releaseDate.orEmpty(),
    );
  }
}
