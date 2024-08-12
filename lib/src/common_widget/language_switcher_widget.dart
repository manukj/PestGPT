import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LanguageButton(
          languageCode: 'en',
          countryCode: 'US',
          languageName: 'English',
        ),
        const SizedBox(width: 20),
        LanguageButton(
          languageCode: 'zh',
          countryCode: 'CN',
          languageName: '中文',
        ),
      ],
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String languageCode;
  final String countryCode;
  final String languageName;

  LanguageButton({
    required this.languageCode,
    required this.countryCode,
    required this.languageName,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = Get.locale?.languageCode == languageCode &&
        Get.locale?.countryCode == countryCode;

    return CommonPrimaryButton(
      width: 150,
      color: isSelected ? Colors.blue : Colors.grey,
      onPressed: () {
        var locale = Locale(languageCode, countryCode);
        Get.updateLocale(locale);
      },
      title: languageName,
    );
  }
}
