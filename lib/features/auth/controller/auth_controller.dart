import 'package:chateo/core/utils/snackbar_utils.dart';
import 'package:chateo/features/auth/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  void build() {}

  Future<void> signup(String email, String password) async {
    try {
      await AuthService.signup(email, password);
      SnackbarUtils.showMessage("Signup Success");
    } catch (e) {
      SnackbarUtils.showMessage(e.toString());
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex =
        RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$');
    if (emailRegex.hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return "Password must be atleast 8 characters";
    }

    return null;
  }

  String? validateConfirm(String? password, String? confirm) {
    if (confirm == null || confirm.isEmpty) {
      return "Confirm Password is required";
    }

    if (confirm != password) {
      return "Password & Confirm password must be same";
    }

    return null;
  }
}
