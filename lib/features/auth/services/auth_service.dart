import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final userCollection = FirebaseFirestore.instance.collection("users");

  static Future<void> signup(String email, String password) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    userCollection.doc().set({
      'email': email,
    });
    userCollection.add({
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });
    userCollection.doc().update({
      'email': email,
    });
    userCollection.doc().delete();

    final data = await userCollection.doc().get();
    data.data();

    final stream = userCollection.doc().snapshots();
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
