import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'constants.g.dart';

class Constants {
  // Login
  final String txtHeading = "Register";
  final String txtSubHeading = "You and Your Friends always Connected";
  final String txtContinueBtn = "CONTINUE";
  final String txtUserName = "User Name";
  final String txtEmail = "Email";
  final String txtPassword = "Password";
  final String txtConfirmPassword = "Confirm Password";
}

@riverpod
Constants constants(ConstantsRef ref) {
  return Constants();
}
