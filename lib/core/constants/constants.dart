import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'constants.g.dart';

class Constants {
  // Signup Page
  final String txtHeading = "Register";
  final String txtSubHeading = "You and Your Friends always Connected";
  final String txtContinueBtn = "Continue";
  final String txtUserName = "User Name";
  final String txtEmail = "Email";
  final String txtPassword = "Password";
  final String txtConfirmPassword = "Confirm Password";
  final String txtAlreadyHaveAccount = "Already have an account?";
  final String txtLogin = "Log In";
  // Login Page
  final String txtLoginHeading = "Login";
  final String txtLoginSubHeading =
      "Remember to get up & stretch once in a while - Your friends at chat";

  final String txtDontHaveAccount = "Don't have an account?";
  final String txtSignup = "Sign Up";
  final String txtForgotPassword = "Forgto Password?";
  //forgot Page
  final String txtForgotHeading = "Forgot Password";
  final String txtForgotSubHeading =
      "Enter the email address you used to create your account and we will email you a link to\nreset your password.";

  //chat Page
  final String txtChat = "Chats";
  final String txtSearchHintText = "Placeholder";
}

@riverpod
Constants constants(ConstantsRef ref) {
  return Constants();
}
