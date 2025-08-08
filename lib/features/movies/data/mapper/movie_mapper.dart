import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/similar_movie_entity.dart';
import '../models/movie_model.dart';
import 'mapper.dart';

extension MovieMapper on MovieModel {
  MovieEntity toDomain() {
    return MovieEntity(
      adult: adult.orFalse(),
      backdropPath: backdropPath.orEmpty(),
      genreIds: genreIds.orEmpty(),
      id: id.orZero(),
      originalLanguage: originalLanguage.orEmpty(),
      originalTitle: originalTitle.orEmpty(),
      overview: overview.orEmpty(),
      popularity: popularity.orZero(),
      posterPath: posterPath.orEmpty(),
      releaseDate: releaseDate.orNow(),
      title: title.orEmpty(),
      video: video.orFalse(),
      voteAverage: voteAverage.orZero(),
      voteCount: voteCount.orZero(),
    );
  }

  SimilarMovieEntity toSimilarDomain() {
    return SimilarMovieEntity(
      id: id.orZero(),
      title: title.orEmpty(),
      backdropPath: backdropPath.orEmpty(),
    );
  }
}
