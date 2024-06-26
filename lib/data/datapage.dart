

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seedflowhub/models/userdata.dart';


class DataPage {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> storeUserData(UserModel user) async {
    await _usersCollection.doc(user.uid).set(user.toJson());
  }
}
