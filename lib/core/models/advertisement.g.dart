// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdImage _$AdImageFromJson(Map<String, dynamic> json) => _AdImage(
  picture: json['picture'] as String,
  order: (json['order'] as num?)?.toInt(),
);

Map<String, dynamic> _$AdImageToJson(_AdImage instance) => <String, dynamic>{
  'picture': instance.picture,
  'order': instance.order,
};

_Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) =>
    _Advertisement(
      id: (json['id'] as num).toInt(),
      brand: Brand.fromJson(json['brand'] as Map<String, dynamic>),
      model: CarModel.fromJson(json['model'] as Map<String, dynamic>),
      yearIssued: (json['year_issued'] as num).toInt(),
      price: (json['price'] as num?)?.toInt(),
      priceUsd: (json['price_usd'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      mileage: (json['mileage'] as num?)?.toInt(),
      fuelType: json['fuel_type'] as String?,
      transmission: json['transmission'] as String?,
      driveUnit: json['drive_unit'] as String?,
      steering: json['steering'] as String?,
      color: json['color'] as String?,
      condition: json['condition'] as String?,
      locationPlace: json['location_place'] as String?,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => AdImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AdImage>[],
      sourceCountry: json['source_country'] as String?,
      inCountry: json['in_country'] as bool? ?? true,
      deliveryCostUsd: (json['delivery_cost_usd'] as num?)?.toInt(),
      deliveryDays: (json['delivery_days'] as num?)?.toInt(),
      isFavorite: json['is_favorite'] as bool? ?? false,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      description: json['description'] as String?,
      characteristics: json['characteristics'] as Map<String, dynamic>?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$AdvertisementToJson(_Advertisement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'year_issued': instance.yearIssued,
      'price': instance.price,
      'price_usd': instance.priceUsd,
      'currency': instance.currency,
      'mileage': instance.mileage,
      'fuel_type': instance.fuelType,
      'transmission': instance.transmission,
      'drive_unit': instance.driveUnit,
      'steering': instance.steering,
      'color': instance.color,
      'condition': instance.condition,
      'location_place': instance.locationPlace,
      'images': instance.images,
      'source_country': instance.sourceCountry,
      'in_country': instance.inCountry,
      'delivery_cost_usd': instance.deliveryCostUsd,
      'delivery_days': instance.deliveryDays,
      'is_favorite': instance.isFavorite,
      'updated': instance.updated?.toIso8601String(),
      'description': instance.description,
      'characteristics': instance.characteristics,
      'phone_number': instance.phoneNumber,
    };
