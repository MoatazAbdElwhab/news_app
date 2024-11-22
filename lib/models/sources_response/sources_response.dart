import 'source.dart';

class SourcesResponse {
  final String status;
  final List<Source> sources;

  const SourcesResponse({required this.status, required this.sources});

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json['status'] as String,
      sources: (json['sources'] as List<dynamic>)
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'sources': sources.map((e) => e.toJson()).toList(),
      };

  SourcesResponse copyWith({
    String? status,
    List<Source>? sources,
  }) {
    return SourcesResponse(
      status: status ?? this.status,
      sources: sources ?? this.sources,
    );
  }
}
