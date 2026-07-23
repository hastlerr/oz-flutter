enum ApiErrorKind { network, unauthorized, validation, server, unknown }

class ApiException implements Exception {
  final ApiErrorKind kind;
  final int? status;
  final Map<String, dynamic>? body;
  const ApiException(this.kind, {this.status, this.body});

  @override
  String toString() => 'ApiException($kind, $status)';
}
