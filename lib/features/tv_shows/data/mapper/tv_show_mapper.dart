import '../../../movies/data/mapper/mapper.dart';
import '../../domain/entities/tv_show_entity.dart';
import '../models/tv_show_model.dart';

extension TvShowMapper on TvShowModel {
  TvShowEntity toDomain() {
    return TvShowEntity(
      adult: adult.orFalse(),
      backdropPath: backdropPath.orEmpty(),
      genreIds: genreIds.orEmpty(),
      id: id.orZero(),
      originCountry: originCountry?.map((country) => country).toList() ?? [],
      originalLanguage: originalLanguage.orEmpty(),
      originalName: originalName.orEmpty(),
      overview: overview.orEmpty(),
      popularity: popularity.orZero(),
      posterPath: posterPath.orEmpty(),
      firstAirDate: firstAirDate.orNow(),
      name: name.orEmpty(),
      voteAverage: voteAverage.orZero(),
      voteCount: voteCount.orZero(),
    );
  }
}
