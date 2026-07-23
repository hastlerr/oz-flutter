// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarModel _$CarModelFromJson(Map<String, dynamic> json) => _CarModel(
  id: (json['model_id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String?,
);

Map<String, dynamic> _$CarModelToJson(_CarModel instance) => <String, dynamic>{
  'model_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
};
