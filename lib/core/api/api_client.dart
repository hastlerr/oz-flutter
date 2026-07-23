import 'package:dio/dio.dart';

import '../storage/token_store.dart';
import 'api_exception.dart';

class ApiClient {
  final Dio dio;
  final TokenStore tokens;
  ApiClient(this.tokens)
      : dio = Dio(BaseOptions(
          baseUrl: 'https://oz.kg/api/v1/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 20),
        )) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (o, h) async {
        final t = await tokens.read();
        if (t != null) o.headers['Authorization'] = 'Token $t';
        h.next(o);
      },
    ));
  }

  Never _throw(DioException e) {
    final s = e.response?.statusCode;
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      throw const ApiException(ApiErrorKind.network);
    }
    if (s == 401) throw ApiException(ApiErrorKind.unauthorized, status: s);
    if (s != null && s >= 400 && s < 500) {
      throw ApiException(ApiErrorKind.validation,
          status: s,
          body: e.response?.data is Map<String, dynamic>
              ? e.response!.data
              : null);
    }
    throw ApiException(ApiErrorKind.server, status: s);
  }

  Future<dynamic> get(String path, {Map<String, dynamic>? query}) async {
    try {
      return (await dio.get(path, queryParameters: query)).data;
    } on DioException catch (e) {
      _throw(e);
    }
  }

  Future<dynamic> post(String path, {Object? data}) async {
    try {
      return (await dio.post(path, data: data)).data;
    } on DioException catch (e) {
      _throw(e);
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      return (await dio.delete(path)).data;
    } on DioException catch (e) {
      _throw(e);
    }
  }

  Future<dynamic> postForm(String path, FormData form) async {
    try {
      return (await dio.post(path, data: form)).data;
    } on DioException catch (e) {
      _throw(e);
    }
  }
}
