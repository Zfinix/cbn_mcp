import 'package:mcp_server_dart/mcp_server_dart.dart';

import 'core/api/api_client.dart';
import 'services/services.dart';

part 'cbn.mcp.dart';

/// Central Bank of Nigeria (CBN) MCP Server
/// Provides access to CBN circulars, exchange rates, and other financial data
class NGCentralBankMCPServer extends MCPServer {
  late final api = ApiClient(baseUrl: 'https://www.cbn.gov.ng/api');

  late final circulars = CBNCircularsService(api);
  late final status = CBNApiStatusService(api);
  late final prompt = CBNPromptService();

  NGCentralBankMCPServer()
    : super(
        name: 'cbn-mcp-server',
        version: '1.0.0',
        description: 'MCP server for Central Bank of Nigeria API integration',
      );

  @MCPTool(
    'getAllCirculars',
    description:
        'Fetch all CBN circulars with optional filtering by date range and category',
  )
  Future<Map<String, dynamic>> getAllCirculars({
    @MCPParam(
      description: 'Start date for filtering (YYYY-MM-DD format)',
      required: false,
    )
    String? startDate,

    @MCPParam(
      description: 'End date for filtering (YYYY-MM-DD format)',
      required: false,
    )
    String? endDate,

    @MCPParam(description: 'Category filter for circulars', required: false)
    String? category,

    @MCPParam(
      description: 'Maximum number of results to return',
      required: false,
    )
    int limit = 50,
  }) async {
    final result = await circulars.getAllCirculars(
      startDate: startDate,
      endDate: endDate,
      category: category,
      limit: limit,
    );

    return result.fold(
      (e) => {
        'success': false,
        'error': e.message,
        'message': 'Failed to get circulars',
      },
      (res) => res.toMap(),
    );
  }

  @MCPTool(
    'getCircularById',
    description: 'Get a specific CBN circular by its ID',
  )
  Future<Map<String, dynamic>> getCircularById(
    @MCPParam(description: 'The ID of the circular to retrieve') int circularId,
  ) async {
    final result = await circulars.getCircularById(circularId: circularId);
    if (result == null) {
      return {
        'success': false,
        'error': 'Circular not found',
        'message': 'Circular with ID $circularId not found',
      };
    }
    return result.toMap();
  }

  @MCPTool(
    'searchCirculars',
    description: 'Search CBN circulars by title or description keywords',
  )
  Future<Map<String, dynamic>> searchCirculars({
    @MCPParam(
      description:
          'Search query to match against circular titles and descriptions',
    )
    required String query,

    @MCPParam(
      description: 'Maximum number of results to return',
      required: false,
    )
    int limit = 20,
  }) async {
    return circulars.searchCirculars(query: query, limit: limit);
  }

  @MCPTool(
    'fetchCircularPdf',
    description:
        'Fetch the PDF content of a CBN circular by its URL (downloads binary data - use getCircularPdfUrl for LLM processing)',
  )
  Future<Map<String, dynamic>> fetchCircularPdf(
    @MCPParam(description: 'The URL of the PDF to fetch') String pdfUrl,
  ) async {
    return circulars.fetchCircularPdf(pdfUrl);
  }

  @MCPTool(
    'downloadCircularPdfBinary',
    description:
        'Download the full PDF binary content (legacy - not recommended for LLM use)',
  )
  Future<Map<String, dynamic>> downloadCircularPdfBinary(
    @MCPParam(description: 'The ID of the circular whose PDF to download')
    int circularId,
  ) async {
    return circulars.fetchCircularPdfById(circularId);
  }

  @MCPTool(
    'fetchCircularPdfById',
    description:
        'Get PDF information and download URL for a CBN circular by its ID (LLM-friendly)',
  )
  Future<Map<String, dynamic>> fetchCircularPdfById(
    @MCPParam(description: 'The ID of the circular whose PDF info to fetch')
    int circularId,
  ) async {
    return circulars.fetchCircularPdfInfo(circularId);
  }

  @MCPTool(
    'getCircularPdfUrl',
    description: 'Get the direct download URL for a CBN circular PDF by its ID',
  )
  Future<Map<String, dynamic>> getCircularPdfUrl(
    @MCPParam(description: 'The ID of the circular whose PDF URL to get')
    int circularId,
  ) async {
    final response = await circulars.getCircularById(circularId: circularId);
    if (response == null) {
      return {
        'success': false,
        'error': 'Circular not found',
        'message': 'Circular with ID $circularId not found',
      };
    }
    return {
      'success': true,
      'circularId': circularId,
      'pdfUrl': response.pdfUrl,
    };
  }

  @MCPTool(
    'getCircularsForLLMAnalysis',
    description:
        'Get recent CBN circulars with PDF URLs formatted for LLM analysis',
  )
  Future<Map<String, dynamic>> getCircularsForLLMAnalysis({
    @MCPParam(description: 'Number of recent circulars to get', required: false)
    int limit = 5,
    @MCPParam(
      description: 'Include PDF URLs for direct LLM access',
      required: false,
    )
    bool includePdfUrls = true,
  }) async {
    final circularsResult = await circulars.getAllCirculars(limit: limit);

    return circularsResult.fold(
      (e) => {
        'success': false,
        'error': e.message,
        'message': 'Failed to get circulars for LLM analysis',
      },
      (res) {
        final circulars = res.circulars.map((it) {
          return {
            'id': it.id,
            'title': it.title,
            'description': it.description,
            'refNo': it.refNo,
            'author': it.author,
            'datePublished': it.datePublished,
            'keywords': it.keywords,
            if (includePdfUrls) 'pdfUrl': it.pdfUrl,
          };
        }).toList();

        return {
          'success': true,
          'count': circulars.length,
          'circulars': circulars,
          'llm_instructions': {
            'message':
                'These circulars include direct PDF URLs that can be processed by LLMs',
            'usage': 'Pass the pdfUrl directly to an LLM for content analysis',
            'note': 'URLs are publicly accessible CBN documents',
          },
          'message':
              'Circulars formatted for LLM analysis retrieved successfully',
        };
      },
    );
  }

  @MCPResource(
    'cbnApiStatus',
    description: 'Current status and health of the CBN API connection',
    mimeType: 'application/json',
  )
  Future<Map<String, dynamic>> getCBNApiStatus() async {
    return status.getApiStatus();
  }

  @MCPResource(
    'serverInfo',
    description: 'Information about this CBN MCP server',
    mimeType: 'application/json',
  )
  Future<Map<String, dynamic>> getServerInfo() async {
    return status.getServerInfo();
  }

  @MCPResource(
    'availableCircularPdfs',
    description: 'List of available circular PDFs with their URIs',
    mimeType: 'application/json',
  )
  Future<Map<String, dynamic>> getAvailableCircularPdfs({
    @MCPParam(description: 'Limit the number of PDFs listed', required: false)
    int limit = 50,
  }) async {
    final circularsResult = await circulars.getAllCirculars(limit: limit);

    return circularsResult.fold(
      (e) => {
        'success': false,
        'error': e.message,
        'message': 'Failed to get available circular PDFs',
      },
      (res) => {
        'success': true,
        'count': res.count,
        'resources': res.circulars
            .map(
              (c) => {
                'id': c.id,
                'title': c.title,
                'refNo': c.refNo,
                'datePublished': c.datePublished,
                'pdfUrl': c.pdfUrl,
              },
            )
            .toList(),
      },
    );
  }

  @MCPPrompt(
    'circularSummary',
    description: 'Generate a summary prompt for CBN circulars analysis',
  )
  String circularSummaryPrompt({
    @MCPParam(description: 'The circular data in JSON format')
    required String circularData,
    @MCPParam(description: 'Type of summary needed', required: false)
    String summaryType = 'general',
  }) {
    return prompt.circularSummaryPrompt(
      circularData: circularData,
      summaryType: summaryType,
    );
  }

  @MCPPrompt(
    'regulatoryAnalysis',
    description:
        'Generate prompts for regulatory compliance analysis of CBN circulars',
  )
  String regulatoryAnalysisPrompt({
    @MCPParam(description: 'List of circulars to analyze')
    required String circulars,
    @MCPParam(
      description: 'Institution type (bank, fintech, etc.)',
      required: false,
    )
    String institutionType = 'financial institution',
  }) {
    return prompt.regulatoryAnalysisPrompt(
      circulars: circulars,
      institutionType: institutionType,
    );
  }
}
