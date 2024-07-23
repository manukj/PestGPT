// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pest_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PestInfo _$PestInfoFromJson(Map<String, dynamic> json) => PestInfo(
      idealTemperature: json['ideal_temperature'] == null
          ? null
          : IdealTemperature.fromJson(
              json['ideal_temperature'] as Map<String, dynamic>),
      precautions: (json['precautions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pesticides: (json['pesticides'] as List<dynamic>?)
          ?.map((e) => Pesticide.fromJson(e as Map<String, dynamic>))
          .toList(),
      pestInfo: json['pest_info'] as String?,
    );

Map<String, dynamic> _$PestInfoToJson(PestInfo instance) => <String, dynamic>{
      'ideal_temperature': instance.idealTemperature?.toJson(),
      'precautions': instance.precautions,
      'pesticides': instance.pesticides?.map((e) => e.toJson()).toList(),
      'pest_info': instance.pestInfo,
    };

IdealTemperature _$IdealTemperatureFromJson(Map<String, dynamic> json) =>
    IdealTemperature(
      min: json['min'] as String,
      max: json['max'] as String,
    );

Map<String, dynamic> _$IdealTemperatureToJson(IdealTemperature instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

Pesticide _$PesticideFromJson(Map<String, dynamic> json) => Pesticide(
      name: json['name'] as String,
      cost: json['cost'] as String,
    );

Map<String, dynamic> _$PesticideToJson(Pesticide instance) => <String, dynamic>{
      'name': instance.name,
      'cost': instance.cost,
    };
