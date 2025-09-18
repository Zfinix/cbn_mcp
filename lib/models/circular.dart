import 'package:dart_mappable/dart_mappable.dart';
import 'package:dartx/dartx.dart';

part 'circular.mapper.dart';

@MappableClass()
class Circular with CircularMappable {
  @MappableField(key: 'id')
  final int id;

  @MappableField(key: 'title')
  final String title;

  @MappableField(key: 'description')
  final String? description;

  @MappableField(key: 'documentDate')
  final String datePublished;

  @MappableField(key: 'refNo')
  final String? refNo;

  @MappableField(key: 'author')
  final String? author;

  @MappableField(key: 'keywords')
  final String? keywords;

  @MappableField(key: 'link')
  final String? link;

  @MappableField(key: 'filesize')
  final String? fileSize;

  const Circular({
    required this.id,
    required this.title,
    this.description,
    required this.datePublished,
    this.refNo,
    this.author,
    this.keywords,
    this.link,
    this.fileSize,
  });

  /// Get the PDF URL from the link field
  String? get pdfUrl {
    if (link.isNullOrBlank) return null;
    return link!.startsWith('http')
        ? link
        : Uri.encodeComponent('https://cbn.gov.ng$link').toString();
  }

  factory Circular.fromJson(String json) => CircularMapper.fromJson(json);

  factory Circular.fromMap(Map<String, dynamic> map) {
    final circular = CircularMapper.fromMap(map);
    return circular.copyWith(link: circular.pdfUrl);
  }
}

@MappableClass()
class CircularsResponse with CircularsResponseMappable {
  final List<Circular> data;

  final bool success;

  final String? message;

  const CircularsResponse({
    required this.data,
    required this.success,
    this.message,
  });

  factory CircularsResponse.fromResponse(dynamic data) {
    return switch (data) {
      List<dynamic> list => CircularsResponse(
        data: list
            .cast<Map<String, dynamic>>()
            .map((e) => Circular.fromMap(e))
            .toList(),
        success: true,
        message: null,
      ),
      Map<String, dynamic> map => CircularsResponseMapper.fromMap(map),
      _ => throw ArgumentError('Invalid data type: ${data.runtimeType}'),
    };
  }

  factory CircularsResponse.fromJson(String json) =>
      CircularsResponseMapper.fromJson(json);

  factory CircularsResponse.fromMap(Map<String, dynamic> map) =>
      CircularsResponseMapper.fromMap(map);
}

@MappableClass()
class CircularsFilterResult with CircularsFilterResultMappable {
  final bool success;
  final List<Circular> circulars;
  final int count;
  final Map<String, dynamic>? filtersApplied;
  final String message;

  const CircularsFilterResult({
    required this.success,
    required this.circulars,
    required this.count,
    this.filtersApplied,
    required this.message,
  });

  factory CircularsFilterResult.fromJson(String json) =>
      CircularsFilterResultMapper.fromJson(json);

  factory CircularsFilterResult.fromMap(Map<String, dynamic> map) =>
      CircularsFilterResultMapper.fromMap(map);
}

extension CircularsResponseExtension on CircularsResponse {
  CircularsResponse filterByDateRange({
    String? startDate,
    String? endDate,
    String? category,
    required int limit,
  }) {
    if (startDate == null && endDate == null && category == null) {
      return copyWith(data: [...data.take(limit)]);
    }

    final start = DateTime.tryParse(startDate ?? '');
    final end = DateTime.tryParse(endDate ?? '');

    return copyWith(
      data: data
          .where((circular) {
            // Date filtering
            bool dateMatch = true;
            if (startDate != null || endDate != null) {
              final date = DateTime.parse(circular.datePublished);
              dateMatch =
                  (start == null ||
                      date.isAfter(start) ||
                      date.isAtSameMomentAs(start)) &&
                  (end == null ||
                      date.isBefore(end) ||
                      date.isAtSameMomentAs(end));
            }

            // Category filtering (search in keywords since there's no category field)
            bool categoryMatch = true;
            if (category != null) {
              categoryMatch =
                  circular.keywords?.toLowerCase().contains(
                    category.toLowerCase(),
                  ) ??
                  false;
            }

            return dateMatch && categoryMatch;
          })
          .take(limit)
          .toList(),
    );
  }
}
