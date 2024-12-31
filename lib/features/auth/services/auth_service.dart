import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<void> signup(String email, String password) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
