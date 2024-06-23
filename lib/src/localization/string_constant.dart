import 'package:lang_internationalization/lang_internationalization.dart';

@LangInternationalization(["en_US", "zh_CN"])
class StringConstant {
  static const String appName = 'Parallel Farm';
  static const String welcomeToPFarm = 'Welcome To Parallel Farm';
  static const String welcomeToPFarmDesc = 'Welcome to the future of farming';

  // login
  static const String email = 'Email';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot your password?';
  static const String signIn = 'Sign In';
  static const String signInWithFingerprint = 'Sign In With Fingerprint';
  static const String orUse = 'OR USE';

  // register
  static const String register = 'Register';
  static const String createAccount = 'Create Account';

  // home
  static const String home = 'Home';
}
