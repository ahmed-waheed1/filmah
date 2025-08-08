import 'package:equatable/equatable.dart';

import '../../../../core/helpers/request_state_enum.dart';
import '../../domain/entities/tv_show_entity.dart';

class TvShowsState extends Equatable {
  final List<TvShowEntity> onTheAirTvShows;
  final RequestState onTheAirState;
  final String onTheAirMessage;
  final List<TvShowEntity> popularTvShows;
  final RequestState popularState;
  final String popularMessage;
  final List<TvShowEntity> topRatedTvShows;
  final RequestState topRatedState;
  final String topRatedMessage;

  const TvShowsState({
    this.onTheAirTvShows = const [],
    this.onTheAirState = RequestState.loading,
    this.onTheAirMessage = '',
    this.popularTvShows = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedTvShows = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  TvShowsState copyWith({
    List<TvShowEntity>? onTheAirTvShows,
    RequestState? onTheAirState,
    String? onTheAirMessage,
    List<TvShowEntity>? popularTvShows,
    RequestState? popularState,
    String? popularMessage,
    List<TvShowEntity>? topRatedTvShows,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return TvShowsState(
      onTheAirTvShows: onTheAirTvShows ?? this.onTheAirTvShows,
      onTheAirState: onTheAirState ?? this.onTheAirState,
      onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
      popularTvShows: popularTvShows ?? this.popularTvShows,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedTvShows: topRatedTvShows ?? this.topRatedTvShows,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
    onTheAirTvShows,
    onTheAirState,
    onTheAirMessage,
    popularTvShows,
    popularState,
    popularMessage,
    topRatedTvShows,
    topRatedState,
    topRatedMessage,
  ];
}
