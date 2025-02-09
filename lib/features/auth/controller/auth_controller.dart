import 'package:chateo/core/utils/snackbar_utils.dart';
import 'package:chateo/features/auth/models/user_model.dart';
import 'package:chateo/features/auth/services/auth_db_service.dart';
import 'package:chateo/features/auth/services/auth_service.dart';
import 'package:chateo/features/auth/view/pages/login_page.dart';
import 'package:chateo/features/nav/view/pages/navigation_page.dart';
import 'package:chateo/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  void build() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        MyApp.navigatorKey.currentContext!.go(LoginPage.routePath);
      } else {
        MyApp.navigatorKey.currentContext!.go(NavigationPage.routePath);
      }
    });
  }

  Future<void> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await AuthService.signup(name: name, email: email, password: password);

      final userDetails = AuthService.getCurrentUserSync();
      final user = UserModel(id: userDetails!.uid, name: name, email: email);
      AuthDbService.createUser(user);
      SnackbarUtils.showMessage("Signup Success");
    } catch (e) {
      SnackbarUtils.showMessage(e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await AuthService.login(email, password);
      SnackbarUtils.showMessage("Login Successfully");
    } catch (e) {
      SnackbarUtils.showMessage(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await AuthService.logout();
      SnackbarUtils.showMessage("Logout Successfully");
    } catch (e) {
      SnackbarUtils.showMessage(e.toString());
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await AuthService.sendPasswordResetEmail(email);

      SnackbarUtils.showMessage("Password Reset mail sent successfully");
    } catch (e) {
      SnackbarUtils.showMessage(e.toString());
    }
  }

// validations Logic
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex =
        RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$');
    if (!emailRegex.hasMatch(value)) {
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

  Stream<List<UserModel>> getUserStream() {
    return AuthDbService.getUserStream();
  }
}
