import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated.freezed.dart';
part 'paginated.g.dart';

/// A DRF-style page envelope.
///
/// NOTE: `next` / `previous` are page NUMBERS (`int?`), not URLs — verified
/// against the live `GET /cars/` fixture (`"next": 2, "previous": null`).
@Freezed(genericArgumentFactories: true)
abstract class Paginated<T> with _$Paginated<T> {
  const factory Paginated({
    required int count,
    @JsonKey(name: 'num_pages') required int numPages,
    int? next,
    int? previous,
    required List<T> results,
  }) = _Paginated<T>;

  factory Paginated.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginatedFromJson(json, fromJsonT);
}
