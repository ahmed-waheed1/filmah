import 'package:freezed_annotation/freezed_annotation.dart';

import 'date_range.dart';
import 'movie_model.dart';

part 'movie_response_model.freezed.dart';
part 'movie_response_model.g.dart';

@freezed
abstract class MovieResponseModel with _$MovieResponseModel {
  const factory MovieResponseModel({
    DateRange? dates,
    int? page,
    List<MovieModel>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _MovieResponseModel;

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseModelFromJson(json);
}
