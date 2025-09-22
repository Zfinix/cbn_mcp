import 'package:mcp_server_dart/mcp_server_dart.dart';

import 'core/api/api_client.dart';
import 'services/services.dart';

part 'cbn.mcp.dart';

/// Central Bank of Nigeria (CBN) MCP Server
/// Provides access to CBN circulars, exchange rates, and other financial data
class NGCentralBankMCPServer extends MCPServer {
  late final api = ApiClient(baseUrl: 'https://www.cbn.gov.ng/api');

  late final circulars = CircularsService(api);
  late final status = StatusService(api);
  late final rates = RatesService(api);
  late final financials = FinancialsService(api);
  late final prompts = PromptService();

  NGCentralBankMCPServer()
    : super(
        name: 'cbn-mcp-server',
        version: '1.0.0',
        description: 'MCP server for Central Bank of Nigeria API integration',
      );

  @tool(
    'getAllCirculars',
    description:
        'Fetch all CBN circulars with optional filtering by date range and category',
  )
  Future<Map<String, dynamic>> getAllCirculars({
    @param(
      description: 'Start date for filtering (YYYY-MM-DD format)',
      required: false,
    )
    String? startDate,

    @param(
      description: 'End date for filtering (YYYY-MM-DD format)',
      required: false,
    )
    String? endDate,

    @param(description: 'Category filter for circulars', required: false)
    String? category,

    @param(description: 'Maximum number of results to return', required: false)
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

  @tool('getCircularById', description: 'Get a specific CBN circular by its ID')
  Future<Map<String, dynamic>> getCircularById(
    @param(description: 'The ID of the circular to retrieve') int circularId,
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

  @tool(
    'searchCirculars',
    description: 'Search CBN circulars by title or description keywords',
  )
  Future<Map<String, dynamic>> searchCirculars({
    @param(
      description:
          'Search query to match against circular titles and descriptions',
    )
    required String query,

    @param(description: 'Maximum number of results to return', required: false)
    int limit = 20,
  }) async {
    return circulars.searchCirculars(query: query, limit: limit);
  }

  @tool(
    'fetchCircularPdf',
    description:
        'Fetch the PDF content of a CBN circular by its URL (downloads binary data - use getCircularPdfUrl for LLM processing)',
  )
  Future<Map<String, dynamic>> fetchCircularPdf(
    @param(description: 'The URL of the PDF to fetch') String pdfUrl,
  ) async {
    return circulars.fetchCircularPdf(pdfUrl);
  }

  @tool(
    'downloadCircularPdfBinary',
    description:
        'Download the full PDF binary content (legacy - not recommended for LLM use)',
  )
  Future<Map<String, dynamic>> downloadCircularPdfBinary(
    @param(description: 'The ID of the circular whose PDF to download')
    int circularId,
  ) async {
    return circulars.fetchCircularPdfById(circularId);
  }

  @tool(
    'fetchCircularPdfById',
    description:
        'Get PDF information and download URL for a CBN circular by its ID (LLM-friendly)',
  )
  Future<Map<String, dynamic>> fetchCircularPdfById(
    @param(description: 'The ID of the circular whose PDF info to fetch')
    int circularId,
  ) async {
    return circulars.fetchCircularPdfInfo(circularId);
  }

  @tool(
    'getCircularPdfUrl',
    description: 'Get the direct download URL for a CBN circular PDF by its ID',
  )
  Future<Map<String, dynamic>> getCircularPdfUrl(
    @param(description: 'The ID of the circular whose PDF URL to get')
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

  @tool(
    'getCircularsForLLMAnalysis',
    description:
        'Get recent CBN circulars with PDF URLs formatted for LLM analysis',
  )
  Future<Map<String, dynamic>> getCircularsForLLMAnalysis({
    @param(description: 'Number of recent circulars to get', required: false)
    int limit = 5,
    @param(
      description: 'Include PDF URLs for direct LLM access',
      required: false,
    )
    bool includePdfUrls = true,
  }) async {
    final circularsResult = await circulars.getAllCirculars(limit: limit);

    return circularsResult.fold((e) => e.toMap(), (res) {
      final circulars = res.data.map((it) {
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
    });
  }

  @resource(
    'cbnApiStatus',
    description: 'Current status and health of the CBN API connection',
    mimeType: 'application/json',
  )
  Future<Map<String, dynamic>> getCBNApiStatus() async {
    return status.getApiStatus();
  }

  @resource(
    'serverInfo',
    description: 'Information about this CBN MCP server',
    mimeType: 'application/json',
  )
  Future<Map<String, dynamic>> getServerInfo() async {
    return status.getServerInfo();
  }

  @resource(
    'availableCircularPdfs',
    description: 'List of available circular PDFs with their URIs',
    mimeType: 'application/json',
  )
  Future<Map<String, dynamic>> getAvailableCircularPdfs({
    @param(description: 'Limit the number of PDFs listed', required: false)
    int limit = 50,
  }) async {
    final circularsResult = await circulars.getAllCirculars(limit: limit);

    return circularsResult.fold(
      (e) => e.toMap(),
      (res) => {
        'success': true,
        'resources': res.data
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

  @prompt(
    'circularSummary',
    description: 'Generate a summary prompt for CBN circulars analysis',
  )
  String circularSummaryPrompt({
    @param(description: 'The circular data in JSON format')
    required String circularData,
    @param(description: 'Type of summary needed', required: false)
    String summaryType = 'general',
  }) {
    return prompts.circularSummaryPrompt(
      circularData: circularData,
      summaryType: summaryType,
    );
  }

  @prompt(
    'regulatoryAnalysis',
    description:
        'Generate prompts for regulatory compliance analysis of CBN circulars',
  )
  String regulatoryAnalysisPrompt({
    @param(description: 'List of circulars to analyze')
    required String circulars,
    @param(
      description: 'Institution type (bank, fintech, etc.)',
      required: false,
    )
    String institutionType = 'financial institution',
  }) {
    return prompts.regulatoryAnalysisPrompt(
      circulars: circulars,
      institutionType: institutionType,
    );
  }

  @tool(
    'getAllExchangeRates',
    description: 'Fetch all CBN exchange rates with optional filtering',
  )
  Future<Map<String, dynamic>> getAllExchangeRates({
    @param(
      description: 'Start date for filtering (YYYY-MM-DD format)',
      required: false,
    )
    String? startDate,

    @param(
      description: 'End date for filtering (YYYY-MM-DD format)',
      required: false,
    )
    String? endDate,

    @param(description: 'Currency for filtering', required: false)
    String? currency,

    @param(description: 'Limit for filtering', required: false) int limit = 50,
  }) async {
    final ratesResult = await rates.getAllExchangeRates(
      startDate: startDate,
      endDate: endDate,
      currency: currency,
      limit: limit,
    );

    return ratesResult.fold((e) => e.toMap(), (res) => res.toMap());
  }

  @tool(
    'getExchangeRateById',
    description: 'Get a specific CBN exchange rate by its ID',
  )
  Future<Map<String, dynamic>> getExchangeRateById(
    @param(description: 'The ID of the exchange rate to retrieve')
    int exchangeRateId,
  ) async {
    final ratesResult = await rates.getExchangeRateById(exchangeRateId);
    return ratesResult.fold((e) => e.toMap(), (res) => res.toMap());
  }

  @tool(
    'getAllFinancialData',
    description: 'Fetch all CBN financial data with optional filtering',
  )
  Future<Map<String, dynamic>> getAllFinancialData({
    @param(
      description: 'Start date for filtering (YYYY-MM-DD format)',
      required: false,
    )
    String? startDate,
    @param(
      description: 'End date for filtering (YYYY-MM-DD format)',
      required: false,
    )
    String? endDate,
    @param(description: 'Limit for filtering', required: false) int limit = 50,
    @param(description: 'Min opening balance for filtering', required: false)
    double? minOpeningBalance,
    @param(description: 'Max opening balance for filtering', required: false)
    double? maxOpeningBalance,
    @param(description: 'Min repo for filtering', required: false)
    double? minRepo,
    @param(description: 'Max repo for filtering', required: false)
    double? maxRepo,
    @param(description: 'Min cash reserve ratio for filtering', required: false)
    double? minCashReserveRatio,
    @param(description: 'Max cash reserve ratio for filtering', required: false)
    double? maxCashReserveRatio,
  }) async {
    final financialDataResult = await financials.getAllFinancialData(
      startDate: startDate,
      endDate: endDate,
      limit: limit,
      minOpeningBalance: minOpeningBalance,
      maxOpeningBalance: maxOpeningBalance,
      minRepo: minRepo,
      maxRepo: maxRepo,
      minCashReserveRatio: minCashReserveRatio,
      maxCashReserveRatio: maxCashReserveRatio,
    );

    return financialDataResult.fold((e) => e.toMap(), (res) => res.toMap());
  }

  @tool(
    'getFinancialDataById',
    description: 'Get a specific CBN financial data by its ID',
  )
  Future<Map<String, dynamic>> getFinancialDataById(
    @param(description: 'The ID of the financial data to retrieve')
    int financialDataId,
  ) async {
    final financialDataResult = await financials.getFinancialDataById(
      financialDataId,
    );
    return financialDataResult.fold((e) => e.toMap(), (res) => res.toMap());
  }

  @resource(
    'randomFact',
    description: 'A random fact about the CBN',
    mimeType: 'application/json',
  )
  Future<Map<String, dynamic>> getRandomFact() async {
    return status.getRandomFact();
  }
}
