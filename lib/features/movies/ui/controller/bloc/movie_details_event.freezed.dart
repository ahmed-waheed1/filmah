// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailsEvent {

 int get movieId;
/// Create a copy of MovieDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailsEventCopyWith<MovieDetailsEvent> get copyWith => _$MovieDetailsEventCopyWithImpl<MovieDetailsEvent>(this as MovieDetailsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsEvent&&(identical(other.movieId, movieId) || other.movieId == movieId));
}


@override
int get hashCode => Object.hash(runtimeType,movieId);

@override
String toString() {
  return 'MovieDetailsEvent(movieId: $movieId)';
}


}

/// @nodoc
abstract mixin class $MovieDetailsEventCopyWith<$Res>  {
  factory $MovieDetailsEventCopyWith(MovieDetailsEvent value, $Res Function(MovieDetailsEvent) _then) = _$MovieDetailsEventCopyWithImpl;
@useResult
$Res call({
 int movieId
});




}
/// @nodoc
class _$MovieDetailsEventCopyWithImpl<$Res>
    implements $MovieDetailsEventCopyWith<$Res> {
  _$MovieDetailsEventCopyWithImpl(this._self, this._then);

  final MovieDetailsEvent _self;
  final $Res Function(MovieDetailsEvent) _then;

/// Create a copy of MovieDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movieId = null,}) {
  return _then(_self.copyWith(
movieId: null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailsEvent].
extension MovieDetailsEventPatterns on MovieDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetMovieDetailsEvent value)?  getMovieDetails,TResult Function( GetSimilarMoviesEvent value)?  getSimilarMovies,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetMovieDetailsEvent() when getMovieDetails != null:
return getMovieDetails(_that);case GetSimilarMoviesEvent() when getSimilarMovies != null:
return getSimilarMovies(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetMovieDetailsEvent value)  getMovieDetails,required TResult Function( GetSimilarMoviesEvent value)  getSimilarMovies,}){
final _that = this;
switch (_that) {
case GetMovieDetailsEvent():
return getMovieDetails(_that);case GetSimilarMoviesEvent():
return getSimilarMovies(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetMovieDetailsEvent value)?  getMovieDetails,TResult? Function( GetSimilarMoviesEvent value)?  getSimilarMovies,}){
final _that = this;
switch (_that) {
case GetMovieDetailsEvent() when getMovieDetails != null:
return getMovieDetails(_that);case GetSimilarMoviesEvent() when getSimilarMovies != null:
return getSimilarMovies(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int movieId)?  getMovieDetails,TResult Function( int movieId)?  getSimilarMovies,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetMovieDetailsEvent() when getMovieDetails != null:
return getMovieDetails(_that.movieId);case GetSimilarMoviesEvent() when getSimilarMovies != null:
return getSimilarMovies(_that.movieId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int movieId)  getMovieDetails,required TResult Function( int movieId)  getSimilarMovies,}) {final _that = this;
switch (_that) {
case GetMovieDetailsEvent():
return getMovieDetails(_that.movieId);case GetSimilarMoviesEvent():
return getSimilarMovies(_that.movieId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int movieId)?  getMovieDetails,TResult? Function( int movieId)?  getSimilarMovies,}) {final _that = this;
switch (_that) {
case GetMovieDetailsEvent() when getMovieDetails != null:
return getMovieDetails(_that.movieId);case GetSimilarMoviesEvent() when getSimilarMovies != null:
return getSimilarMovies(_that.movieId);case _:
  return null;

}
}

}

/// @nodoc


class GetMovieDetailsEvent implements MovieDetailsEvent {
  const GetMovieDetailsEvent(this.movieId);
  

@override final  int movieId;

/// Create a copy of MovieDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetMovieDetailsEventCopyWith<GetMovieDetailsEvent> get copyWith => _$GetMovieDetailsEventCopyWithImpl<GetMovieDetailsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetMovieDetailsEvent&&(identical(other.movieId, movieId) || other.movieId == movieId));
}


@override
int get hashCode => Object.hash(runtimeType,movieId);

@override
String toString() {
  return 'MovieDetailsEvent.getMovieDetails(movieId: $movieId)';
}


}

/// @nodoc
abstract mixin class $GetMovieDetailsEventCopyWith<$Res> implements $MovieDetailsEventCopyWith<$Res> {
  factory $GetMovieDetailsEventCopyWith(GetMovieDetailsEvent value, $Res Function(GetMovieDetailsEvent) _then) = _$GetMovieDetailsEventCopyWithImpl;
@override @useResult
$Res call({
 int movieId
});




}
/// @nodoc
class _$GetMovieDetailsEventCopyWithImpl<$Res>
    implements $GetMovieDetailsEventCopyWith<$Res> {
  _$GetMovieDetailsEventCopyWithImpl(this._self, this._then);

  final GetMovieDetailsEvent _self;
  final $Res Function(GetMovieDetailsEvent) _then;

/// Create a copy of MovieDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieId = null,}) {
  return _then(GetMovieDetailsEvent(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GetSimilarMoviesEvent implements MovieDetailsEvent {
  const GetSimilarMoviesEvent(this.movieId);
  

@override final  int movieId;

/// Create a copy of MovieDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSimilarMoviesEventCopyWith<GetSimilarMoviesEvent> get copyWith => _$GetSimilarMoviesEventCopyWithImpl<GetSimilarMoviesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSimilarMoviesEvent&&(identical(other.movieId, movieId) || other.movieId == movieId));
}


@override
int get hashCode => Object.hash(runtimeType,movieId);

@override
String toString() {
  return 'MovieDetailsEvent.getSimilarMovies(movieId: $movieId)';
}


}

/// @nodoc
abstract mixin class $GetSimilarMoviesEventCopyWith<$Res> implements $MovieDetailsEventCopyWith<$Res> {
  factory $GetSimilarMoviesEventCopyWith(GetSimilarMoviesEvent value, $Res Function(GetSimilarMoviesEvent) _then) = _$GetSimilarMoviesEventCopyWithImpl;
@override @useResult
$Res call({
 int movieId
});




}
/// @nodoc
class _$GetSimilarMoviesEventCopyWithImpl<$Res>
    implements $GetSimilarMoviesEventCopyWith<$Res> {
  _$GetSimilarMoviesEventCopyWithImpl(this._self, this._then);

  final GetSimilarMoviesEvent _self;
  final $Res Function(GetSimilarMoviesEvent) _then;

/// Create a copy of MovieDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieId = null,}) {
  return _then(GetSimilarMoviesEvent(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
