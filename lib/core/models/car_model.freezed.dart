// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarModel {

@JsonKey(name: 'model_id') int get id; String get name; String? get slug;
/// Create a copy of CarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarModelCopyWith<CarModel> get copyWith => _$CarModelCopyWithImpl<CarModel>(this as CarModel, _$identity);

  /// Serializes this CarModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'CarModel(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $CarModelCopyWith<$Res>  {
  factory $CarModelCopyWith(CarModel value, $Res Function(CarModel) _then) = _$CarModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'model_id') int id, String name, String? slug
});




}
/// @nodoc
class _$CarModelCopyWithImpl<$Res>
    implements $CarModelCopyWith<$Res> {
  _$CarModelCopyWithImpl(this._self, this._then);

  final CarModel _self;
  final $Res Function(CarModel) _then;

/// Create a copy of CarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CarModel].
extension CarModelPatterns on CarModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarModel value)  $default,){
final _that = this;
switch (_that) {
case _CarModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarModel value)?  $default,){
final _that = this;
switch (_that) {
case _CarModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'model_id')  int id,  String name,  String? slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarModel() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'model_id')  int id,  String name,  String? slug)  $default,) {final _that = this;
switch (_that) {
case _CarModel():
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'model_id')  int id,  String name,  String? slug)?  $default,) {final _that = this;
switch (_that) {
case _CarModel() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CarModel implements CarModel {
  const _CarModel({@JsonKey(name: 'model_id') required this.id, required this.name, this.slug});
  factory _CarModel.fromJson(Map<String, dynamic> json) => _$CarModelFromJson(json);

@override@JsonKey(name: 'model_id') final  int id;
@override final  String name;
@override final  String? slug;

/// Create a copy of CarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarModelCopyWith<_CarModel> get copyWith => __$CarModelCopyWithImpl<_CarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'CarModel(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$CarModelCopyWith<$Res> implements $CarModelCopyWith<$Res> {
  factory _$CarModelCopyWith(_CarModel value, $Res Function(_CarModel) _then) = __$CarModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'model_id') int id, String name, String? slug
});




}
/// @nodoc
class __$CarModelCopyWithImpl<$Res>
    implements _$CarModelCopyWith<$Res> {
  __$CarModelCopyWithImpl(this._self, this._then);

  final _CarModel _self;
  final $Res Function(_CarModel) _then;

/// Create a copy of CarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = freezed,}) {
  return _then(_CarModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
