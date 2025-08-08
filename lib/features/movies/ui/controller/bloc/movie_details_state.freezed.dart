// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailsState {

 RequestState get movieDetailsState; String get movieDetailsMessage; MovieDetailsEntity? get movieDetails; RequestState get similarMoviesState; String get similarMoviesMessage; List<SimilarMovieEntity> get similarMovies;
/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailsStateCopyWith<MovieDetailsState> get copyWith => _$MovieDetailsStateCopyWithImpl<MovieDetailsState>(this as MovieDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsState&&(identical(other.movieDetailsState, movieDetailsState) || other.movieDetailsState == movieDetailsState)&&(identical(other.movieDetailsMessage, movieDetailsMessage) || other.movieDetailsMessage == movieDetailsMessage)&&(identical(other.movieDetails, movieDetails) || other.movieDetails == movieDetails)&&(identical(other.similarMoviesState, similarMoviesState) || other.similarMoviesState == similarMoviesState)&&(identical(other.similarMoviesMessage, similarMoviesMessage) || other.similarMoviesMessage == similarMoviesMessage)&&const DeepCollectionEquality().equals(other.similarMovies, similarMovies));
}


@override
int get hashCode => Object.hash(runtimeType,movieDetailsState,movieDetailsMessage,movieDetails,similarMoviesState,similarMoviesMessage,const DeepCollectionEquality().hash(similarMovies));

@override
String toString() {
  return 'MovieDetailsState(movieDetailsState: $movieDetailsState, movieDetailsMessage: $movieDetailsMessage, movieDetails: $movieDetails, similarMoviesState: $similarMoviesState, similarMoviesMessage: $similarMoviesMessage, similarMovies: $similarMovies)';
}


}

/// @nodoc
abstract mixin class $MovieDetailsStateCopyWith<$Res>  {
  factory $MovieDetailsStateCopyWith(MovieDetailsState value, $Res Function(MovieDetailsState) _then) = _$MovieDetailsStateCopyWithImpl;
@useResult
$Res call({
 RequestState movieDetailsState, String movieDetailsMessage, MovieDetailsEntity? movieDetails, RequestState similarMoviesState, String similarMoviesMessage, List<SimilarMovieEntity> similarMovies
});




}
/// @nodoc
class _$MovieDetailsStateCopyWithImpl<$Res>
    implements $MovieDetailsStateCopyWith<$Res> {
  _$MovieDetailsStateCopyWithImpl(this._self, this._then);

  final MovieDetailsState _self;
  final $Res Function(MovieDetailsState) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movieDetailsState = null,Object? movieDetailsMessage = null,Object? movieDetails = freezed,Object? similarMoviesState = null,Object? similarMoviesMessage = null,Object? similarMovies = null,}) {
  return _then(_self.copyWith(
movieDetailsState: null == movieDetailsState ? _self.movieDetailsState : movieDetailsState // ignore: cast_nullable_to_non_nullable
as RequestState,movieDetailsMessage: null == movieDetailsMessage ? _self.movieDetailsMessage : movieDetailsMessage // ignore: cast_nullable_to_non_nullable
as String,movieDetails: freezed == movieDetails ? _self.movieDetails : movieDetails // ignore: cast_nullable_to_non_nullable
as MovieDetailsEntity?,similarMoviesState: null == similarMoviesState ? _self.similarMoviesState : similarMoviesState // ignore: cast_nullable_to_non_nullable
as RequestState,similarMoviesMessage: null == similarMoviesMessage ? _self.similarMoviesMessage : similarMoviesMessage // ignore: cast_nullable_to_non_nullable
as String,similarMovies: null == similarMovies ? _self.similarMovies : similarMovies // ignore: cast_nullable_to_non_nullable
as List<SimilarMovieEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailsState].
extension MovieDetailsStatePatterns on MovieDetailsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestState movieDetailsState,  String movieDetailsMessage,  MovieDetailsEntity? movieDetails,  RequestState similarMoviesState,  String similarMoviesMessage,  List<SimilarMovieEntity> similarMovies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that.movieDetailsState,_that.movieDetailsMessage,_that.movieDetails,_that.similarMoviesState,_that.similarMoviesMessage,_that.similarMovies);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestState movieDetailsState,  String movieDetailsMessage,  MovieDetailsEntity? movieDetails,  RequestState similarMoviesState,  String similarMoviesMessage,  List<SimilarMovieEntity> similarMovies)  $default,) {final _that = this;
switch (_that) {
case _MovieDetailsState():
return $default(_that.movieDetailsState,_that.movieDetailsMessage,_that.movieDetails,_that.similarMoviesState,_that.similarMoviesMessage,_that.similarMovies);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestState movieDetailsState,  String movieDetailsMessage,  MovieDetailsEntity? movieDetails,  RequestState similarMoviesState,  String similarMoviesMessage,  List<SimilarMovieEntity> similarMovies)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that.movieDetailsState,_that.movieDetailsMessage,_that.movieDetails,_that.similarMoviesState,_that.similarMoviesMessage,_that.similarMovies);case _:
  return null;

}
}

}

/// @nodoc


class _MovieDetailsState implements MovieDetailsState {
  const _MovieDetailsState({this.movieDetailsState = RequestState.loading, this.movieDetailsMessage = '', this.movieDetails = null, this.similarMoviesState = RequestState.loading, this.similarMoviesMessage = '', final  List<SimilarMovieEntity> similarMovies = const <SimilarMovieEntity>[]}): _similarMovies = similarMovies;
  

@override@JsonKey() final  RequestState movieDetailsState;
@override@JsonKey() final  String movieDetailsMessage;
@override@JsonKey() final  MovieDetailsEntity? movieDetails;
@override@JsonKey() final  RequestState similarMoviesState;
@override@JsonKey() final  String similarMoviesMessage;
 final  List<SimilarMovieEntity> _similarMovies;
@override@JsonKey() List<SimilarMovieEntity> get similarMovies {
  if (_similarMovies is EqualUnmodifiableListView) return _similarMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_similarMovies);
}


/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailsStateCopyWith<_MovieDetailsState> get copyWith => __$MovieDetailsStateCopyWithImpl<_MovieDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailsState&&(identical(other.movieDetailsState, movieDetailsState) || other.movieDetailsState == movieDetailsState)&&(identical(other.movieDetailsMessage, movieDetailsMessage) || other.movieDetailsMessage == movieDetailsMessage)&&(identical(other.movieDetails, movieDetails) || other.movieDetails == movieDetails)&&(identical(other.similarMoviesState, similarMoviesState) || other.similarMoviesState == similarMoviesState)&&(identical(other.similarMoviesMessage, similarMoviesMessage) || other.similarMoviesMessage == similarMoviesMessage)&&const DeepCollectionEquality().equals(other._similarMovies, _similarMovies));
}


@override
int get hashCode => Object.hash(runtimeType,movieDetailsState,movieDetailsMessage,movieDetails,similarMoviesState,similarMoviesMessage,const DeepCollectionEquality().hash(_similarMovies));

@override
String toString() {
  return 'MovieDetailsState(movieDetailsState: $movieDetailsState, movieDetailsMessage: $movieDetailsMessage, movieDetails: $movieDetails, similarMoviesState: $similarMoviesState, similarMoviesMessage: $similarMoviesMessage, similarMovies: $similarMovies)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailsStateCopyWith<$Res> implements $MovieDetailsStateCopyWith<$Res> {
  factory _$MovieDetailsStateCopyWith(_MovieDetailsState value, $Res Function(_MovieDetailsState) _then) = __$MovieDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState movieDetailsState, String movieDetailsMessage, MovieDetailsEntity? movieDetails, RequestState similarMoviesState, String similarMoviesMessage, List<SimilarMovieEntity> similarMovies
});




}
/// @nodoc
class __$MovieDetailsStateCopyWithImpl<$Res>
    implements _$MovieDetailsStateCopyWith<$Res> {
  __$MovieDetailsStateCopyWithImpl(this._self, this._then);

  final _MovieDetailsState _self;
  final $Res Function(_MovieDetailsState) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieDetailsState = null,Object? movieDetailsMessage = null,Object? movieDetails = freezed,Object? similarMoviesState = null,Object? similarMoviesMessage = null,Object? similarMovies = null,}) {
  return _then(_MovieDetailsState(
movieDetailsState: null == movieDetailsState ? _self.movieDetailsState : movieDetailsState // ignore: cast_nullable_to_non_nullable
as RequestState,movieDetailsMessage: null == movieDetailsMessage ? _self.movieDetailsMessage : movieDetailsMessage // ignore: cast_nullable_to_non_nullable
as String,movieDetails: freezed == movieDetails ? _self.movieDetails : movieDetails // ignore: cast_nullable_to_non_nullable
as MovieDetailsEntity?,similarMoviesState: null == similarMoviesState ? _self.similarMoviesState : similarMoviesState // ignore: cast_nullable_to_non_nullable
as RequestState,similarMoviesMessage: null == similarMoviesMessage ? _self.similarMoviesMessage : similarMoviesMessage // ignore: cast_nullable_to_non_nullable
as String,similarMovies: null == similarMovies ? _self._similarMovies : similarMovies // ignore: cast_nullable_to_non_nullable
as List<SimilarMovieEntity>,
  ));
}


}

// dart format on
