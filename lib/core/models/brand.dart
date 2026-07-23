import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand.freezed.dart';
part 'brand.g.dart';

/// A car brand (e.g. "Nissan").
///
/// NOTE: the live API keys the identifier as `brand_id`, not `id` — mapped
/// via @JsonKey below.
@freezed
abstract class Brand with _$Brand {
  const factory Brand({
    @JsonKey(name: 'brand_id') required int id,
    required String name,
    String? slug,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
