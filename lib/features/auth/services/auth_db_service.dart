import 'package:chateo/features/auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDbService {
  static final userCollection =
      FirebaseFirestore.instance.collection("users").withConverter(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );

  static Future<void> createUser(UserModel user) async {
    await userCollection.doc(user.id).set(user);
  }
}
