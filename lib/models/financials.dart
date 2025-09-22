// Start of Selection
import 'package:dart_mappable/dart_mappable.dart';

part 'financials.mapper.dart';

@MappableClass()
class FinancialData with FinancialDataMappable {
  @MappableField(key: 'id')
  final int id;

  @MappableField(key: 'recDate')
  final String recordDate;

  @MappableField(key: 'opeBal')
  final double openingBalances;

  @MappableField(key: 'rediscBills')
  final double rediscountedBills;

  @MappableField(key: 'slFacility')
  final double standingLendingFacility;

  @MappableField(key: 'sdFacility')
  final double standingDepositFacility;

  @MappableField(key: 'repo')
  final double repo;

  @MappableField(key: 'revRepo')
  final double reverseRepo;

  @MappableField(key: 'omoSales')
  final double omoSales;

  @MappableField(key: 'omoRepay')
  final double omoRepayment;

  @MappableField(key: 'pmSales')
  final double primaryMarketSales;

  @MappableField(key: 'pmRepay')
  final double primaryMarketRepayment;

  @MappableField(key: 'crr')
  final double cashReserveRatio;

  @MappableField(key: 'netWdas')
  final double netForeignExchangeAuction;

  @MappableField(key: 'statAlloc')
  final double statutoryAllocations;

  @MappableField(key: 'jvCash')
  final double jointVentureCashCall;

  @MappableField(key: 'netClr')
  final double netClearing;

  @MappableField(key: 'ndicPrem')
  final double ndicPremium;

  @MappableField(key: 'oMajor')
  final double otherMajor;

  const FinancialData({
    required this.id,
    required this.recordDate,
    required this.openingBalances,
    required this.rediscountedBills,
    required this.standingLendingFacility,
    required this.standingDepositFacility,
    required this.repo,
    required this.reverseRepo,
    required this.omoSales,
    required this.omoRepayment,
    required this.primaryMarketSales,
    required this.primaryMarketRepayment,
    required this.cashReserveRatio,
    required this.netForeignExchangeAuction,
    required this.statutoryAllocations,
    required this.jointVentureCashCall,
    required this.netClearing,
    required this.ndicPremium,
    required this.otherMajor,
  });

  factory FinancialData.fromJson(String json) =>
      FinancialDataMapper.fromJson(json);

  factory FinancialData.fromMap(Map<String, dynamic> map) =>
      FinancialDataMapper.fromMap(map);
}

@MappableClass()
class FinancialDataResponse with FinancialDataResponseMappable {
  final List<FinancialData> data;
  final bool success;
  final String? message;

  const FinancialDataResponse({
    required this.data,
    required this.success,
    this.message,
  });

  factory FinancialDataResponse.fromResponse(dynamic data) {
    return FinancialDataResponse(
      data: data
          .map((e) => FinancialData.fromMap(e as Map<String, dynamic>))
          .toList()
          .cast<FinancialData>(),
      success: true,
      message: 'Successfully fetched ${data.length} financial records',
    );
  }

  factory FinancialDataResponse.fromJson(String json) =>
      FinancialDataResponseMapper.fromJson(json);

  factory FinancialDataResponse.fromMap(Map<String, dynamic> map) =>
      FinancialDataResponseMapper.fromMap(map);
}

extension FinancialDataResponseExtension on FinancialDataResponse {
  FinancialDataResponse filterBy({
    String? startDate,
    String? endDate,
    double? minOpeningBalance,
    double? maxOpeningBalance,
    double? minRepo,
    double? maxRepo,
    double? minCashReserveRatio,
    double? maxCashReserveRatio,
    required int limit,
  }) {
    final start = DateTime.tryParse(startDate ?? '');
    final end = DateTime.tryParse(endDate ?? '');

    return copyWith(
      data: data
          .where((record) {
            bool dateMatch = true;
            if (startDate != null || endDate != null) {
              final date = DateTime.parse(record.recordDate);
              dateMatch =
                  (start == null ||
                      date.isAfter(start) ||
                      date.isAtSameMomentAs(start)) &&
                  (end == null ||
                      date.isBefore(end) ||
                      date.isAtSameMomentAs(end));
            }

            bool balanceMatch = true;
            if (minOpeningBalance != null || maxOpeningBalance != null) {
              balanceMatch =
                  (minOpeningBalance == null ||
                      record.openingBalances >= minOpeningBalance) &&
                  (maxOpeningBalance == null ||
                      record.openingBalances <= maxOpeningBalance);
            }

            bool repoMatch = true;
            if (minRepo != null || maxRepo != null) {
              repoMatch =
                  (minRepo == null || record.repo >= minRepo) &&
                  (maxRepo == null || record.repo <= maxRepo);
            }

            bool crrMatch = true;
            if (minCashReserveRatio != null || maxCashReserveRatio != null) {
              crrMatch =
                  (minCashReserveRatio == null ||
                      record.cashReserveRatio >= minCashReserveRatio) &&
                  (maxCashReserveRatio == null ||
                      record.cashReserveRatio <= maxCashReserveRatio);
            }

            return dateMatch && balanceMatch && repoMatch && crrMatch;
          })
          .take(limit)
          .toList(),
    );
  }
}

// End of Selectio
