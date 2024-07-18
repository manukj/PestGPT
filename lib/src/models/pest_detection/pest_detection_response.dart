import 'package:json_annotation/json_annotation.dart';

part 'pest_detection_response.g.dart';

@JsonSerializable()
class PestDetectionResponse {
  @JsonKey(name: 'class_id')
  final double classId;

  @JsonKey(name: 'class_name')
  final String className;

  @JsonKey(name: 'confidence')
  final double confidence;

  @JsonKey(name: 'box')
  final List<double> box;

  PestDetectionResponse({
    required this.classId,
    required this.className,
    required this.confidence,
    required this.box,
  });

  factory PestDetectionResponse.fromJson(Map<String, dynamic> json) =>
      _$PestDetectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PestDetectionResponseToJson(this);
}
