import 'package:chateo/features/auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  static Stream<List<UserModel>> getUserStream() {
    final userStream = userCollection.snapshots();

    final userListStream = userStream
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    return userListStream;
  }
}
