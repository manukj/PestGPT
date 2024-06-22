import 'package:lang_internationalization/lang_internationalization.dart';

@LangInternationalization(["en_US", "zh_CN"])
class StringConstant {
  static String appName = 'Parallel Farm';
  static String welcomeToPFarm = 'Welcome To Parallel Farm';
  static String welcomeToPFarmDesc = 'Welcome to the future of farming';

  // login
  static String email = 'Email';
  static String password = 'Password';
  static String forgotPassword = 'Forgot Password';
  static String signIn = 'Sign In';
  static String signInWithFingerprint = 'Sign In With Fingerprint';
  static String orUse = 'OR USE';

  // register
  static String register = 'Register';
  static String createAccount = 'Create Account';
}
