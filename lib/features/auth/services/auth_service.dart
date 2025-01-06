import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<void> signup(
      {required String name,
      required String email,
      required String password}) async {
    final credentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    credentials.user!.updateDisplayName(name);
  }

  static Future<void> login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static User? getCurrentUserSync() {
    return FirebaseAuth.instance.currentUser;
  }
}
