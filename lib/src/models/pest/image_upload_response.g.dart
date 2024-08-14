// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUploadResponse _$ImageUploadResponseFromJson(Map<String, dynamic> json) =>
    ImageUploadResponse(
      id: json['id'] as String,
      files: (json['files'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ImageUploadResponseToJson(
        ImageUploadResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'files': instance.files,
    };
