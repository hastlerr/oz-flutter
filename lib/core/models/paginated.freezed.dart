// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Paginated<T> {

 int get count;@JsonKey(name: 'num_pages') int get numPages; int? get next; int? get previous; List<T> get results;
/// Create a copy of Paginated
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedCopyWith<T, Paginated<T>> get copyWith => _$PaginatedCopyWithImpl<T, Paginated<T>>(this as Paginated<T>, _$identity);

  /// Serializes this Paginated to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Paginated<T>&&(identical(other.count, count) || other.count == count)&&(identical(other.numPages, numPages) || other.numPages == numPages)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,numPages,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'Paginated<$T>(count: $count, numPages: $numPages, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedCopyWith<T,$Res>  {
  factory $PaginatedCopyWith(Paginated<T> value, $Res Function(Paginated<T>) _then) = _$PaginatedCopyWithImpl;
@useResult
$Res call({
 int count,@JsonKey(name: 'num_pages') int numPages, int? next, int? previous, List<T> results
});




}
/// @nodoc
class _$PaginatedCopyWithImpl<T,$Res>
    implements $PaginatedCopyWith<T, $Res> {
  _$PaginatedCopyWithImpl(this._self, this._then);

  final Paginated<T> _self;
  final $Res Function(Paginated<T>) _then;

/// Create a copy of Paginated
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? numPages = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,numPages: null == numPages ? _self.numPages : numPages // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as int?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as int?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

}


/// Adds pattern-matching-related methods to [Paginated].
extension PaginatedPatterns<T> on Paginated<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Paginated<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Paginated() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Paginated<T> value)  $default,){
final _that = this;
switch (_that) {
case _Paginated():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Paginated<T> value)?  $default,){
final _that = this;
switch (_that) {
case _Paginated() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count, @JsonKey(name: 'num_pages')  int numPages,  int? next,  int? previous,  List<T> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Paginated() when $default != null:
return $default(_that.count,_that.numPages,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count, @JsonKey(name: 'num_pages')  int numPages,  int? next,  int? previous,  List<T> results)  $default,) {final _that = this;
switch (_that) {
case _Paginated():
return $default(_that.count,_that.numPages,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count, @JsonKey(name: 'num_pages')  int numPages,  int? next,  int? previous,  List<T> results)?  $default,) {final _that = this;
switch (_that) {
case _Paginated() when $default != null:
return $default(_that.count,_that.numPages,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Paginated<T> implements Paginated<T> {
  const _Paginated({required this.count, @JsonKey(name: 'num_pages') required this.numPages, this.next, this.previous, required final  List<T> results}): _results = results;
  factory _Paginated.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginatedFromJson(json,fromJsonT);

@override final  int count;
@override@JsonKey(name: 'num_pages') final  int numPages;
@override final  int? next;
@override final  int? previous;
 final  List<T> _results;
@override List<T> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of Paginated
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedCopyWith<T, _Paginated<T>> get copyWith => __$PaginatedCopyWithImpl<T, _Paginated<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PaginatedToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paginated<T>&&(identical(other.count, count) || other.count == count)&&(identical(other.numPages, numPages) || other.numPages == numPages)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,numPages,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'Paginated<$T>(count: $count, numPages: $numPages, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedCopyWith<T,$Res> implements $PaginatedCopyWith<T, $Res> {
  factory _$PaginatedCopyWith(_Paginated<T> value, $Res Function(_Paginated<T>) _then) = __$PaginatedCopyWithImpl;
@override @useResult
$Res call({
 int count,@JsonKey(name: 'num_pages') int numPages, int? next, int? previous, List<T> results
});




}
/// @nodoc
class __$PaginatedCopyWithImpl<T,$Res>
    implements _$PaginatedCopyWith<T, $Res> {
  __$PaginatedCopyWithImpl(this._self, this._then);

  final _Paginated<T> _self;
  final $Res Function(_Paginated<T>) _then;

/// Create a copy of Paginated
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? numPages = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_Paginated<T>(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,numPages: null == numPages ? _self.numPages : numPages // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as int?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as int?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}


}

// dart format on
