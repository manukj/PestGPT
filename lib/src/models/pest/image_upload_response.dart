import 'package:json_annotation/json_annotation.dart';

part 'image_upload_response.g.dart';

@JsonSerializable()
class ImageUploadResponse {
  final String id;
  final List<String> files;

  ImageUploadResponse({
    required this.id,
    required this.files,
  });

  String getFirstImageUrl() {
    return files[0]
        .replaceFirst('https://fcimcshk.oss-cn-hongkong.aliyuncs.com/', '');
  }

  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageUploadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageUploadResponseToJson(this);
}
