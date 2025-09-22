import 'package:dart_mappable/dart_mappable.dart';

part 'rates.mapper.dart';

// Start of Selection
@MappableClass()
class ExchangeRate with ExchangeRateMappable {
  @MappableField(key: 'id')
  final int id;

  @MappableField(key: 'currency')
  final String currency;

  @MappableField(key: 'ratedate')
  final String rateDate;

  @MappableField(key: 'buyingrate')
  final double buyingRate;

  @MappableField(key: 'centralrate')
  final double centralRate;

  @MappableField(key: 'sellingrate')
  final double sellingRate;

  const ExchangeRate({
    required this.id,
    required this.currency,
    required this.rateDate,
    required this.buyingRate,
    required this.centralRate,
    required this.sellingRate,
  });

  factory ExchangeRate.fromJson(String json) =>
      ExchangeRateMapper.fromJson(json);

  factory ExchangeRate.fromMap(Map<String, dynamic> map) =>
      ExchangeRateMapper.fromMap(map);
}
// End of Selectio

@MappableClass()
class ExchangeRatesResponse with ExchangeRatesResponseMappable {
  final List<ExchangeRate> rates;
  final bool success;
  final String? message;

  const ExchangeRatesResponse({
    required this.rates,
    required this.success,
    this.message,
  });

  factory ExchangeRatesResponse.fromResponse(dynamic data) {
    return ExchangeRatesResponse(
      rates: data
          .map((e) => ExchangeRate.fromMap(e as Map<String, dynamic>))
          .toList().cast<ExchangeRate>(),
      success: true,
      message: 'Successfully fetched ${data.length} circulars',
    );
  }

  factory ExchangeRatesResponse.fromJson(String json) =>
      ExchangeRatesResponseMapper.fromJson(json);

  factory ExchangeRatesResponse.fromMap(Map<String, dynamic> map) =>
      ExchangeRatesResponseMapper.fromMap(map);
}

extension ExchangeRatesResponseExtension on ExchangeRatesResponse {
  ExchangeRatesResponse filterBy({
    String? startDate,
    String? endDate,

    /// CFA, DANISH KRONA, EURO, POUNDS STERLING, RIYAL, SDR, SOUTH AFRICAN RAND, SWISS FRANC, US DOLLAR, WAUA, YEN, YUAN/RENMINBI
    String? currency,
    required int limit,
  }) {
    final start = DateTime.tryParse(startDate ?? '');
    final end = DateTime.tryParse(endDate ?? '');

    return copyWith(
      rates: rates
          .where((rate) {
            bool dateMatch = true;
            if (startDate != null || endDate != null) {
              final date = DateTime.parse(rate.rateDate);
              dateMatch =
                  (start == null ||
                      date.isAfter(start) ||
                      date.isAtSameMomentAs(start)) &&
                  (end == null ||
                      date.isBefore(end) ||
                      date.isAtSameMomentAs(end));
            }

            bool currencyMatch = true;
            if (currency != null) {
              currencyMatch = rate.currency.toLowerCase().contains(
                currency.toLowerCase(),
              );
            }

            return dateMatch && currencyMatch;
          })
          .take(limit)
          .toList(),
    );
  }
}
