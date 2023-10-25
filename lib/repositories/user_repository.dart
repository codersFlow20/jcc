import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/user_model.dart';

import 'dart:developer' as dev;

class UserRepository {
  UserRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance;

  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  Future<UserModel?> registerUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.phoneNo).set(user.toMap());
      return user;
    }catch(e) {
      dev.log('Got registration error: $e', name: 'User');
      return null;
    }
  }

  Stream<UserModel?> getUserStream(String userId) {
    return _firestore.collection('users').doc(userId).snapshots().map((event) {
      final data = event.data();

      if (data != null) {
        var user = UserModel.fromMap(data);
        return user;
      }

      return null;
    });
  }
}
