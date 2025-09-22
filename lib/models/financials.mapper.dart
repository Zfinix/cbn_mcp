// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'financials.dart';

class FinancialDataMapper extends ClassMapperBase<FinancialData> {
  FinancialDataMapper._();

  static FinancialDataMapper? _instance;
  static FinancialDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FinancialDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FinancialData';

  static int _$id(FinancialData v) => v.id;
  static const Field<FinancialData, int> _f$id = Field('id', _$id);
  static String _$recordDate(FinancialData v) => v.recordDate;
  static const Field<FinancialData, String> _f$recordDate = Field(
    'recordDate',
    _$recordDate,
    key: r'recDate',
  );
  static double _$openingBalances(FinancialData v) => v.openingBalances;
  static const Field<FinancialData, double> _f$openingBalances = Field(
    'openingBalances',
    _$openingBalances,
    key: r'opeBal',
  );
  static double _$rediscountedBills(FinancialData v) => v.rediscountedBills;
  static const Field<FinancialData, double> _f$rediscountedBills = Field(
    'rediscountedBills',
    _$rediscountedBills,
    key: r'rediscBills',
  );
  static double _$standingLendingFacility(FinancialData v) =>
      v.standingLendingFacility;
  static const Field<FinancialData, double> _f$standingLendingFacility = Field(
    'standingLendingFacility',
    _$standingLendingFacility,
    key: r'slFacility',
  );
  static double _$standingDepositFacility(FinancialData v) =>
      v.standingDepositFacility;
  static const Field<FinancialData, double> _f$standingDepositFacility = Field(
    'standingDepositFacility',
    _$standingDepositFacility,
    key: r'sdFacility',
  );
  static double _$repo(FinancialData v) => v.repo;
  static const Field<FinancialData, double> _f$repo = Field('repo', _$repo);
  static double _$reverseRepo(FinancialData v) => v.reverseRepo;
  static const Field<FinancialData, double> _f$reverseRepo = Field(
    'reverseRepo',
    _$reverseRepo,
    key: r'revRepo',
  );
  static double _$omoSales(FinancialData v) => v.omoSales;
  static const Field<FinancialData, double> _f$omoSales = Field(
    'omoSales',
    _$omoSales,
  );
  static double _$omoRepayment(FinancialData v) => v.omoRepayment;
  static const Field<FinancialData, double> _f$omoRepayment = Field(
    'omoRepayment',
    _$omoRepayment,
    key: r'omoRepay',
  );
  static double _$primaryMarketSales(FinancialData v) => v.primaryMarketSales;
  static const Field<FinancialData, double> _f$primaryMarketSales = Field(
    'primaryMarketSales',
    _$primaryMarketSales,
    key: r'pmSales',
  );
  static double _$primaryMarketRepayment(FinancialData v) =>
      v.primaryMarketRepayment;
  static const Field<FinancialData, double> _f$primaryMarketRepayment = Field(
    'primaryMarketRepayment',
    _$primaryMarketRepayment,
    key: r'pmRepay',
  );
  static double _$cashReserveRatio(FinancialData v) => v.cashReserveRatio;
  static const Field<FinancialData, double> _f$cashReserveRatio = Field(
    'cashReserveRatio',
    _$cashReserveRatio,
    key: r'crr',
  );
  static double _$netForeignExchangeAuction(FinancialData v) =>
      v.netForeignExchangeAuction;
  static const Field<FinancialData, double> _f$netForeignExchangeAuction =
      Field(
        'netForeignExchangeAuction',
        _$netForeignExchangeAuction,
        key: r'netWdas',
      );
  static double _$statutoryAllocations(FinancialData v) =>
      v.statutoryAllocations;
  static const Field<FinancialData, double> _f$statutoryAllocations = Field(
    'statutoryAllocations',
    _$statutoryAllocations,
    key: r'statAlloc',
  );
  static double _$jointVentureCashCall(FinancialData v) =>
      v.jointVentureCashCall;
  static const Field<FinancialData, double> _f$jointVentureCashCall = Field(
    'jointVentureCashCall',
    _$jointVentureCashCall,
    key: r'jvCash',
  );
  static double _$netClearing(FinancialData v) => v.netClearing;
  static const Field<FinancialData, double> _f$netClearing = Field(
    'netClearing',
    _$netClearing,
    key: r'netClr',
  );
  static double _$ndicPremium(FinancialData v) => v.ndicPremium;
  static const Field<FinancialData, double> _f$ndicPremium = Field(
    'ndicPremium',
    _$ndicPremium,
    key: r'ndicPrem',
  );
  static double _$otherMajor(FinancialData v) => v.otherMajor;
  static const Field<FinancialData, double> _f$otherMajor = Field(
    'otherMajor',
    _$otherMajor,
    key: r'oMajor',
  );

  @override
  final MappableFields<FinancialData> fields = const {
    #id: _f$id,
    #recordDate: _f$recordDate,
    #openingBalances: _f$openingBalances,
    #rediscountedBills: _f$rediscountedBills,
    #standingLendingFacility: _f$standingLendingFacility,
    #standingDepositFacility: _f$standingDepositFacility,
    #repo: _f$repo,
    #reverseRepo: _f$reverseRepo,
    #omoSales: _f$omoSales,
    #omoRepayment: _f$omoRepayment,
    #primaryMarketSales: _f$primaryMarketSales,
    #primaryMarketRepayment: _f$primaryMarketRepayment,
    #cashReserveRatio: _f$cashReserveRatio,
    #netForeignExchangeAuction: _f$netForeignExchangeAuction,
    #statutoryAllocations: _f$statutoryAllocations,
    #jointVentureCashCall: _f$jointVentureCashCall,
    #netClearing: _f$netClearing,
    #ndicPremium: _f$ndicPremium,
    #otherMajor: _f$otherMajor,
  };

  static FinancialData _instantiate(DecodingData data) {
    return FinancialData(
      id: data.dec(_f$id),
      recordDate: data.dec(_f$recordDate),
      openingBalances: data.dec(_f$openingBalances),
      rediscountedBills: data.dec(_f$rediscountedBills),
      standingLendingFacility: data.dec(_f$standingLendingFacility),
      standingDepositFacility: data.dec(_f$standingDepositFacility),
      repo: data.dec(_f$repo),
      reverseRepo: data.dec(_f$reverseRepo),
      omoSales: data.dec(_f$omoSales),
      omoRepayment: data.dec(_f$omoRepayment),
      primaryMarketSales: data.dec(_f$primaryMarketSales),
      primaryMarketRepayment: data.dec(_f$primaryMarketRepayment),
      cashReserveRatio: data.dec(_f$cashReserveRatio),
      netForeignExchangeAuction: data.dec(_f$netForeignExchangeAuction),
      statutoryAllocations: data.dec(_f$statutoryAllocations),
      jointVentureCashCall: data.dec(_f$jointVentureCashCall),
      netClearing: data.dec(_f$netClearing),
      ndicPremium: data.dec(_f$ndicPremium),
      otherMajor: data.dec(_f$otherMajor),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FinancialData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FinancialData>(map);
  }

  static FinancialData fromJson(String json) {
    return ensureInitialized().decodeJson<FinancialData>(json);
  }
}

mixin FinancialDataMappable {
  String toJson() {
    return FinancialDataMapper.ensureInitialized().encodeJson<FinancialData>(
      this as FinancialData,
    );
  }

  Map<String, dynamic> toMap() {
    return FinancialDataMapper.ensureInitialized().encodeMap<FinancialData>(
      this as FinancialData,
    );
  }

  FinancialDataCopyWith<FinancialData, FinancialData, FinancialData>
  get copyWith => _FinancialDataCopyWithImpl<FinancialData, FinancialData>(
    this as FinancialData,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return FinancialDataMapper.ensureInitialized().stringifyValue(
      this as FinancialData,
    );
  }

  @override
  bool operator ==(Object other) {
    return FinancialDataMapper.ensureInitialized().equalsValue(
      this as FinancialData,
      other,
    );
  }

  @override
  int get hashCode {
    return FinancialDataMapper.ensureInitialized().hashValue(
      this as FinancialData,
    );
  }
}

extension FinancialDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FinancialData, $Out> {
  FinancialDataCopyWith<$R, FinancialData, $Out> get $asFinancialData =>
      $base.as((v, t, t2) => _FinancialDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FinancialDataCopyWith<$R, $In extends FinancialData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? recordDate,
    double? openingBalances,
    double? rediscountedBills,
    double? standingLendingFacility,
    double? standingDepositFacility,
    double? repo,
    double? reverseRepo,
    double? omoSales,
    double? omoRepayment,
    double? primaryMarketSales,
    double? primaryMarketRepayment,
    double? cashReserveRatio,
    double? netForeignExchangeAuction,
    double? statutoryAllocations,
    double? jointVentureCashCall,
    double? netClearing,
    double? ndicPremium,
    double? otherMajor,
  });
  FinancialDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FinancialDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FinancialData, $Out>
    implements FinancialDataCopyWith<$R, FinancialData, $Out> {
  _FinancialDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FinancialData> $mapper =
      FinancialDataMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    String? recordDate,
    double? openingBalances,
    double? rediscountedBills,
    double? standingLendingFacility,
    double? standingDepositFacility,
    double? repo,
    double? reverseRepo,
    double? omoSales,
    double? omoRepayment,
    double? primaryMarketSales,
    double? primaryMarketRepayment,
    double? cashReserveRatio,
    double? netForeignExchangeAuction,
    double? statutoryAllocations,
    double? jointVentureCashCall,
    double? netClearing,
    double? ndicPremium,
    double? otherMajor,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (recordDate != null) #recordDate: recordDate,
      if (openingBalances != null) #openingBalances: openingBalances,
      if (rediscountedBills != null) #rediscountedBills: rediscountedBills,
      if (standingLendingFacility != null)
        #standingLendingFacility: standingLendingFacility,
      if (standingDepositFacility != null)
        #standingDepositFacility: standingDepositFacility,
      if (repo != null) #repo: repo,
      if (reverseRepo != null) #reverseRepo: reverseRepo,
      if (omoSales != null) #omoSales: omoSales,
      if (omoRepayment != null) #omoRepayment: omoRepayment,
      if (primaryMarketSales != null) #primaryMarketSales: primaryMarketSales,
      if (primaryMarketRepayment != null)
        #primaryMarketRepayment: primaryMarketRepayment,
      if (cashReserveRatio != null) #cashReserveRatio: cashReserveRatio,
      if (netForeignExchangeAuction != null)
        #netForeignExchangeAuction: netForeignExchangeAuction,
      if (statutoryAllocations != null)
        #statutoryAllocations: statutoryAllocations,
      if (jointVentureCashCall != null)
        #jointVentureCashCall: jointVentureCashCall,
      if (netClearing != null) #netClearing: netClearing,
      if (ndicPremium != null) #ndicPremium: ndicPremium,
      if (otherMajor != null) #otherMajor: otherMajor,
    }),
  );
  @override
  FinancialData $make(CopyWithData data) => FinancialData(
    id: data.get(#id, or: $value.id),
    recordDate: data.get(#recordDate, or: $value.recordDate),
    openingBalances: data.get(#openingBalances, or: $value.openingBalances),
    rediscountedBills: data.get(
      #rediscountedBills,
      or: $value.rediscountedBills,
    ),
    standingLendingFacility: data.get(
      #standingLendingFacility,
      or: $value.standingLendingFacility,
    ),
    standingDepositFacility: data.get(
      #standingDepositFacility,
      or: $value.standingDepositFacility,
    ),
    repo: data.get(#repo, or: $value.repo),
    reverseRepo: data.get(#reverseRepo, or: $value.reverseRepo),
    omoSales: data.get(#omoSales, or: $value.omoSales),
    omoRepayment: data.get(#omoRepayment, or: $value.omoRepayment),
    primaryMarketSales: data.get(
      #primaryMarketSales,
      or: $value.primaryMarketSales,
    ),
    primaryMarketRepayment: data.get(
      #primaryMarketRepayment,
      or: $value.primaryMarketRepayment,
    ),
    cashReserveRatio: data.get(#cashReserveRatio, or: $value.cashReserveRatio),
    netForeignExchangeAuction: data.get(
      #netForeignExchangeAuction,
      or: $value.netForeignExchangeAuction,
    ),
    statutoryAllocations: data.get(
      #statutoryAllocations,
      or: $value.statutoryAllocations,
    ),
    jointVentureCashCall: data.get(
      #jointVentureCashCall,
      or: $value.jointVentureCashCall,
    ),
    netClearing: data.get(#netClearing, or: $value.netClearing),
    ndicPremium: data.get(#ndicPremium, or: $value.ndicPremium),
    otherMajor: data.get(#otherMajor, or: $value.otherMajor),
  );

  @override
  FinancialDataCopyWith<$R2, FinancialData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FinancialDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FinancialDataResponseMapper
    extends ClassMapperBase<FinancialDataResponse> {
  FinancialDataResponseMapper._();

  static FinancialDataResponseMapper? _instance;
  static FinancialDataResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FinancialDataResponseMapper._());
      FinancialDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FinancialDataResponse';

  static List<FinancialData> _$data(FinancialDataResponse v) => v.data;
  static const Field<FinancialDataResponse, List<FinancialData>> _f$data =
      Field('data', _$data);
  static bool _$success(FinancialDataResponse v) => v.success;
  static const Field<FinancialDataResponse, bool> _f$success = Field(
    'success',
    _$success,
  );
  static String? _$message(FinancialDataResponse v) => v.message;
  static const Field<FinancialDataResponse, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );

  @override
  final MappableFields<FinancialDataResponse> fields = const {
    #data: _f$data,
    #success: _f$success,
    #message: _f$message,
  };

  static FinancialDataResponse _instantiate(DecodingData data) {
    return FinancialDataResponse(
      data: data.dec(_f$data),
      success: data.dec(_f$success),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FinancialDataResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FinancialDataResponse>(map);
  }

  static FinancialDataResponse fromJson(String json) {
    return ensureInitialized().decodeJson<FinancialDataResponse>(json);
  }
}

mixin FinancialDataResponseMappable {
  String toJson() {
    return FinancialDataResponseMapper.ensureInitialized()
        .encodeJson<FinancialDataResponse>(this as FinancialDataResponse);
  }

  Map<String, dynamic> toMap() {
    return FinancialDataResponseMapper.ensureInitialized()
        .encodeMap<FinancialDataResponse>(this as FinancialDataResponse);
  }

  FinancialDataResponseCopyWith<
    FinancialDataResponse,
    FinancialDataResponse,
    FinancialDataResponse
  >
  get copyWith =>
      _FinancialDataResponseCopyWithImpl<
        FinancialDataResponse,
        FinancialDataResponse
      >(this as FinancialDataResponse, $identity, $identity);
  @override
  String toString() {
    return FinancialDataResponseMapper.ensureInitialized().stringifyValue(
      this as FinancialDataResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return FinancialDataResponseMapper.ensureInitialized().equalsValue(
      this as FinancialDataResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return FinancialDataResponseMapper.ensureInitialized().hashValue(
      this as FinancialDataResponse,
    );
  }
}

extension FinancialDataResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FinancialDataResponse, $Out> {
  FinancialDataResponseCopyWith<$R, FinancialDataResponse, $Out>
  get $asFinancialDataResponse => $base.as(
    (v, t, t2) => _FinancialDataResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FinancialDataResponseCopyWith<
  $R,
  $In extends FinancialDataResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    FinancialData,
    FinancialDataCopyWith<$R, FinancialData, FinancialData>
  >
  get data;
  $R call({List<FinancialData>? data, bool? success, String? message});
  FinancialDataResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FinancialDataResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FinancialDataResponse, $Out>
    implements FinancialDataResponseCopyWith<$R, FinancialDataResponse, $Out> {
  _FinancialDataResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FinancialDataResponse> $mapper =
      FinancialDataResponseMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    FinancialData,
    FinancialDataCopyWith<$R, FinancialData, FinancialData>
  >
  get data => ListCopyWith(
    $value.data,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(data: v),
  );
  @override
  $R call({
    List<FinancialData>? data,
    bool? success,
    Object? message = $none,
  }) => $apply(
    FieldCopyWithData({
      if (data != null) #data: data,
      if (success != null) #success: success,
      if (message != $none) #message: message,
    }),
  );
  @override
  FinancialDataResponse $make(CopyWithData data) => FinancialDataResponse(
    data: data.get(#data, or: $value.data),
    success: data.get(#success, or: $value.success),
    message: data.get(#message, or: $value.message),
  );

  @override
  FinancialDataResponseCopyWith<$R2, FinancialDataResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FinancialDataResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

