import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.freezed.dart';
part 'car_model.g.dart';

/// A car model (e.g. "Patrol") nested under a [Brand].
///
/// NOTE: the live API keys the identifier as `model_id`, not `id` — mapped
/// via @JsonKey below. The API also does not send a `slug` for models.
@freezed
abstract class CarModel with _$CarModel {
  const factory CarModel({
    @JsonKey(name: 'model_id') required int id,
    required String name,
    String? slug,
  }) = _CarModel;

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);
}
