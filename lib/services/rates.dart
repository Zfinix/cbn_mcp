import 'dart:async';

import 'package:cbn_mcp/models/models.dart';
import 'package:cbn_mcp/utils/logger.dart';

import 'package:cbn_mcp/core/api/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dartx/dartx.dart';

/// Service for handling CBN circulars
class RatesService {
  final ApiClient _apiClient;

  RatesService(this._apiClient);

  /// Fetch all CBN circulars with optional filtering
  Future<Either<ServerError, ExchangeRatesResponse>> getAllExchangeRates({
    String? startDate,
    String? endDate,
    int limit = 60_000,
    String? currency,
  }) async {
    logger.i('Fetching CBN exchange rates with limit: $limit');

    final response = await _apiClient.get('/GetAllExchangeRates?format=json');

    return response.fold(
      (e) => Left(
        ServerError(error: e.message, message: 'Failed to fetch exchange rates'),
      ),
      (res) {

        final rates = ExchangeRatesResponse.fromResponse(res.data).filterBy(
          startDate: startDate,
          endDate: endDate,
          currency: currency,
          limit: limit,
        );

        logger.i('Successfully fetched ${rates.rates.length} circulars');

        return Right(rates);
      },
    );
  }

  /// Get a specific CBN exchange rate by its ID
  Future<Either<ServerError, ExchangeRate>> getExchangeRateById(
    int exchangeRateId,
  ) async {
    final response = await getAllExchangeRates();
    final rate = response.fold(
      (e) => null,
      (res) => res.rates.firstOrNullWhere((r) => r.id == exchangeRateId),
    );

    if (rate == null) {
      return Left(
        ServerError(
          error: 'Exchange rate not found',
          message: 'Failed to fetch exchange rate for ID: $exchangeRateId',
        ),
      );
    }

    return Right(rate);
  }
}
