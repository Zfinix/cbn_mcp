import 'dart:async';

import 'package:cbn_mcp/models/models.dart';
import 'package:cbn_mcp/utils/logger.dart';

import 'package:cbn_mcp/core/api/api_client.dart';
import 'package:dartx/dartx.dart';
import 'package:dartz/dartz.dart';

/// Service for handling CBN circulars
class FinancialsService {
  final ApiClient _apiClient;

  FinancialsService(this._apiClient);

  /// Fetch all CBN circulars with optional filtering
  Future<Either<ServerError, FinancialDataResponse>> getAllFinancialData({
    String? startDate,
    String? endDate,
    int limit = 60_000,
    double? minOpeningBalance,
    double? maxOpeningBalance,
    double? minRepo,
    double? maxRepo,
    double? minCashReserveRatio,
    double? maxCashReserveRatio,
    String? currency,
  }) async {
    logger.i('Fetching CBN financial data with limit: $limit');

    final response = await _apiClient.get('/GetAllFinancialData');

    return response.fold(
      (e) => Left(
        ServerError(
          error: e.message,
          message: 'Failed to fetch financial data',
        ),
      ),
      (res) {
        final financialData = FinancialDataResponse.fromResponse(res.data)
            .filterBy(
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

        logger.i(
          'Successfully fetched ${financialData.data.length} financial data',
        );

        return Right(financialData);
      },
    );
  }

  /// Get a specific CBN exchange rate by its ID
  Future<Either<ServerError, FinancialData>> getFinancialDataById(
    int financialDataId,
  ) async {
    final response = await getAllFinancialData();
    final rate = response.fold(
      (e) => null,
      (res) => res.data.firstOrNullWhere((r) => r.id == financialDataId),
    );

    if (rate == null) {
      return Left(
        ServerError(
          error: 'Financial data not found',
          message: 'Failed to fetch financial data for ID: $financialDataId',
        ),
      );
    }

    return Right(rate);
  }
}
