// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoviesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent()';
}


}

/// @nodoc
class $MoviesEventCopyWith<$Res>  {
$MoviesEventCopyWith(MoviesEvent _, $Res Function(MoviesEvent) __);
}


/// Adds pattern-matching-related methods to [MoviesEvent].
extension MoviesEventPatterns on MoviesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetNowPlayingMoviesEvent value)?  getNowPlayingMovies,TResult Function( GetPopularMoviesEvent value)?  getPopularMovies,TResult Function( GetTopRatedMoviesEvent value)?  getTopRatedMovies,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetNowPlayingMoviesEvent() when getNowPlayingMovies != null:
return getNowPlayingMovies(_that);case GetPopularMoviesEvent() when getPopularMovies != null:
return getPopularMovies(_that);case GetTopRatedMoviesEvent() when getTopRatedMovies != null:
return getTopRatedMovies(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetNowPlayingMoviesEvent value)  getNowPlayingMovies,required TResult Function( GetPopularMoviesEvent value)  getPopularMovies,required TResult Function( GetTopRatedMoviesEvent value)  getTopRatedMovies,}){
final _that = this;
switch (_that) {
case GetNowPlayingMoviesEvent():
return getNowPlayingMovies(_that);case GetPopularMoviesEvent():
return getPopularMovies(_that);case GetTopRatedMoviesEvent():
return getTopRatedMovies(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetNowPlayingMoviesEvent value)?  getNowPlayingMovies,TResult? Function( GetPopularMoviesEvent value)?  getPopularMovies,TResult? Function( GetTopRatedMoviesEvent value)?  getTopRatedMovies,}){
final _that = this;
switch (_that) {
case GetNowPlayingMoviesEvent() when getNowPlayingMovies != null:
return getNowPlayingMovies(_that);case GetPopularMoviesEvent() when getPopularMovies != null:
return getPopularMovies(_that);case GetTopRatedMoviesEvent() when getTopRatedMovies != null:
return getTopRatedMovies(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getNowPlayingMovies,TResult Function()?  getPopularMovies,TResult Function()?  getTopRatedMovies,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetNowPlayingMoviesEvent() when getNowPlayingMovies != null:
return getNowPlayingMovies();case GetPopularMoviesEvent() when getPopularMovies != null:
return getPopularMovies();case GetTopRatedMoviesEvent() when getTopRatedMovies != null:
return getTopRatedMovies();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getNowPlayingMovies,required TResult Function()  getPopularMovies,required TResult Function()  getTopRatedMovies,}) {final _that = this;
switch (_that) {
case GetNowPlayingMoviesEvent():
return getNowPlayingMovies();case GetPopularMoviesEvent():
return getPopularMovies();case GetTopRatedMoviesEvent():
return getTopRatedMovies();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getNowPlayingMovies,TResult? Function()?  getPopularMovies,TResult? Function()?  getTopRatedMovies,}) {final _that = this;
switch (_that) {
case GetNowPlayingMoviesEvent() when getNowPlayingMovies != null:
return getNowPlayingMovies();case GetPopularMoviesEvent() when getPopularMovies != null:
return getPopularMovies();case GetTopRatedMoviesEvent() when getTopRatedMovies != null:
return getTopRatedMovies();case _:
  return null;

}
}

}

/// @nodoc


class GetNowPlayingMoviesEvent implements MoviesEvent {
  const GetNowPlayingMoviesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNowPlayingMoviesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent.getNowPlayingMovies()';
}


}




/// @nodoc


class GetPopularMoviesEvent implements MoviesEvent {
  const GetPopularMoviesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPopularMoviesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent.getPopularMovies()';
}


}




/// @nodoc


class GetTopRatedMoviesEvent implements MoviesEvent {
  const GetTopRatedMoviesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTopRatedMoviesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent.getTopRatedMovies()';
}


}




// dart format on
