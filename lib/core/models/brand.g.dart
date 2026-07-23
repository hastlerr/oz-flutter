// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Brand _$BrandFromJson(Map<String, dynamic> json) => _Brand(
  id: (json['brand_id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String?,
);

Map<String, dynamic> _$BrandToJson(_Brand instance) => <String, dynamic>{
  'brand_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
};
