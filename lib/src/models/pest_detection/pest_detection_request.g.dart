// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pest_detection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PestDetectionRequest _$PestDetectionRequestFromJson(
        Map<String, dynamic> json) =>
    PestDetectionRequest(
      detectionList: (json['detectionList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PestDetectionRequestToJson(
        PestDetectionRequest instance) =>
    <String, dynamic>{
      'detectionList': instance.detectionList,
    };
