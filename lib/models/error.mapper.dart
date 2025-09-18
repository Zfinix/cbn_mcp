// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'error.dart';

class ApiRequestFailureMapper extends ClassMapperBase<ApiRequestFailure> {
  ApiRequestFailureMapper._();

  static ApiRequestFailureMapper? _instance;
  static ApiRequestFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiRequestFailureMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApiRequestFailure';

  static String _$status(ApiRequestFailure v) => v.status;
  static const Field<ApiRequestFailure, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: '',
  );
  static String _$message(ApiRequestFailure v) => v.message;
  static const Field<ApiRequestFailure, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<ApiRequestFailure> fields = const {
    #status: _f$status,
    #message: _f$message,
  };

  static ApiRequestFailure _instantiate(DecodingData data) {
    return ApiRequestFailure(
      status: data.dec(_f$status),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ApiRequestFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApiRequestFailure>(map);
  }

  static ApiRequestFailure fromJson(String json) {
    return ensureInitialized().decodeJson<ApiRequestFailure>(json);
  }
}

mixin ApiRequestFailureMappable {
  String toJson() {
    return ApiRequestFailureMapper.ensureInitialized()
        .encodeJson<ApiRequestFailure>(this as ApiRequestFailure);
  }

  Map<String, dynamic> toMap() {
    return ApiRequestFailureMapper.ensureInitialized()
        .encodeMap<ApiRequestFailure>(this as ApiRequestFailure);
  }

  ApiRequestFailureCopyWith<
    ApiRequestFailure,
    ApiRequestFailure,
    ApiRequestFailure
  >
  get copyWith =>
      _ApiRequestFailureCopyWithImpl<ApiRequestFailure, ApiRequestFailure>(
        this as ApiRequestFailure,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ApiRequestFailureMapper.ensureInitialized().stringifyValue(
      this as ApiRequestFailure,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApiRequestFailureMapper.ensureInitialized().equalsValue(
      this as ApiRequestFailure,
      other,
    );
  }

  @override
  int get hashCode {
    return ApiRequestFailureMapper.ensureInitialized().hashValue(
      this as ApiRequestFailure,
    );
  }
}

extension ApiRequestFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApiRequestFailure, $Out> {
  ApiRequestFailureCopyWith<$R, ApiRequestFailure, $Out>
  get $asApiRequestFailure => $base.as(
    (v, t, t2) => _ApiRequestFailureCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ApiRequestFailureCopyWith<
  $R,
  $In extends ApiRequestFailure,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? status, String? message});
  ApiRequestFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ApiRequestFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApiRequestFailure, $Out>
    implements ApiRequestFailureCopyWith<$R, ApiRequestFailure, $Out> {
  _ApiRequestFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApiRequestFailure> $mapper =
      ApiRequestFailureMapper.ensureInitialized();
  @override
  $R call({String? status, String? message}) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (message != null) #message: message,
    }),
  );
  @override
  ApiRequestFailure $make(CopyWithData data) => ApiRequestFailure(
    status: data.get(#status, or: $value.status),
    message: data.get(#message, or: $value.message),
  );

  @override
  ApiRequestFailureCopyWith<$R2, ApiRequestFailure, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApiRequestFailureCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ServerErrorMapper extends ClassMapperBase<ServerError> {
  ServerErrorMapper._();

  static ServerErrorMapper? _instance;
  static ServerErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServerErrorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServerError';

  static String _$error(ServerError v) => v.error;
  static const Field<ServerError, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
    def: '',
  );
  static String _$message(ServerError v) => v.message;
  static const Field<ServerError, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<ServerError> fields = const {
    #error: _f$error,
    #message: _f$message,
  };

  static ServerError _instantiate(DecodingData data) {
    return ServerError(
      error: data.dec(_f$error),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ServerError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServerError>(map);
  }

  static ServerError fromJson(String json) {
    return ensureInitialized().decodeJson<ServerError>(json);
  }
}

mixin ServerErrorMappable {
  String toJson() {
    return ServerErrorMapper.ensureInitialized().encodeJson<ServerError>(
      this as ServerError,
    );
  }

  Map<String, dynamic> toMap() {
    return ServerErrorMapper.ensureInitialized().encodeMap<ServerError>(
      this as ServerError,
    );
  }

  ServerErrorCopyWith<ServerError, ServerError, ServerError> get copyWith =>
      _ServerErrorCopyWithImpl<ServerError, ServerError>(
        this as ServerError,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ServerErrorMapper.ensureInitialized().stringifyValue(
      this as ServerError,
    );
  }

  @override
  bool operator ==(Object other) {
    return ServerErrorMapper.ensureInitialized().equalsValue(
      this as ServerError,
      other,
    );
  }

  @override
  int get hashCode {
    return ServerErrorMapper.ensureInitialized().hashValue(this as ServerError);
  }
}

extension ServerErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServerError, $Out> {
  ServerErrorCopyWith<$R, ServerError, $Out> get $asServerError =>
      $base.as((v, t, t2) => _ServerErrorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServerErrorCopyWith<$R, $In extends ServerError, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? error, String? message});
  ServerErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServerErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServerError, $Out>
    implements ServerErrorCopyWith<$R, ServerError, $Out> {
  _ServerErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServerError> $mapper =
      ServerErrorMapper.ensureInitialized();
  @override
  $R call({String? error, String? message}) => $apply(
    FieldCopyWithData({
      if (error != null) #error: error,
      if (message != null) #message: message,
    }),
  );
  @override
  ServerError $make(CopyWithData data) => ServerError(
    error: data.get(#error, or: $value.error),
    message: data.get(#message, or: $value.message),
  );

  @override
  ServerErrorCopyWith<$R2, ServerError, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ServerErrorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

