import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStore {
  static const _tokenKey = 'oz_token';
  static const _userKey = 'oz_user_json';
  final FlutterSecureStorage _s;
  const TokenStore([this._s = const FlutterSecureStorage()]);

  Future<String?> read() => _s.read(key: _tokenKey);
  Future<void> write(String token) => _s.write(key: _tokenKey, value: token);
  Future<String?> readUserJson() => _s.read(key: _userKey);
  Future<void> writeUserJson(String json) =>
      _s.write(key: _userKey, value: json);
  Future<void> clear() async {
    await _s.delete(key: _tokenKey);
    await _s.delete(key: _userKey);
  }
}
