// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'random.dart';

class RandomFactMapper extends ClassMapperBase<RandomFact> {
  RandomFactMapper._();

  static RandomFactMapper? _instance;
  static RandomFactMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RandomFactMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RandomFact';

  static int _$id(RandomFact v) => v.id;
  static const Field<RandomFact, int> _f$id = Field('id', _$id);
  static String _$factText(RandomFact v) => v.factText;
  static const Field<RandomFact, String> _f$factText = Field(
    'factText',
    _$factText,
  );
  static String _$factDate(RandomFact v) => v.factDate;
  static const Field<RandomFact, String> _f$factDate = Field(
    'factDate',
    _$factDate,
  );

  @override
  final MappableFields<RandomFact> fields = const {
    #id: _f$id,
    #factText: _f$factText,
    #factDate: _f$factDate,
  };

  static RandomFact _instantiate(DecodingData data) {
    return RandomFact(
      id: data.dec(_f$id),
      factText: data.dec(_f$factText),
      factDate: data.dec(_f$factDate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RandomFact fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RandomFact>(map);
  }

  static RandomFact fromJson(String json) {
    return ensureInitialized().decodeJson<RandomFact>(json);
  }
}

mixin RandomFactMappable {
  String toJson() {
    return RandomFactMapper.ensureInitialized().encodeJson<RandomFact>(
      this as RandomFact,
    );
  }

  Map<String, dynamic> toMap() {
    return RandomFactMapper.ensureInitialized().encodeMap<RandomFact>(
      this as RandomFact,
    );
  }

  RandomFactCopyWith<RandomFact, RandomFact, RandomFact> get copyWith =>
      _RandomFactCopyWithImpl<RandomFact, RandomFact>(
        this as RandomFact,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RandomFactMapper.ensureInitialized().stringifyValue(
      this as RandomFact,
    );
  }

  @override
  bool operator ==(Object other) {
    return RandomFactMapper.ensureInitialized().equalsValue(
      this as RandomFact,
      other,
    );
  }

  @override
  int get hashCode {
    return RandomFactMapper.ensureInitialized().hashValue(this as RandomFact);
  }
}

extension RandomFactValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RandomFact, $Out> {
  RandomFactCopyWith<$R, RandomFact, $Out> get $asRandomFact =>
      $base.as((v, t, t2) => _RandomFactCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RandomFactCopyWith<$R, $In extends RandomFact, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? factText, String? factDate});
  RandomFactCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RandomFactCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RandomFact, $Out>
    implements RandomFactCopyWith<$R, RandomFact, $Out> {
  _RandomFactCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RandomFact> $mapper =
      RandomFactMapper.ensureInitialized();
  @override
  $R call({int? id, String? factText, String? factDate}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (factText != null) #factText: factText,
      if (factDate != null) #factDate: factDate,
    }),
  );
  @override
  RandomFact $make(CopyWithData data) => RandomFact(
    id: data.get(#id, or: $value.id),
    factText: data.get(#factText, or: $value.factText),
    factDate: data.get(#factDate, or: $value.factDate),
  );

  @override
  RandomFactCopyWith<$R2, RandomFact, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RandomFactCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RandomFactsResponseMapper extends ClassMapperBase<RandomFactsResponse> {
  RandomFactsResponseMapper._();

  static RandomFactsResponseMapper? _instance;
  static RandomFactsResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RandomFactsResponseMapper._());
      RandomFactMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RandomFactsResponse';

  static List<RandomFact> _$facts(RandomFactsResponse v) => v.facts;
  static const Field<RandomFactsResponse, List<RandomFact>> _f$facts = Field(
    'facts',
    _$facts,
  );
  static bool _$success(RandomFactsResponse v) => v.success;
  static const Field<RandomFactsResponse, bool> _f$success = Field(
    'success',
    _$success,
  );
  static String? _$message(RandomFactsResponse v) => v.message;
  static const Field<RandomFactsResponse, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );

  @override
  final MappableFields<RandomFactsResponse> fields = const {
    #facts: _f$facts,
    #success: _f$success,
    #message: _f$message,
  };

  static RandomFactsResponse _instantiate(DecodingData data) {
    return RandomFactsResponse(
      facts: data.dec(_f$facts),
      success: data.dec(_f$success),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RandomFactsResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RandomFactsResponse>(map);
  }

  static RandomFactsResponse fromJson(String json) {
    return ensureInitialized().decodeJson<RandomFactsResponse>(json);
  }
}

mixin RandomFactsResponseMappable {
  String toJson() {
    return RandomFactsResponseMapper.ensureInitialized()
        .encodeJson<RandomFactsResponse>(this as RandomFactsResponse);
  }

  Map<String, dynamic> toMap() {
    return RandomFactsResponseMapper.ensureInitialized()
        .encodeMap<RandomFactsResponse>(this as RandomFactsResponse);
  }

  RandomFactsResponseCopyWith<
    RandomFactsResponse,
    RandomFactsResponse,
    RandomFactsResponse
  >
  get copyWith =>
      _RandomFactsResponseCopyWithImpl<
        RandomFactsResponse,
        RandomFactsResponse
      >(this as RandomFactsResponse, $identity, $identity);
  @override
  String toString() {
    return RandomFactsResponseMapper.ensureInitialized().stringifyValue(
      this as RandomFactsResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return RandomFactsResponseMapper.ensureInitialized().equalsValue(
      this as RandomFactsResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return RandomFactsResponseMapper.ensureInitialized().hashValue(
      this as RandomFactsResponse,
    );
  }
}

extension RandomFactsResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RandomFactsResponse, $Out> {
  RandomFactsResponseCopyWith<$R, RandomFactsResponse, $Out>
  get $asRandomFactsResponse => $base.as(
    (v, t, t2) => _RandomFactsResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RandomFactsResponseCopyWith<
  $R,
  $In extends RandomFactsResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, RandomFact, RandomFactCopyWith<$R, RandomFact, RandomFact>>
  get facts;
  $R call({List<RandomFact>? facts, bool? success, String? message});
  RandomFactsResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RandomFactsResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RandomFactsResponse, $Out>
    implements RandomFactsResponseCopyWith<$R, RandomFactsResponse, $Out> {
  _RandomFactsResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RandomFactsResponse> $mapper =
      RandomFactsResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, RandomFact, RandomFactCopyWith<$R, RandomFact, RandomFact>>
  get facts => ListCopyWith(
    $value.facts,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(facts: v),
  );
  @override
  $R call({List<RandomFact>? facts, bool? success, Object? message = $none}) =>
      $apply(
        FieldCopyWithData({
          if (facts != null) #facts: facts,
          if (success != null) #success: success,
          if (message != $none) #message: message,
        }),
      );
  @override
  RandomFactsResponse $make(CopyWithData data) => RandomFactsResponse(
    facts: data.get(#facts, or: $value.facts),
    success: data.get(#success, or: $value.success),
    message: data.get(#message, or: $value.message),
  );

  @override
  RandomFactsResponseCopyWith<$R2, RandomFactsResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RandomFactsResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

