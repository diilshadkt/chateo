import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'constants.g.dart';

class Constants {
  // Signup
  final String txtHeading = "Register";
  final String txtSubHeading = "You and Your Friends always Connected";
  final String txtContinueBtn = "Continue";
  final String txtUserName = "User Name";
  final String txtEmail = "Email";
  final String txtPassword = "Password";
  final String txtConfirmPassword = "Confirm Password";
  final String txtAlreadyHaveAccount = "Already have an account?";
  final String txtLogin = "Log In";
  // Login
   final String txtLoginHeading = "Login";
  final String txtLoginSubHeading = "Remember to get up & stretch once in a while - Your friends at chat";
  
  final String txtDontHaveAccount = "Don't have an account?";
  final String txtSignup = "Sign Up";
}

@riverpod
Constants constants(ConstantsRef ref) {
  return Constants();
}
