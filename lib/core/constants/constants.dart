import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'constants.g.dart';

class Constants {
  // Login
  final String txtHeading = "Register";
  final String txtSubHeading = "You and Your Friends always Connected";
  final String txtContinueBtn = "Continue";
  final String txtUserName = "User Name";
  final String txtEmail = "Email";
  final String txtPassword = "Password";
  final String txtConfirmPassword = "Confirm Password";
  final String txtAlreadyHaveAccount = "Already have an account?";
  final String txtLogin = "Log In";
}

@riverpod
Constants constants(ConstantsRef ref) {
  return Constants();
}
