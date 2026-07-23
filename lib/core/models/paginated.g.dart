// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Paginated<T> _$PaginatedFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Paginated<T>(
  count: (json['count'] as num).toInt(),
  numPages: (json['num_pages'] as num).toInt(),
  next: (json['next'] as num?)?.toInt(),
  previous: (json['previous'] as num?)?.toInt(),
  results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$PaginatedToJson<T>(
  _Paginated<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'count': instance.count,
  'num_pages': instance.numPages,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results.map(toJsonT).toList(),
};
