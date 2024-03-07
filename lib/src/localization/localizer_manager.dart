import 'package:get/get.dart';
import 'package:pest_gpt/src/localization/en_us.dart';
import 'package:pest_gpt/src/localization/zh_cn.dart';

class LocalizationManager extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {...enUs, ...zhCn};
}
