import 'package:freezed_annotation/freezed_annotation.dart';

import 'brand.dart';
import 'car_model.dart';

part 'advertisement.freezed.dart';
part 'advertisement.g.dart';

/// A single photo attached to an [Advertisement].
@freezed
abstract class AdImage with _$AdImage {
  const factory AdImage({
    required String picture,
    int? order,
  }) = _AdImage;

  factory AdImage.fromJson(Map<String, dynamic> json) =>
      _$AdImageFromJson(json);
}

/// A car listing.
///
/// `condition` and `phone_number` are only ever populated in the detail
/// response (`GET /cars/{id}/`) — the list response (`GET /cars/`) omits
/// `condition` entirely and always includes `phone_number`. Both are
/// nullable here so the same model serves both endpoints.
@freezed
abstract class Advertisement with _$Advertisement {
  const factory Advertisement({
    required int id,
    required Brand brand,
    required CarModel model,
    @JsonKey(name: 'year_issued') required int yearIssued,
    int? price,
    @JsonKey(name: 'price_usd') int? priceUsd,
    String? currency,
    int? mileage,
    @JsonKey(name: 'fuel_type') String? fuelType,
    String? transmission,
    @JsonKey(name: 'drive_unit') String? driveUnit,
    String? steering,
    String? color,
    String? condition,
    @JsonKey(name: 'location_place') String? locationPlace,
    @Default(<AdImage>[]) List<AdImage> images,
    @JsonKey(name: 'source_country') String? sourceCountry,
    @JsonKey(name: 'in_country') @Default(true) bool inCountry,
    @JsonKey(name: 'delivery_cost_usd') int? deliveryCostUsd,
    @JsonKey(name: 'delivery_days') int? deliveryDays,
    @JsonKey(name: 'is_favorite') @Default(false) bool isFavorite,
    DateTime? updated,
    // detail-only
    String? description,
    Map<String, dynamic>? characteristics,
    @JsonKey(name: 'phone_number') String? phoneNumber,
  }) = _Advertisement;

  factory Advertisement.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementFromJson(json);
}
