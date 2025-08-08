// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoviesState {

 List<MovieEntity> get nowPlayingMovies; RequestState get nowPlayingState; String get nowPlayingMessage; List<MovieEntity> get popularMovies; RequestState get popularState; String get popularMessage; List<MovieEntity> get topRatedMovies; RequestState get topRatedState; String get topRatedMessage;
/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoviesStateCopyWith<MoviesState> get copyWith => _$MoviesStateCopyWithImpl<MoviesState>(this as MoviesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesState&&const DeepCollectionEquality().equals(other.nowPlayingMovies, nowPlayingMovies)&&(identical(other.nowPlayingState, nowPlayingState) || other.nowPlayingState == nowPlayingState)&&(identical(other.nowPlayingMessage, nowPlayingMessage) || other.nowPlayingMessage == nowPlayingMessage)&&const DeepCollectionEquality().equals(other.popularMovies, popularMovies)&&(identical(other.popularState, popularState) || other.popularState == popularState)&&(identical(other.popularMessage, popularMessage) || other.popularMessage == popularMessage)&&const DeepCollectionEquality().equals(other.topRatedMovies, topRatedMovies)&&(identical(other.topRatedState, topRatedState) || other.topRatedState == topRatedState)&&(identical(other.topRatedMessage, topRatedMessage) || other.topRatedMessage == topRatedMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nowPlayingMovies),nowPlayingState,nowPlayingMessage,const DeepCollectionEquality().hash(popularMovies),popularState,popularMessage,const DeepCollectionEquality().hash(topRatedMovies),topRatedState,topRatedMessage);

@override
String toString() {
  return 'MoviesState(nowPlayingMovies: $nowPlayingMovies, nowPlayingState: $nowPlayingState, nowPlayingMessage: $nowPlayingMessage, popularMovies: $popularMovies, popularState: $popularState, popularMessage: $popularMessage, topRatedMovies: $topRatedMovies, topRatedState: $topRatedState, topRatedMessage: $topRatedMessage)';
}


}

/// @nodoc
abstract mixin class $MoviesStateCopyWith<$Res>  {
  factory $MoviesStateCopyWith(MoviesState value, $Res Function(MoviesState) _then) = _$MoviesStateCopyWithImpl;
@useResult
$Res call({
 List<MovieEntity> nowPlayingMovies, RequestState nowPlayingState, String nowPlayingMessage, List<MovieEntity> popularMovies, RequestState popularState, String popularMessage, List<MovieEntity> topRatedMovies, RequestState topRatedState, String topRatedMessage
});




}
/// @nodoc
class _$MoviesStateCopyWithImpl<$Res>
    implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._self, this._then);

  final MoviesState _self;
  final $Res Function(MoviesState) _then;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nowPlayingMovies = null,Object? nowPlayingState = null,Object? nowPlayingMessage = null,Object? popularMovies = null,Object? popularState = null,Object? popularMessage = null,Object? topRatedMovies = null,Object? topRatedState = null,Object? topRatedMessage = null,}) {
  return _then(_self.copyWith(
nowPlayingMovies: null == nowPlayingMovies ? _self.nowPlayingMovies : nowPlayingMovies // ignore: cast_nullable_to_non_nullable
as List<MovieEntity>,nowPlayingState: null == nowPlayingState ? _self.nowPlayingState : nowPlayingState // ignore: cast_nullable_to_non_nullable
as RequestState,nowPlayingMessage: null == nowPlayingMessage ? _self.nowPlayingMessage : nowPlayingMessage // ignore: cast_nullable_to_non_nullable
as String,popularMovies: null == popularMovies ? _self.popularMovies : popularMovies // ignore: cast_nullable_to_non_nullable
as List<MovieEntity>,popularState: null == popularState ? _self.popularState : popularState // ignore: cast_nullable_to_non_nullable
as RequestState,popularMessage: null == popularMessage ? _self.popularMessage : popularMessage // ignore: cast_nullable_to_non_nullable
as String,topRatedMovies: null == topRatedMovies ? _self.topRatedMovies : topRatedMovies // ignore: cast_nullable_to_non_nullable
as List<MovieEntity>,topRatedState: null == topRatedState ? _self.topRatedState : topRatedState // ignore: cast_nullable_to_non_nullable
as RequestState,topRatedMessage: null == topRatedMessage ? _self.topRatedMessage : topRatedMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MoviesState].
extension MoviesStatePatterns on MoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoviesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoviesState value)  $default,){
final _that = this;
switch (_that) {
case _MoviesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoviesState value)?  $default,){
final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MovieEntity> nowPlayingMovies,  RequestState nowPlayingState,  String nowPlayingMessage,  List<MovieEntity> popularMovies,  RequestState popularState,  String popularMessage,  List<MovieEntity> topRatedMovies,  RequestState topRatedState,  String topRatedMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that.nowPlayingMovies,_that.nowPlayingState,_that.nowPlayingMessage,_that.popularMovies,_that.popularState,_that.popularMessage,_that.topRatedMovies,_that.topRatedState,_that.topRatedMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MovieEntity> nowPlayingMovies,  RequestState nowPlayingState,  String nowPlayingMessage,  List<MovieEntity> popularMovies,  RequestState popularState,  String popularMessage,  List<MovieEntity> topRatedMovies,  RequestState topRatedState,  String topRatedMessage)  $default,) {final _that = this;
switch (_that) {
case _MoviesState():
return $default(_that.nowPlayingMovies,_that.nowPlayingState,_that.nowPlayingMessage,_that.popularMovies,_that.popularState,_that.popularMessage,_that.topRatedMovies,_that.topRatedState,_that.topRatedMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MovieEntity> nowPlayingMovies,  RequestState nowPlayingState,  String nowPlayingMessage,  List<MovieEntity> popularMovies,  RequestState popularState,  String popularMessage,  List<MovieEntity> topRatedMovies,  RequestState topRatedState,  String topRatedMessage)?  $default,) {final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that.nowPlayingMovies,_that.nowPlayingState,_that.nowPlayingMessage,_that.popularMovies,_that.popularState,_that.popularMessage,_that.topRatedMovies,_that.topRatedState,_that.topRatedMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MoviesState implements MoviesState {
  const _MoviesState({final  List<MovieEntity> nowPlayingMovies = const [], this.nowPlayingState = RequestState.loading, this.nowPlayingMessage = '', final  List<MovieEntity> popularMovies = const [], this.popularState = RequestState.loading, this.popularMessage = '', final  List<MovieEntity> topRatedMovies = const [], this.topRatedState = RequestState.loading, this.topRatedMessage = ''}): _nowPlayingMovies = nowPlayingMovies,_popularMovies = popularMovies,_topRatedMovies = topRatedMovies;
  

 final  List<MovieEntity> _nowPlayingMovies;
@override@JsonKey() List<MovieEntity> get nowPlayingMovies {
  if (_nowPlayingMovies is EqualUnmodifiableListView) return _nowPlayingMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nowPlayingMovies);
}

@override@JsonKey() final  RequestState nowPlayingState;
@override@JsonKey() final  String nowPlayingMessage;
 final  List<MovieEntity> _popularMovies;
@override@JsonKey() List<MovieEntity> get popularMovies {
  if (_popularMovies is EqualUnmodifiableListView) return _popularMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popularMovies);
}

@override@JsonKey() final  RequestState popularState;
@override@JsonKey() final  String popularMessage;
 final  List<MovieEntity> _topRatedMovies;
@override@JsonKey() List<MovieEntity> get topRatedMovies {
  if (_topRatedMovies is EqualUnmodifiableListView) return _topRatedMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topRatedMovies);
}

@override@JsonKey() final  RequestState topRatedState;
@override@JsonKey() final  String topRatedMessage;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoviesStateCopyWith<_MoviesState> get copyWith => __$MoviesStateCopyWithImpl<_MoviesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoviesState&&const DeepCollectionEquality().equals(other._nowPlayingMovies, _nowPlayingMovies)&&(identical(other.nowPlayingState, nowPlayingState) || other.nowPlayingState == nowPlayingState)&&(identical(other.nowPlayingMessage, nowPlayingMessage) || other.nowPlayingMessage == nowPlayingMessage)&&const DeepCollectionEquality().equals(other._popularMovies, _popularMovies)&&(identical(other.popularState, popularState) || other.popularState == popularState)&&(identical(other.popularMessage, popularMessage) || other.popularMessage == popularMessage)&&const DeepCollectionEquality().equals(other._topRatedMovies, _topRatedMovies)&&(identical(other.topRatedState, topRatedState) || other.topRatedState == topRatedState)&&(identical(other.topRatedMessage, topRatedMessage) || other.topRatedMessage == topRatedMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nowPlayingMovies),nowPlayingState,nowPlayingMessage,const DeepCollectionEquality().hash(_popularMovies),popularState,popularMessage,const DeepCollectionEquality().hash(_topRatedMovies),topRatedState,topRatedMessage);

@override
String toString() {
  return 'MoviesState(nowPlayingMovies: $nowPlayingMovies, nowPlayingState: $nowPlayingState, nowPlayingMessage: $nowPlayingMessage, popularMovies: $popularMovies, popularState: $popularState, popularMessage: $popularMessage, topRatedMovies: $topRatedMovies, topRatedState: $topRatedState, topRatedMessage: $topRatedMessage)';
}


}

/// @nodoc
abstract mixin class _$MoviesStateCopyWith<$Res> implements $MoviesStateCopyWith<$Res> {
  factory _$MoviesStateCopyWith(_MoviesState value, $Res Function(_MoviesState) _then) = __$MoviesStateCopyWithImpl;
@override @useResult
$Res call({
 List<MovieEntity> nowPlayingMovies, RequestState nowPlayingState, String nowPlayingMessage, List<MovieEntity> popularMovies, RequestState popularState, String popularMessage, List<MovieEntity> topRatedMovies, RequestState topRatedState, String topRatedMessage
});




}
/// @nodoc
class __$MoviesStateCopyWithImpl<$Res>
    implements _$MoviesStateCopyWith<$Res> {
  __$MoviesStateCopyWithImpl(this._self, this._then);

  final _MoviesState _self;
  final $Res Function(_MoviesState) _then;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nowPlayingMovies = null,Object? nowPlayingState = null,Object? nowPlayingMessage = null,Object? popularMovies = null,Object? popularState = null,Object? popularMessage = null,Object? topRatedMovies = null,Object? topRatedState = null,Object? topRatedMessage = null,}) {
  return _then(_MoviesState(
nowPlayingMovies: null == nowPlayingMovies ? _self._nowPlayingMovies : nowPlayingMovies // ignore: cast_nullable_to_non_nullable
as List<MovieEntity>,nowPlayingState: null == nowPlayingState ? _self.nowPlayingState : nowPlayingState // ignore: cast_nullable_to_non_nullable
as RequestState,nowPlayingMessage: null == nowPlayingMessage ? _self.nowPlayingMessage : nowPlayingMessage // ignore: cast_nullable_to_non_nullable
as String,popularMovies: null == popularMovies ? _self._popularMovies : popularMovies // ignore: cast_nullable_to_non_nullable
as List<MovieEntity>,popularState: null == popularState ? _self.popularState : popularState // ignore: cast_nullable_to_non_nullable
as RequestState,popularMessage: null == popularMessage ? _self.popularMessage : popularMessage // ignore: cast_nullable_to_non_nullable
as String,topRatedMovies: null == topRatedMovies ? _self._topRatedMovies : topRatedMovies // ignore: cast_nullable_to_non_nullable
as List<MovieEntity>,topRatedState: null == topRatedState ? _self.topRatedState : topRatedState // ignore: cast_nullable_to_non_nullable
as RequestState,topRatedMessage: null == topRatedMessage ? _self.topRatedMessage : topRatedMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
