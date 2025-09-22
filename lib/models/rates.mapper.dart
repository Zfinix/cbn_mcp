// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'rates.dart';

class ExchangeRateMapper extends ClassMapperBase<ExchangeRate> {
  ExchangeRateMapper._();

  static ExchangeRateMapper? _instance;
  static ExchangeRateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExchangeRateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ExchangeRate';

  static int _$id(ExchangeRate v) => v.id;
  static const Field<ExchangeRate, int> _f$id = Field('id', _$id);
  static String _$currency(ExchangeRate v) => v.currency;
  static const Field<ExchangeRate, String> _f$currency = Field(
    'currency',
    _$currency,
  );
  static String _$rateDate(ExchangeRate v) => v.rateDate;
  static const Field<ExchangeRate, String> _f$rateDate = Field(
    'rateDate',
    _$rateDate,
    key: r'ratedate',
  );
  static double _$buyingRate(ExchangeRate v) => v.buyingRate;
  static const Field<ExchangeRate, double> _f$buyingRate = Field(
    'buyingRate',
    _$buyingRate,
    key: r'buyingrate',
  );
  static double _$centralRate(ExchangeRate v) => v.centralRate;
  static const Field<ExchangeRate, double> _f$centralRate = Field(
    'centralRate',
    _$centralRate,
    key: r'centralrate',
  );
  static double _$sellingRate(ExchangeRate v) => v.sellingRate;
  static const Field<ExchangeRate, double> _f$sellingRate = Field(
    'sellingRate',
    _$sellingRate,
    key: r'sellingrate',
  );

  @override
  final MappableFields<ExchangeRate> fields = const {
    #id: _f$id,
    #currency: _f$currency,
    #rateDate: _f$rateDate,
    #buyingRate: _f$buyingRate,
    #centralRate: _f$centralRate,
    #sellingRate: _f$sellingRate,
  };

  static ExchangeRate _instantiate(DecodingData data) {
    return ExchangeRate(
      id: data.dec(_f$id),
      currency: data.dec(_f$currency),
      rateDate: data.dec(_f$rateDate),
      buyingRate: data.dec(_f$buyingRate),
      centralRate: data.dec(_f$centralRate),
      sellingRate: data.dec(_f$sellingRate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ExchangeRate fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExchangeRate>(map);
  }

  static ExchangeRate fromJson(String json) {
    return ensureInitialized().decodeJson<ExchangeRate>(json);
  }
}

mixin ExchangeRateMappable {
  String toJson() {
    return ExchangeRateMapper.ensureInitialized().encodeJson<ExchangeRate>(
      this as ExchangeRate,
    );
  }

  Map<String, dynamic> toMap() {
    return ExchangeRateMapper.ensureInitialized().encodeMap<ExchangeRate>(
      this as ExchangeRate,
    );
  }

  ExchangeRateCopyWith<ExchangeRate, ExchangeRate, ExchangeRate> get copyWith =>
      _ExchangeRateCopyWithImpl<ExchangeRate, ExchangeRate>(
        this as ExchangeRate,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExchangeRateMapper.ensureInitialized().stringifyValue(
      this as ExchangeRate,
    );
  }

  @override
  bool operator ==(Object other) {
    return ExchangeRateMapper.ensureInitialized().equalsValue(
      this as ExchangeRate,
      other,
    );
  }

  @override
  int get hashCode {
    return ExchangeRateMapper.ensureInitialized().hashValue(
      this as ExchangeRate,
    );
  }
}

extension ExchangeRateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExchangeRate, $Out> {
  ExchangeRateCopyWith<$R, ExchangeRate, $Out> get $asExchangeRate =>
      $base.as((v, t, t2) => _ExchangeRateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExchangeRateCopyWith<$R, $In extends ExchangeRate, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? currency,
    String? rateDate,
    double? buyingRate,
    double? centralRate,
    double? sellingRate,
  });
  ExchangeRateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ExchangeRateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExchangeRate, $Out>
    implements ExchangeRateCopyWith<$R, ExchangeRate, $Out> {
  _ExchangeRateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExchangeRate> $mapper =
      ExchangeRateMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    String? currency,
    String? rateDate,
    double? buyingRate,
    double? centralRate,
    double? sellingRate,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (currency != null) #currency: currency,
      if (rateDate != null) #rateDate: rateDate,
      if (buyingRate != null) #buyingRate: buyingRate,
      if (centralRate != null) #centralRate: centralRate,
      if (sellingRate != null) #sellingRate: sellingRate,
    }),
  );
  @override
  ExchangeRate $make(CopyWithData data) => ExchangeRate(
    id: data.get(#id, or: $value.id),
    currency: data.get(#currency, or: $value.currency),
    rateDate: data.get(#rateDate, or: $value.rateDate),
    buyingRate: data.get(#buyingRate, or: $value.buyingRate),
    centralRate: data.get(#centralRate, or: $value.centralRate),
    sellingRate: data.get(#sellingRate, or: $value.sellingRate),
  );

  @override
  ExchangeRateCopyWith<$R2, ExchangeRate, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ExchangeRateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ExchangeRatesResponseMapper
    extends ClassMapperBase<ExchangeRatesResponse> {
  ExchangeRatesResponseMapper._();

  static ExchangeRatesResponseMapper? _instance;
  static ExchangeRatesResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExchangeRatesResponseMapper._());
      ExchangeRateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ExchangeRatesResponse';

  static List<ExchangeRate> _$rates(ExchangeRatesResponse v) => v.rates;
  static const Field<ExchangeRatesResponse, List<ExchangeRate>> _f$rates =
      Field('rates', _$rates);
  static bool _$success(ExchangeRatesResponse v) => v.success;
  static const Field<ExchangeRatesResponse, bool> _f$success = Field(
    'success',
    _$success,
  );
  static String? _$message(ExchangeRatesResponse v) => v.message;
  static const Field<ExchangeRatesResponse, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );

  @override
  final MappableFields<ExchangeRatesResponse> fields = const {
    #rates: _f$rates,
    #success: _f$success,
    #message: _f$message,
  };

  static ExchangeRatesResponse _instantiate(DecodingData data) {
    return ExchangeRatesResponse(
      rates: data.dec(_f$rates),
      success: data.dec(_f$success),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ExchangeRatesResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExchangeRatesResponse>(map);
  }

  static ExchangeRatesResponse fromJson(String json) {
    return ensureInitialized().decodeJson<ExchangeRatesResponse>(json);
  }
}

mixin ExchangeRatesResponseMappable {
  String toJson() {
    return ExchangeRatesResponseMapper.ensureInitialized()
        .encodeJson<ExchangeRatesResponse>(this as ExchangeRatesResponse);
  }

  Map<String, dynamic> toMap() {
    return ExchangeRatesResponseMapper.ensureInitialized()
        .encodeMap<ExchangeRatesResponse>(this as ExchangeRatesResponse);
  }

  ExchangeRatesResponseCopyWith<
    ExchangeRatesResponse,
    ExchangeRatesResponse,
    ExchangeRatesResponse
  >
  get copyWith =>
      _ExchangeRatesResponseCopyWithImpl<
        ExchangeRatesResponse,
        ExchangeRatesResponse
      >(this as ExchangeRatesResponse, $identity, $identity);
  @override
  String toString() {
    return ExchangeRatesResponseMapper.ensureInitialized().stringifyValue(
      this as ExchangeRatesResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return ExchangeRatesResponseMapper.ensureInitialized().equalsValue(
      this as ExchangeRatesResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return ExchangeRatesResponseMapper.ensureInitialized().hashValue(
      this as ExchangeRatesResponse,
    );
  }
}

extension ExchangeRatesResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExchangeRatesResponse, $Out> {
  ExchangeRatesResponseCopyWith<$R, ExchangeRatesResponse, $Out>
  get $asExchangeRatesResponse => $base.as(
    (v, t, t2) => _ExchangeRatesResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ExchangeRatesResponseCopyWith<
  $R,
  $In extends ExchangeRatesResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ExchangeRate,
    ExchangeRateCopyWith<$R, ExchangeRate, ExchangeRate>
  >
  get rates;
  $R call({List<ExchangeRate>? rates, bool? success, String? message});
  ExchangeRatesResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ExchangeRatesResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExchangeRatesResponse, $Out>
    implements ExchangeRatesResponseCopyWith<$R, ExchangeRatesResponse, $Out> {
  _ExchangeRatesResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExchangeRatesResponse> $mapper =
      ExchangeRatesResponseMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ExchangeRate,
    ExchangeRateCopyWith<$R, ExchangeRate, ExchangeRate>
  >
  get rates => ListCopyWith(
    $value.rates,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(rates: v),
  );
  @override
  $R call({
    List<ExchangeRate>? rates,
    bool? success,
    Object? message = $none,
  }) => $apply(
    FieldCopyWithData({
      if (rates != null) #rates: rates,
      if (success != null) #success: success,
      if (message != $none) #message: message,
    }),
  );
  @override
  ExchangeRatesResponse $make(CopyWithData data) => ExchangeRatesResponse(
    rates: data.get(#rates, or: $value.rates),
    success: data.get(#success, or: $value.success),
    message: data.get(#message, or: $value.message),
  );

  @override
  ExchangeRatesResponseCopyWith<$R2, ExchangeRatesResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ExchangeRatesResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

