// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 int get id; String? get token; String get phone; String get name;@JsonKey(name: 'contact_number') String? get contactNumber; String? get avatar;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'is_staff') bool get isStaff;@JsonKey(name: 'date_joined') DateTime? get dateJoined;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isStaff, isStaff) || other.isStaff == isStaff)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token,phone,name,contactNumber,avatar,isActive,isStaff,dateJoined);

@override
String toString() {
  return 'User(id: $id, token: $token, phone: $phone, name: $name, contactNumber: $contactNumber, avatar: $avatar, isActive: $isActive, isStaff: $isStaff, dateJoined: $dateJoined)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id, String? token, String phone, String name,@JsonKey(name: 'contact_number') String? contactNumber, String? avatar,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_staff') bool isStaff,@JsonKey(name: 'date_joined') DateTime? dateJoined
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? token = freezed,Object? phone = null,Object? name = null,Object? contactNumber = freezed,Object? avatar = freezed,Object? isActive = null,Object? isStaff = null,Object? dateJoined = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isStaff: null == isStaff ? _self.isStaff : isStaff // ignore: cast_nullable_to_non_nullable
as bool,dateJoined: freezed == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? token,  String phone,  String name, @JsonKey(name: 'contact_number')  String? contactNumber,  String? avatar, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_staff')  bool isStaff, @JsonKey(name: 'date_joined')  DateTime? dateJoined)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.token,_that.phone,_that.name,_that.contactNumber,_that.avatar,_that.isActive,_that.isStaff,_that.dateJoined);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? token,  String phone,  String name, @JsonKey(name: 'contact_number')  String? contactNumber,  String? avatar, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_staff')  bool isStaff, @JsonKey(name: 'date_joined')  DateTime? dateJoined)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.token,_that.phone,_that.name,_that.contactNumber,_that.avatar,_that.isActive,_that.isStaff,_that.dateJoined);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? token,  String phone,  String name, @JsonKey(name: 'contact_number')  String? contactNumber,  String? avatar, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_staff')  bool isStaff, @JsonKey(name: 'date_joined')  DateTime? dateJoined)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.token,_that.phone,_that.name,_that.contactNumber,_that.avatar,_that.isActive,_that.isStaff,_that.dateJoined);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, this.token, required this.phone, required this.name, @JsonKey(name: 'contact_number') this.contactNumber, this.avatar, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'is_staff') required this.isStaff, @JsonKey(name: 'date_joined') this.dateJoined});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int id;
@override final  String? token;
@override final  String phone;
@override final  String name;
@override@JsonKey(name: 'contact_number') final  String? contactNumber;
@override final  String? avatar;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'is_staff') final  bool isStaff;
@override@JsonKey(name: 'date_joined') final  DateTime? dateJoined;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.contactNumber, contactNumber) || other.contactNumber == contactNumber)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isStaff, isStaff) || other.isStaff == isStaff)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token,phone,name,contactNumber,avatar,isActive,isStaff,dateJoined);

@override
String toString() {
  return 'User(id: $id, token: $token, phone: $phone, name: $name, contactNumber: $contactNumber, avatar: $avatar, isActive: $isActive, isStaff: $isStaff, dateJoined: $dateJoined)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id, String? token, String phone, String name,@JsonKey(name: 'contact_number') String? contactNumber, String? avatar,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_staff') bool isStaff,@JsonKey(name: 'date_joined') DateTime? dateJoined
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? token = freezed,Object? phone = null,Object? name = null,Object? contactNumber = freezed,Object? avatar = freezed,Object? isActive = null,Object? isStaff = null,Object? dateJoined = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactNumber: freezed == contactNumber ? _self.contactNumber : contactNumber // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isStaff: null == isStaff ? _self.isStaff : isStaff // ignore: cast_nullable_to_non_nullable
as bool,dateJoined: freezed == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
