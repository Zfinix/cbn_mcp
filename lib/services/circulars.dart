import 'dart:async';

import 'package:cbn_mcp/utils/logger.dart';

import 'package:cbn_mcp/core/api/api_client.dart';
import 'package:cbn_mcp/models/circular.dart';
import 'package:cbn_mcp/models/error.dart';
import 'package:dartx/dartx.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// Service for handling CBN circulars
class CircularsService {
  final ApiClient _apiClient;

  CircularsService(this._apiClient);

  /// Fetch all CBN circulars with optional filtering
  Future<Either<ServerError, CircularsResponse>> getAllCirculars({
    String? startDate,
    String? endDate,
    String? category,
    int limit = 50,
  }) async {
    logger.i('Fetching CBN circulars with limit: $limit');

    final response = await _apiClient.get('/GetAllCirculars?format=json');

    return response.fold(
      (e) => Left(
        ServerError(error: e.message, message: 'Failed to fetch circulars'),
      ),
      (res) {
        final circulars = CircularsResponse.fromResponse(res.data).filterBy(
          startDate: startDate,
          endDate: endDate,
          category: category,
          limit: limit,
        );
        logger.i('Successfully fetched ${circulars.data.length} circulars');

        return Right(
          circulars.copyWith(
            message: 'Successfully fetched ${circulars.data.length} circulars',
          ),
        );
      },
    );
  }

  /// Get a specific CBN circular by its ID
  Future<Circular?> getCircularById({
    required int circularId,
    int limit = 10000,
  }) async {
    logger.i('Fetching circular with ID: $circularId');

    // First get all circulars, then filter by ID
    final response = await getAllCirculars(limit: limit);

    return response.fold((e) => null, (res) {
      return res.data.firstOrNullWhere((c) => c.id == circularId);
    });
  }

  /// Search CBN circulars by title or description keywords
  Future<Map<String, dynamic>> searchCirculars({
    required String query,
    int limit = 20,
  }) async {
    logger.i('Searching circulars with query: "$query"');

    final allCirculars = await getAllCirculars(limit: 1000);

    return allCirculars.fold(
      (e) => {
        'success': false,
        'error': e.message,
        'message': 'Failed to search circulars',
      },
      (res) {
        final searchResults = res.data
            .where((circular) {
              final title = circular.title.toLowerCase();
              final description = circular.description?.toLowerCase() ?? '';
              final searchQuery = query.toLowerCase();
              return '$title $description'.contains(searchQuery);
            })
            .take(limit)
            .toList();

        return {
          'success': true,
          'query': query,
          'count': searchResults.length,
          'circulars': searchResults,
        };
      },
    );
  }

  /// Fetch the PDF content of a circular by its URL
  Future<Map<String, dynamic>> fetchCircularPdf(String pdfUrl) async {
    logger.i('Fetching PDF from URL: $pdfUrl');

    // Convert relative URLs to absolute URLs
    final fullUrl = switch (pdfUrl) {
      String url when url.startsWith('http') => url,
      String url when url.startsWith('/') => 'https://www.cbn.gov.ng$url',
      _ => throw Exception('Invalid PDF URL format: $pdfUrl'),
    };

    final response = await _apiClient.downloadBinary(fullUrl);

    return response.fold(
      (e) => {'error': e.message, 'message': 'Failed to fetch PDF'},
      (res) => {
        'success': true,
        'url': fullUrl,
        'original_url': pdfUrl,
        'size_bytes': res.length,
        'content_type': 'application/pdf',
      },
    );
  }

  /// Get PDF information and metadata for a circular by its ID (LLM-friendly)
  Future<Map<String, dynamic>> fetchCircularPdfInfo(int circularId) async {
    logger.i('Fetching PDF info for circular ID: $circularId');

    // First get the circular details
    final circular = await getCircularById(circularId: circularId);
    final pdfUrl = circular?.pdfUrl;

    if (circular == null) {
      return {
        'success': false,
        'error': 'Circular not found',
        'message': 'Could not find circular with ID: $circularId',
      };
    }

    if (pdfUrl == null) {
      return {
        'success': false,
        'error': 'No PDF URL available',
        'message': 'Circular $circularId does not have a PDF URL',
      };
    }

    final metadata = await _apiClient
        .head(url: pdfUrl)
        .then(
          (value) => value.fold(
            (e) => Response(
              requestOptions: RequestOptions(path: pdfUrl),
              data: null,
              statusCode: 500,
            ),
            (res) => res,
          ),
        );

    return {
      'success': true,
      'circular': {
        'id': circular.id,
        'title': circular.title,
        'description': circular.description,
        'refNo': circular.refNo,
        'author': circular.author,
        'datePublished': circular.datePublished,
        'keywords': circular.keywords,
      },
      'pdf': {
        'url': pdfUrl,
        'accessible': metadata.statusCode == 200,
        'size_bytes': metadata.headers['content-length'] != null
            ? int.tryParse(metadata.headers['content-length']!.first)
            : null,
        'content_type':
            metadata.headers['content-type']?.first ?? 'application/pdf',
        'last_modified': metadata.headers['last-modified']?.first,
      },
      'llm_instructions': {
        'message':
            'This PDF can be accessed directly by an LLM using the provided URL',
        'url_for_llm': pdfUrl,
        'suggested_prompt':
            'Please analyze the content of this CBN circular PDF: $pdfUrl',
      },
      'message':
          'PDF information retrieved successfully. Use the URL for direct access.',
    };
  }

  /// Fetch the PDF content of a circular by its ID (downloads binary data)
  Future<Map<String, dynamic>> fetchCircularPdfById(int circularId) async {
    logger.i('Fetching PDF binary for circular ID: $circularId');

    // First get the circular details
    final circular = await getCircularById(circularId: circularId);
    final pdfUrl = circular?.pdfUrl;

    if (circular == null) {
      return {
        'success': false,
        'error': 'Circular not found',
        'message': 'Could not find circular with ID: $circularId',
      };
    }

    if (pdfUrl == null) {
      return {
        'success': false,
        'error': 'No PDF URL available',
        'message': 'Circular $circularId does not have a PDF URL',
      };
    }

    return fetchCircularPdf(pdfUrl);
  }
}
