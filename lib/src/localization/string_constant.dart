class StringConstant {
  static const String appName = 'Parallel Farm';

  // Intro Page Strings
  static const String welcomeToPFarm = 'Welcome To Parallel Farm';
  static const String welcomeToPFarmDesc = 'Welcome to the future of farming';
}



abstract class StringConstantBase {
  String get appName;
  String get welcomeToPFarm;
  String get welcomeToPFarmDesc;
}

class StringConstantEnUs extends StringConstantBase {
  @override
  String get appName => 'Parallel Farm';

  @override
  String get welcomeToPFarm => 'Welcome To Parallel Farm';

  @override
  String get welcomeToPFarmDesc => 'Welcome to the future of farming';
}