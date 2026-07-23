import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// The authenticated user, as returned by `POST /login`.
///
/// NOTE: `balance` is intentionally excluded from this model.
@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    String? token,
    required String phone,
    required String name,
    @JsonKey(name: 'contact_number') String? contactNumber,
    String? avatar,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_staff') required bool isStaff,
    @JsonKey(name: 'date_joined') DateTime? dateJoined,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
