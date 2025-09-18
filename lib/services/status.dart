import 'package:cbn_mcp/core/api/api_client.dart';

/// Service for checking CBN API status
class CBNApiStatusService {
  final ApiClient _apiClient;

  CBNApiStatusService(this._apiClient);

  /// Get the current status and health of the CBN API connection
  Future<Map<String, dynamic>> getApiStatus() async {
    final startTime = DateTime.now();

    final response = await _apiClient
        .get('/GetAllCirculars?format=json')
        .timeout(const Duration(seconds: 10));

    return response.fold(
      (e) => {
        'status': 'unhealthy',
        'error': e.message,
        'last_checked': DateTime.now().toIso8601String(),
        'api_endpoint': _apiClient.dio.options.baseUrl,
      },
      (res) => {
        'status': res.statusCode == 200 ? 'healthy' : 'unhealthy',
        'response_code': res.statusCode,
        'response_time_ms': DateTime.now().difference(startTime).inMilliseconds,
        'last_checked': DateTime.now().toIso8601String(),
        'api_endpoint': _apiClient.dio.options.baseUrl,
      },
    );
  }

  /// Get information about the server capabilities
  Future<Map<String, dynamic>> getServerInfo() async {
    return {
      'server_name': 'cbn-mcp-server',
      'version': '1.0.0',
      'description': 'MCP server for Central Bank of Nigeria API integration',
      'supported_endpoints': ['GetAllCirculars - Fetch all CBN circulars'],
      'capabilities': [
        'Circular retrieval and filtering',
        'Date range filtering',
        'Category filtering',
        'Full-text search',
        'API health monitoring',
      ],
      'uptime': DateTime.now().toIso8601String(),
    };
  }
}
