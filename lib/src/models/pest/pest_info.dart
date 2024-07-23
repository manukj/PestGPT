import 'package:json_annotation/json_annotation.dart';

part 'pest_info.g.dart';

@JsonSerializable(explicitToJson: true)
class LLMPestInfo {
  @JsonKey(name: 'ideal_temperature')
  final IdealTemperature? idealTemperature;
  final List<String>? precautions;
  final List<Pesticide>? pesticides;
  @JsonKey(name: 'pest_info')
  final String? pestInfo;

  LLMPestInfo({
    this.idealTemperature,
    this.precautions,
    this.pesticides,
    this.pestInfo,
  });

  factory LLMPestInfo.fromJson(Map<String, dynamic> json) =>
      _$LLMPestInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LLMPestInfoToJson(this);
}

@JsonSerializable()
class IdealTemperature {
  final String min;
  final String max;

  IdealTemperature({
    required this.min,
    required this.max,
  });

  factory IdealTemperature.fromJson(Map<String, dynamic> json) =>
      _$IdealTemperatureFromJson(json);
  Map<String, dynamic> toJson() => _$IdealTemperatureToJson(this);
}

@JsonSerializable()
class Pesticide {
  final String name;
  final String cost;

  Pesticide({
    required this.name,
    required this.cost,
  });

  factory Pesticide.fromJson(Map<String, dynamic> json) =>
      _$PesticideFromJson(json);
  Map<String, dynamic> toJson() => _$PesticideToJson(this);
}
