import 'package:dart_mappable/dart_mappable.dart';

part 'random.mapper.dart';

@MappableClass()
class RandomFact with RandomFactMappable {
  @MappableField(key: 'id')
  final int id;

  @MappableField(key: 'factText')
  final String factText;

  @MappableField(key: 'factDate')
  final String factDate;

  const RandomFact({
    required this.id,
    required this.factText,
    required this.factDate,
  });

  factory RandomFact.fromResponse(dynamic data) {
    return switch (data) {
      List<dynamic> list => RandomFact.fromMap(list[0] as Map<String, dynamic>),
      Map<String, dynamic> map => RandomFactMapper.fromMap(map),
      _ => throw ArgumentError('Invalid data type: ${data.runtimeType}'),
    };
  }

  factory RandomFact.fromJson(String json) => RandomFactMapper.fromJson(json);

  factory RandomFact.fromMap(Map<String, dynamic> map) =>
      RandomFactMapper.fromMap(map);
}

@MappableClass()
class RandomFactsResponse with RandomFactsResponseMappable {
  final List<RandomFact> facts;
  final bool success;
  final String? message;

  const RandomFactsResponse({
    required this.facts,
    required this.success,
    this.message,
  });

  factory RandomFactsResponse.fromJson(String json) =>
      RandomFactsResponseMapper.fromJson(json);

  factory RandomFactsResponse.fromMap(Map<String, dynamic> map) =>
      RandomFactsResponseMapper.fromMap(map);
}
