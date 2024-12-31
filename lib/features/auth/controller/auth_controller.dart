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
}
