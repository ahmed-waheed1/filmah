import 'package:freezed_annotation/freezed_annotation.dart';

import 'tv_show_model.dart';

part 'tv_show_response_model.freezed.dart';
part 'tv_show_response_model.g.dart';

@freezed
abstract class TvShowResponseModel with _$TvShowResponseModel {
  const factory TvShowResponseModel({
    int? page,
    List<TvShowModel>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _TvShowResponseModel;

  factory TvShowResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowResponseModelFromJson(json);
}
