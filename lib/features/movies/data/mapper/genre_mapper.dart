import '../../domain/entities/movie_genre_entity.dart';
import '../models/genre.dart';
import 'mapper.dart';

extension GenreMapper on Genre {
  MovieGenreEntity toDomain() {
    return MovieGenreEntity(
      id: id.orZero(),
      name: name.orEmpty(),
    );
  }
}
