// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'circular.dart';

class CircularMapper extends ClassMapperBase<Circular> {
  CircularMapper._();

  static CircularMapper? _instance;
  static CircularMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CircularMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Circular';

  static int _$id(Circular v) => v.id;
  static const Field<Circular, int> _f$id = Field('id', _$id);
  static String _$title(Circular v) => v.title;
  static const Field<Circular, String> _f$title = Field('title', _$title);
  static String? _$description(Circular v) => v.description;
  static const Field<Circular, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static String _$datePublished(Circular v) => v.datePublished;
  static const Field<Circular, String> _f$datePublished = Field(
    'datePublished',
    _$datePublished,
    key: r'documentDate',
  );
  static String? _$refNo(Circular v) => v.refNo;
  static const Field<Circular, String> _f$refNo = Field(
    'refNo',
    _$refNo,
    opt: true,
  );
  static String? _$author(Circular v) => v.author;
  static const Field<Circular, String> _f$author = Field(
    'author',
    _$author,
    opt: true,
  );
  static String? _$keywords(Circular v) => v.keywords;
  static const Field<Circular, String> _f$keywords = Field(
    'keywords',
    _$keywords,
    opt: true,
  );
  static String? _$link(Circular v) => v.link;
  static const Field<Circular, String> _f$link = Field(
    'link',
    _$link,
    opt: true,
  );
  static String? _$fileSize(Circular v) => v.fileSize;
  static const Field<Circular, String> _f$fileSize = Field(
    'fileSize',
    _$fileSize,
    key: r'filesize',
    opt: true,
  );

  @override
  final MappableFields<Circular> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #datePublished: _f$datePublished,
    #refNo: _f$refNo,
    #author: _f$author,
    #keywords: _f$keywords,
    #link: _f$link,
    #fileSize: _f$fileSize,
  };

  static Circular _instantiate(DecodingData data) {
    return Circular(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      datePublished: data.dec(_f$datePublished),
      refNo: data.dec(_f$refNo),
      author: data.dec(_f$author),
      keywords: data.dec(_f$keywords),
      link: data.dec(_f$link),
      fileSize: data.dec(_f$fileSize),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Circular fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Circular>(map);
  }

  static Circular fromJson(String json) {
    return ensureInitialized().decodeJson<Circular>(json);
  }
}

mixin CircularMappable {
  String toJson() {
    return CircularMapper.ensureInitialized().encodeJson<Circular>(
      this as Circular,
    );
  }

  Map<String, dynamic> toMap() {
    return CircularMapper.ensureInitialized().encodeMap<Circular>(
      this as Circular,
    );
  }

  CircularCopyWith<Circular, Circular, Circular> get copyWith =>
      _CircularCopyWithImpl<Circular, Circular>(
        this as Circular,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CircularMapper.ensureInitialized().stringifyValue(this as Circular);
  }

  @override
  bool operator ==(Object other) {
    return CircularMapper.ensureInitialized().equalsValue(
      this as Circular,
      other,
    );
  }

  @override
  int get hashCode {
    return CircularMapper.ensureInitialized().hashValue(this as Circular);
  }
}

extension CircularValueCopy<$R, $Out> on ObjectCopyWith<$R, Circular, $Out> {
  CircularCopyWith<$R, Circular, $Out> get $asCircular =>
      $base.as((v, t, t2) => _CircularCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CircularCopyWith<$R, $In extends Circular, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? title,
    String? description,
    String? datePublished,
    String? refNo,
    String? author,
    String? keywords,
    String? link,
    String? fileSize,
  });
  CircularCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CircularCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Circular, $Out>
    implements CircularCopyWith<$R, Circular, $Out> {
  _CircularCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Circular> $mapper =
      CircularMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    String? title,
    Object? description = $none,
    String? datePublished,
    Object? refNo = $none,
    Object? author = $none,
    Object? keywords = $none,
    Object? link = $none,
    Object? fileSize = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (description != $none) #description: description,
      if (datePublished != null) #datePublished: datePublished,
      if (refNo != $none) #refNo: refNo,
      if (author != $none) #author: author,
      if (keywords != $none) #keywords: keywords,
      if (link != $none) #link: link,
      if (fileSize != $none) #fileSize: fileSize,
    }),
  );
  @override
  Circular $make(CopyWithData data) => Circular(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    description: data.get(#description, or: $value.description),
    datePublished: data.get(#datePublished, or: $value.datePublished),
    refNo: data.get(#refNo, or: $value.refNo),
    author: data.get(#author, or: $value.author),
    keywords: data.get(#keywords, or: $value.keywords),
    link: data.get(#link, or: $value.link),
    fileSize: data.get(#fileSize, or: $value.fileSize),
  );

  @override
  CircularCopyWith<$R2, Circular, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CircularCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CircularsResponseMapper extends ClassMapperBase<CircularsResponse> {
  CircularsResponseMapper._();

  static CircularsResponseMapper? _instance;
  static CircularsResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CircularsResponseMapper._());
      CircularMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CircularsResponse';

  static List<Circular> _$data(CircularsResponse v) => v.data;
  static const Field<CircularsResponse, List<Circular>> _f$data = Field(
    'data',
    _$data,
  );
  static bool _$success(CircularsResponse v) => v.success;
  static const Field<CircularsResponse, bool> _f$success = Field(
    'success',
    _$success,
  );
  static String? _$message(CircularsResponse v) => v.message;
  static const Field<CircularsResponse, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );

  @override
  final MappableFields<CircularsResponse> fields = const {
    #data: _f$data,
    #success: _f$success,
    #message: _f$message,
  };

  static CircularsResponse _instantiate(DecodingData data) {
    return CircularsResponse(
      data: data.dec(_f$data),
      success: data.dec(_f$success),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CircularsResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CircularsResponse>(map);
  }

  static CircularsResponse fromJson(String json) {
    return ensureInitialized().decodeJson<CircularsResponse>(json);
  }
}

mixin CircularsResponseMappable {
  String toJson() {
    return CircularsResponseMapper.ensureInitialized()
        .encodeJson<CircularsResponse>(this as CircularsResponse);
  }

  Map<String, dynamic> toMap() {
    return CircularsResponseMapper.ensureInitialized()
        .encodeMap<CircularsResponse>(this as CircularsResponse);
  }

  CircularsResponseCopyWith<
    CircularsResponse,
    CircularsResponse,
    CircularsResponse
  >
  get copyWith =>
      _CircularsResponseCopyWithImpl<CircularsResponse, CircularsResponse>(
        this as CircularsResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CircularsResponseMapper.ensureInitialized().stringifyValue(
      this as CircularsResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return CircularsResponseMapper.ensureInitialized().equalsValue(
      this as CircularsResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return CircularsResponseMapper.ensureInitialized().hashValue(
      this as CircularsResponse,
    );
  }
}

extension CircularsResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CircularsResponse, $Out> {
  CircularsResponseCopyWith<$R, CircularsResponse, $Out>
  get $asCircularsResponse => $base.as(
    (v, t, t2) => _CircularsResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CircularsResponseCopyWith<
  $R,
  $In extends CircularsResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Circular, CircularCopyWith<$R, Circular, Circular>> get data;
  $R call({List<Circular>? data, bool? success, String? message});
  CircularsResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CircularsResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CircularsResponse, $Out>
    implements CircularsResponseCopyWith<$R, CircularsResponse, $Out> {
  _CircularsResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CircularsResponse> $mapper =
      CircularsResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Circular, CircularCopyWith<$R, Circular, Circular>>
  get data => ListCopyWith(
    $value.data,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(data: v),
  );
  @override
  $R call({List<Circular>? data, bool? success, Object? message = $none}) =>
      $apply(
        FieldCopyWithData({
          if (data != null) #data: data,
          if (success != null) #success: success,
          if (message != $none) #message: message,
        }),
      );
  @override
  CircularsResponse $make(CopyWithData data) => CircularsResponse(
    data: data.get(#data, or: $value.data),
    success: data.get(#success, or: $value.success),
    message: data.get(#message, or: $value.message),
  );

  @override
  CircularsResponseCopyWith<$R2, CircularsResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CircularsResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

