import 'package:dart_mappable/dart_mappable.dart';

part 'error.mapper.dart';

@MappableClass()
class ApiRequestFailure with ApiRequestFailureMappable implements Exception {
  final String status;
  final String message;

  const ApiRequestFailure({this.status = '', this.message = ''});

  @override
  String toString() => 'ApiRequestFailure: $status - $message';
}

@MappableClass()
class ServerError with ServerErrorMappable implements Exception {
  final String error;
  final String message;

  const ServerError({this.error = '', this.message = ''});
}
