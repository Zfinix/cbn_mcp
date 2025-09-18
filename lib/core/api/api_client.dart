import 'dart:io';
import 'dart:typed_data';

import 'package:cbn_mcp/utils/logger.dart';
import 'package:cbn_mcp/models/error.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

/// Simple API Client for making HTTP requests
class ApiClient {
  final Dio dio;

  ApiClient({required String baseUrl})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'accept': '*/*',
            'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
            'user-agent': 'CBN-MCP-Server/1.0.0',
            'x-requested-with': 'XMLHttpRequest',
          },
        ),
      ) {
    // Add logging interceptor
    dio.interceptors.add(const _LoggingInterceptor());
  }

  Future<Either<ApiRequestFailure, Response<T>>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get<T>(path, queryParameters: queryParameters);
      return Right(response);
    } catch (e) {
      return Left(ApiRequestFailure(message: e.toString()));
    }
  }

  Future<Either<ApiRequestFailure, Response<T>>> head<T>({
    required String url,
    Options? options,
  }) async {
    try {
      final response = await dio.head<T>(url, options: options);
      return Right(response);
    } catch (e) {
      return Left(ApiRequestFailure(message: e.toString()));
    }
  }

  Future<Either<ApiRequestFailure, File>> downloadFile({
    required String url,
    required String savePath,
    Options? options,
  }) async {
    try {
      await dio.download(url, savePath, options: options);

      return Right(File(savePath));
    } catch (e) {
      return Left(ApiRequestFailure(message: e.toString()));
    }
  }

  /// Download binary data (like PDFs) from a URL
  Future<Either<ApiRequestFailure, Uint8List>> downloadBinary(
    String url,
  ) async {
    try {
      final response = await dio.get<Uint8List>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {'accept': 'application/pdf,*/*'},
        ),
      );
      return Right(response.data ?? Uint8List(0));
    } catch (e) {
      return Left(ApiRequestFailure(message: e.toString()));
    }
  }
}

/// Simple logging interceptor
class _LoggingInterceptor extends Interceptor {
  const _LoggingInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger
      ..d('Host -> ${options.uri.host}')
      ..d('Url -> ${options.uri.path}')
      ..f('QueryParams -> ${jsonPretty(options.uri.queryParametersAll)}')
      ..i('Data -> ${jsonPretty(options.data)}')
      ..i('---------------------------------------------------------------');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger
      ..d('Status Code -> ${response.statusCode}')
      ..d('Headers -> ${response.headers}')
      ..i('Response -> [TRUNCATED]');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger
      ..d('Status Code -> ${err.response?.statusCode}')
      ..i('Error Response -> ${jsonPretty(err.response?.data)}');
    handler.next(err);
  }
}
