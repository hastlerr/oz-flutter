// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advertisement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdImage {

 String get picture; int? get order;
/// Create a copy of AdImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdImageCopyWith<AdImage> get copyWith => _$AdImageCopyWithImpl<AdImage>(this as AdImage, _$identity);

  /// Serializes this AdImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdImage&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,picture,order);

@override
String toString() {
  return 'AdImage(picture: $picture, order: $order)';
}


}

/// @nodoc
abstract mixin class $AdImageCopyWith<$Res>  {
  factory $AdImageCopyWith(AdImage value, $Res Function(AdImage) _then) = _$AdImageCopyWithImpl;
@useResult
$Res call({
 String picture, int? order
});




}
/// @nodoc
class _$AdImageCopyWithImpl<$Res>
    implements $AdImageCopyWith<$Res> {
  _$AdImageCopyWithImpl(this._self, this._then);

  final AdImage _self;
  final $Res Function(AdImage) _then;

/// Create a copy of AdImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? picture = null,Object? order = freezed,}) {
  return _then(_self.copyWith(
picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdImage].
extension AdImagePatterns on AdImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdImage value)  $default,){
final _that = this;
switch (_that) {
case _AdImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdImage value)?  $default,){
final _that = this;
switch (_that) {
case _AdImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String picture,  int? order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdImage() when $default != null:
return $default(_that.picture,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String picture,  int? order)  $default,) {final _that = this;
switch (_that) {
case _AdImage():
return $default(_that.picture,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String picture,  int? order)?  $default,) {final _that = this;
switch (_that) {
case _AdImage() when $default != null:
return $default(_that.picture,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdImage implements AdImage {
  const _AdImage({required this.picture, this.order});
  factory _AdImage.fromJson(Map<String, dynamic> json) => _$AdImageFromJson(json);

@override final  String picture;
@override final  int? order;

/// Create a copy of AdImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdImageCopyWith<_AdImage> get copyWith => __$AdImageCopyWithImpl<_AdImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdImage&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,picture,order);

@override
String toString() {
  return 'AdImage(picture: $picture, order: $order)';
}


}

/// @nodoc
abstract mixin class _$AdImageCopyWith<$Res> implements $AdImageCopyWith<$Res> {
  factory _$AdImageCopyWith(_AdImage value, $Res Function(_AdImage) _then) = __$AdImageCopyWithImpl;
@override @useResult
$Res call({
 String picture, int? order
});




}
/// @nodoc
class __$AdImageCopyWithImpl<$Res>
    implements _$AdImageCopyWith<$Res> {
  __$AdImageCopyWithImpl(this._self, this._then);

  final _AdImage _self;
  final $Res Function(_AdImage) _then;

/// Create a copy of AdImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? picture = null,Object? order = freezed,}) {
  return _then(_AdImage(
picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Advertisement {

 int get id; Brand get brand; CarModel get model;@JsonKey(name: 'year_issued') int get yearIssued; int? get price;@JsonKey(name: 'price_usd') int? get priceUsd; String? get currency; int? get mileage;@JsonKey(name: 'fuel_type') String? get fuelType; String? get transmission;@JsonKey(name: 'drive_unit') String? get driveUnit; String? get steering; String? get color; String? get condition;@JsonKey(name: 'location_place') String? get locationPlace; List<AdImage> get images;@JsonKey(name: 'source_country') String? get sourceCountry;@JsonKey(name: 'in_country') bool get inCountry;@JsonKey(name: 'delivery_cost_usd') int? get deliveryCostUsd;@JsonKey(name: 'delivery_days') int? get deliveryDays;@JsonKey(name: 'is_favorite') bool get isFavorite; DateTime? get updated; String? get description; Map<String, dynamic>? get characteristics;@JsonKey(name: 'phone_number') String? get phoneNumber;
/// Create a copy of Advertisement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdvertisementCopyWith<Advertisement> get copyWith => _$AdvertisementCopyWithImpl<Advertisement>(this as Advertisement, _$identity);

  /// Serializes this Advertisement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Advertisement&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.yearIssued, yearIssued) || other.yearIssued == yearIssued)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.fuelType, fuelType) || other.fuelType == fuelType)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.driveUnit, driveUnit) || other.driveUnit == driveUnit)&&(identical(other.steering, steering) || other.steering == steering)&&(identical(other.color, color) || other.color == color)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.locationPlace, locationPlace) || other.locationPlace == locationPlace)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.sourceCountry, sourceCountry) || other.sourceCountry == sourceCountry)&&(identical(other.inCountry, inCountry) || other.inCountry == inCountry)&&(identical(other.deliveryCostUsd, deliveryCostUsd) || other.deliveryCostUsd == deliveryCostUsd)&&(identical(other.deliveryDays, deliveryDays) || other.deliveryDays == deliveryDays)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.characteristics, characteristics)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,brand,model,yearIssued,price,priceUsd,currency,mileage,fuelType,transmission,driveUnit,steering,color,condition,locationPlace,const DeepCollectionEquality().hash(images),sourceCountry,inCountry,deliveryCostUsd,deliveryDays,isFavorite,updated,description,const DeepCollectionEquality().hash(characteristics),phoneNumber]);

@override
String toString() {
  return 'Advertisement(id: $id, brand: $brand, model: $model, yearIssued: $yearIssued, price: $price, priceUsd: $priceUsd, currency: $currency, mileage: $mileage, fuelType: $fuelType, transmission: $transmission, driveUnit: $driveUnit, steering: $steering, color: $color, condition: $condition, locationPlace: $locationPlace, images: $images, sourceCountry: $sourceCountry, inCountry: $inCountry, deliveryCostUsd: $deliveryCostUsd, deliveryDays: $deliveryDays, isFavorite: $isFavorite, updated: $updated, description: $description, characteristics: $characteristics, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $AdvertisementCopyWith<$Res>  {
  factory $AdvertisementCopyWith(Advertisement value, $Res Function(Advertisement) _then) = _$AdvertisementCopyWithImpl;
@useResult
$Res call({
 int id, Brand brand, CarModel model,@JsonKey(name: 'year_issued') int yearIssued, int? price,@JsonKey(name: 'price_usd') int? priceUsd, String? currency, int? mileage,@JsonKey(name: 'fuel_type') String? fuelType, String? transmission,@JsonKey(name: 'drive_unit') String? driveUnit, String? steering, String? color, String? condition,@JsonKey(name: 'location_place') String? locationPlace, List<AdImage> images,@JsonKey(name: 'source_country') String? sourceCountry,@JsonKey(name: 'in_country') bool inCountry,@JsonKey(name: 'delivery_cost_usd') int? deliveryCostUsd,@JsonKey(name: 'delivery_days') int? deliveryDays,@JsonKey(name: 'is_favorite') bool isFavorite, DateTime? updated, String? description, Map<String, dynamic>? characteristics,@JsonKey(name: 'phone_number') String? phoneNumber
});


$BrandCopyWith<$Res> get brand;$CarModelCopyWith<$Res> get model;

}
/// @nodoc
class _$AdvertisementCopyWithImpl<$Res>
    implements $AdvertisementCopyWith<$Res> {
  _$AdvertisementCopyWithImpl(this._self, this._then);

  final Advertisement _self;
  final $Res Function(Advertisement) _then;

/// Create a copy of Advertisement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brand = null,Object? model = null,Object? yearIssued = null,Object? price = freezed,Object? priceUsd = freezed,Object? currency = freezed,Object? mileage = freezed,Object? fuelType = freezed,Object? transmission = freezed,Object? driveUnit = freezed,Object? steering = freezed,Object? color = freezed,Object? condition = freezed,Object? locationPlace = freezed,Object? images = null,Object? sourceCountry = freezed,Object? inCountry = null,Object? deliveryCostUsd = freezed,Object? deliveryDays = freezed,Object? isFavorite = null,Object? updated = freezed,Object? description = freezed,Object? characteristics = freezed,Object? phoneNumber = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as CarModel,yearIssued: null == yearIssued ? _self.yearIssued : yearIssued // ignore: cast_nullable_to_non_nullable
as int,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,priceUsd: freezed == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as int?,fuelType: freezed == fuelType ? _self.fuelType : fuelType // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,driveUnit: freezed == driveUnit ? _self.driveUnit : driveUnit // ignore: cast_nullable_to_non_nullable
as String?,steering: freezed == steering ? _self.steering : steering // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,locationPlace: freezed == locationPlace ? _self.locationPlace : locationPlace // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<AdImage>,sourceCountry: freezed == sourceCountry ? _self.sourceCountry : sourceCountry // ignore: cast_nullable_to_non_nullable
as String?,inCountry: null == inCountry ? _self.inCountry : inCountry // ignore: cast_nullable_to_non_nullable
as bool,deliveryCostUsd: freezed == deliveryCostUsd ? _self.deliveryCostUsd : deliveryCostUsd // ignore: cast_nullable_to_non_nullable
as int?,deliveryDays: freezed == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as int?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,characteristics: freezed == characteristics ? _self.characteristics : characteristics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Advertisement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res> get brand {
  
  return $BrandCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}/// Create a copy of Advertisement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarModelCopyWith<$Res> get model {
  
  return $CarModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}


/// Adds pattern-matching-related methods to [Advertisement].
extension AdvertisementPatterns on Advertisement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Advertisement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Advertisement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Advertisement value)  $default,){
final _that = this;
switch (_that) {
case _Advertisement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Advertisement value)?  $default,){
final _that = this;
switch (_that) {
case _Advertisement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  Brand brand,  CarModel model, @JsonKey(name: 'year_issued')  int yearIssued,  int? price, @JsonKey(name: 'price_usd')  int? priceUsd,  String? currency,  int? mileage, @JsonKey(name: 'fuel_type')  String? fuelType,  String? transmission, @JsonKey(name: 'drive_unit')  String? driveUnit,  String? steering,  String? color,  String? condition, @JsonKey(name: 'location_place')  String? locationPlace,  List<AdImage> images, @JsonKey(name: 'source_country')  String? sourceCountry, @JsonKey(name: 'in_country')  bool inCountry, @JsonKey(name: 'delivery_cost_usd')  int? deliveryCostUsd, @JsonKey(name: 'delivery_days')  int? deliveryDays, @JsonKey(name: 'is_favorite')  bool isFavorite,  DateTime? updated,  String? description,  Map<String, dynamic>? characteristics, @JsonKey(name: 'phone_number')  String? phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Advertisement() when $default != null:
return $default(_that.id,_that.brand,_that.model,_that.yearIssued,_that.price,_that.priceUsd,_that.currency,_that.mileage,_that.fuelType,_that.transmission,_that.driveUnit,_that.steering,_that.color,_that.condition,_that.locationPlace,_that.images,_that.sourceCountry,_that.inCountry,_that.deliveryCostUsd,_that.deliveryDays,_that.isFavorite,_that.updated,_that.description,_that.characteristics,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  Brand brand,  CarModel model, @JsonKey(name: 'year_issued')  int yearIssued,  int? price, @JsonKey(name: 'price_usd')  int? priceUsd,  String? currency,  int? mileage, @JsonKey(name: 'fuel_type')  String? fuelType,  String? transmission, @JsonKey(name: 'drive_unit')  String? driveUnit,  String? steering,  String? color,  String? condition, @JsonKey(name: 'location_place')  String? locationPlace,  List<AdImage> images, @JsonKey(name: 'source_country')  String? sourceCountry, @JsonKey(name: 'in_country')  bool inCountry, @JsonKey(name: 'delivery_cost_usd')  int? deliveryCostUsd, @JsonKey(name: 'delivery_days')  int? deliveryDays, @JsonKey(name: 'is_favorite')  bool isFavorite,  DateTime? updated,  String? description,  Map<String, dynamic>? characteristics, @JsonKey(name: 'phone_number')  String? phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _Advertisement():
return $default(_that.id,_that.brand,_that.model,_that.yearIssued,_that.price,_that.priceUsd,_that.currency,_that.mileage,_that.fuelType,_that.transmission,_that.driveUnit,_that.steering,_that.color,_that.condition,_that.locationPlace,_that.images,_that.sourceCountry,_that.inCountry,_that.deliveryCostUsd,_that.deliveryDays,_that.isFavorite,_that.updated,_that.description,_that.characteristics,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  Brand brand,  CarModel model, @JsonKey(name: 'year_issued')  int yearIssued,  int? price, @JsonKey(name: 'price_usd')  int? priceUsd,  String? currency,  int? mileage, @JsonKey(name: 'fuel_type')  String? fuelType,  String? transmission, @JsonKey(name: 'drive_unit')  String? driveUnit,  String? steering,  String? color,  String? condition, @JsonKey(name: 'location_place')  String? locationPlace,  List<AdImage> images, @JsonKey(name: 'source_country')  String? sourceCountry, @JsonKey(name: 'in_country')  bool inCountry, @JsonKey(name: 'delivery_cost_usd')  int? deliveryCostUsd, @JsonKey(name: 'delivery_days')  int? deliveryDays, @JsonKey(name: 'is_favorite')  bool isFavorite,  DateTime? updated,  String? description,  Map<String, dynamic>? characteristics, @JsonKey(name: 'phone_number')  String? phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _Advertisement() when $default != null:
return $default(_that.id,_that.brand,_that.model,_that.yearIssued,_that.price,_that.priceUsd,_that.currency,_that.mileage,_that.fuelType,_that.transmission,_that.driveUnit,_that.steering,_that.color,_that.condition,_that.locationPlace,_that.images,_that.sourceCountry,_that.inCountry,_that.deliveryCostUsd,_that.deliveryDays,_that.isFavorite,_that.updated,_that.description,_that.characteristics,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Advertisement implements Advertisement {
  const _Advertisement({required this.id, required this.brand, required this.model, @JsonKey(name: 'year_issued') required this.yearIssued, this.price, @JsonKey(name: 'price_usd') this.priceUsd, this.currency, this.mileage, @JsonKey(name: 'fuel_type') this.fuelType, this.transmission, @JsonKey(name: 'drive_unit') this.driveUnit, this.steering, this.color, this.condition, @JsonKey(name: 'location_place') this.locationPlace, final  List<AdImage> images = const <AdImage>[], @JsonKey(name: 'source_country') this.sourceCountry, @JsonKey(name: 'in_country') this.inCountry = true, @JsonKey(name: 'delivery_cost_usd') this.deliveryCostUsd, @JsonKey(name: 'delivery_days') this.deliveryDays, @JsonKey(name: 'is_favorite') this.isFavorite = false, this.updated, this.description, final  Map<String, dynamic>? characteristics, @JsonKey(name: 'phone_number') this.phoneNumber}): _images = images,_characteristics = characteristics;
  factory _Advertisement.fromJson(Map<String, dynamic> json) => _$AdvertisementFromJson(json);

@override final  int id;
@override final  Brand brand;
@override final  CarModel model;
@override@JsonKey(name: 'year_issued') final  int yearIssued;
@override final  int? price;
@override@JsonKey(name: 'price_usd') final  int? priceUsd;
@override final  String? currency;
@override final  int? mileage;
@override@JsonKey(name: 'fuel_type') final  String? fuelType;
@override final  String? transmission;
@override@JsonKey(name: 'drive_unit') final  String? driveUnit;
@override final  String? steering;
@override final  String? color;
@override final  String? condition;
@override@JsonKey(name: 'location_place') final  String? locationPlace;
 final  List<AdImage> _images;
@override@JsonKey() List<AdImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey(name: 'source_country') final  String? sourceCountry;
@override@JsonKey(name: 'in_country') final  bool inCountry;
@override@JsonKey(name: 'delivery_cost_usd') final  int? deliveryCostUsd;
@override@JsonKey(name: 'delivery_days') final  int? deliveryDays;
@override@JsonKey(name: 'is_favorite') final  bool isFavorite;
@override final  DateTime? updated;
@override final  String? description;
 final  Map<String, dynamic>? _characteristics;
@override Map<String, dynamic>? get characteristics {
  final value = _characteristics;
  if (value == null) return null;
  if (_characteristics is EqualUnmodifiableMapView) return _characteristics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'phone_number') final  String? phoneNumber;

/// Create a copy of Advertisement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdvertisementCopyWith<_Advertisement> get copyWith => __$AdvertisementCopyWithImpl<_Advertisement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdvertisementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Advertisement&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.yearIssued, yearIssued) || other.yearIssued == yearIssued)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.fuelType, fuelType) || other.fuelType == fuelType)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.driveUnit, driveUnit) || other.driveUnit == driveUnit)&&(identical(other.steering, steering) || other.steering == steering)&&(identical(other.color, color) || other.color == color)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.locationPlace, locationPlace) || other.locationPlace == locationPlace)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.sourceCountry, sourceCountry) || other.sourceCountry == sourceCountry)&&(identical(other.inCountry, inCountry) || other.inCountry == inCountry)&&(identical(other.deliveryCostUsd, deliveryCostUsd) || other.deliveryCostUsd == deliveryCostUsd)&&(identical(other.deliveryDays, deliveryDays) || other.deliveryDays == deliveryDays)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._characteristics, _characteristics)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,brand,model,yearIssued,price,priceUsd,currency,mileage,fuelType,transmission,driveUnit,steering,color,condition,locationPlace,const DeepCollectionEquality().hash(_images),sourceCountry,inCountry,deliveryCostUsd,deliveryDays,isFavorite,updated,description,const DeepCollectionEquality().hash(_characteristics),phoneNumber]);

@override
String toString() {
  return 'Advertisement(id: $id, brand: $brand, model: $model, yearIssued: $yearIssued, price: $price, priceUsd: $priceUsd, currency: $currency, mileage: $mileage, fuelType: $fuelType, transmission: $transmission, driveUnit: $driveUnit, steering: $steering, color: $color, condition: $condition, locationPlace: $locationPlace, images: $images, sourceCountry: $sourceCountry, inCountry: $inCountry, deliveryCostUsd: $deliveryCostUsd, deliveryDays: $deliveryDays, isFavorite: $isFavorite, updated: $updated, description: $description, characteristics: $characteristics, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$AdvertisementCopyWith<$Res> implements $AdvertisementCopyWith<$Res> {
  factory _$AdvertisementCopyWith(_Advertisement value, $Res Function(_Advertisement) _then) = __$AdvertisementCopyWithImpl;
@override @useResult
$Res call({
 int id, Brand brand, CarModel model,@JsonKey(name: 'year_issued') int yearIssued, int? price,@JsonKey(name: 'price_usd') int? priceUsd, String? currency, int? mileage,@JsonKey(name: 'fuel_type') String? fuelType, String? transmission,@JsonKey(name: 'drive_unit') String? driveUnit, String? steering, String? color, String? condition,@JsonKey(name: 'location_place') String? locationPlace, List<AdImage> images,@JsonKey(name: 'source_country') String? sourceCountry,@JsonKey(name: 'in_country') bool inCountry,@JsonKey(name: 'delivery_cost_usd') int? deliveryCostUsd,@JsonKey(name: 'delivery_days') int? deliveryDays,@JsonKey(name: 'is_favorite') bool isFavorite, DateTime? updated, String? description, Map<String, dynamic>? characteristics,@JsonKey(name: 'phone_number') String? phoneNumber
});


@override $BrandCopyWith<$Res> get brand;@override $CarModelCopyWith<$Res> get model;

}
/// @nodoc
class __$AdvertisementCopyWithImpl<$Res>
    implements _$AdvertisementCopyWith<$Res> {
  __$AdvertisementCopyWithImpl(this._self, this._then);

  final _Advertisement _self;
  final $Res Function(_Advertisement) _then;

/// Create a copy of Advertisement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brand = null,Object? model = null,Object? yearIssued = null,Object? price = freezed,Object? priceUsd = freezed,Object? currency = freezed,Object? mileage = freezed,Object? fuelType = freezed,Object? transmission = freezed,Object? driveUnit = freezed,Object? steering = freezed,Object? color = freezed,Object? condition = freezed,Object? locationPlace = freezed,Object? images = null,Object? sourceCountry = freezed,Object? inCountry = null,Object? deliveryCostUsd = freezed,Object? deliveryDays = freezed,Object? isFavorite = null,Object? updated = freezed,Object? description = freezed,Object? characteristics = freezed,Object? phoneNumber = freezed,}) {
  return _then(_Advertisement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as CarModel,yearIssued: null == yearIssued ? _self.yearIssued : yearIssued // ignore: cast_nullable_to_non_nullable
as int,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,priceUsd: freezed == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as int?,fuelType: freezed == fuelType ? _self.fuelType : fuelType // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,driveUnit: freezed == driveUnit ? _self.driveUnit : driveUnit // ignore: cast_nullable_to_non_nullable
as String?,steering: freezed == steering ? _self.steering : steering // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,locationPlace: freezed == locationPlace ? _self.locationPlace : locationPlace // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<AdImage>,sourceCountry: freezed == sourceCountry ? _self.sourceCountry : sourceCountry // ignore: cast_nullable_to_non_nullable
as String?,inCountry: null == inCountry ? _self.inCountry : inCountry // ignore: cast_nullable_to_non_nullable
as bool,deliveryCostUsd: freezed == deliveryCostUsd ? _self.deliveryCostUsd : deliveryCostUsd // ignore: cast_nullable_to_non_nullable
as int?,deliveryDays: freezed == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as int?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,characteristics: freezed == characteristics ? _self._characteristics : characteristics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Advertisement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res> get brand {
  
  return $BrandCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}/// Create a copy of Advertisement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarModelCopyWith<$Res> get model {
  
  return $CarModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}

// dart format on
