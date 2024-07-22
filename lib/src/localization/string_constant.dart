import 'package:lang_internationalization/lang_internationalization.dart';

@LangInternationalization(["en_US", "zh_CN"])
class StringConstant {
  static const String appName = 'Parallel Farm';
  static const String welcomeToPFarm = 'Welcome To Parallel Farm';
  static const String welcomeToPFarmDesc = 'Welcome to the future of farming';
  static const String invalidEmail = 'Invalid Email';
  static const String userNameCannotBeEmpty = 'User Name cannot be empty';
  static const String passwordCannotBeEmpty = 'Password cannot be empty';
  static const String somethingWentWrong = 'Something went wrong';
  static const String loginSuccess = 'Login Success';

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
  static const String userName = 'User Name';
  static const String mobileNumber = 'Mobile Number';
  static const String congfirmPassword = 'Confirm Password';
  static const String alreadyHaveAnAccount = 'Already have an account?';
  static const String signUp = 'Sign Up';

  // home
  static const String home = 'Home';

  //pest detection 
  static const String detectPest = 'Detect Pest';
  static const String failedToDetectPest = 'Failed to detect pest';
  static const String pestDetected = 'Pest detected';
  static const String pestDetails = 'Pest Details';
  static const String showPestDetails = 'Show Pest Details';
}
