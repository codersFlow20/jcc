import 'dart:developer' as dev;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/complaint_model.dart';

class ComplaintRepository {
  ComplaintRepository({
    FirebaseFirestore? firestore,
    FirebaseAuth? firebaseAuth,
    FirebaseStorage? firebaseStorage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;

  Stream<List<ComplaintModel>> getComplaints() {
    dev.log("Current User : ${_firebaseAuth.currentUser!.phoneNumber}");
    return _firestore
        .collection('complaints')
        .where('userId',
            isEqualTo: _firebaseAuth.currentUser!.phoneNumber.toString())
        .snapshots()
        .map((event) {
      return event.docs.map((e) => ComplaintModel.fromMap(e.data())).toList();
    });
  }

  Future<ComplaintModel> registerComplaint(Map<String, dynamic> data) {
    ComplaintModel _complaintModel = ComplaintModel.fromMap(data);
    return _firestore.collection('complaints').add(data).then((value) {
      _complaintModel.copyWith(id: value.id);
      return _complaintModel;
    });
  }

  Future<List<String>> uploadFiles(List<File> files) async {
    List<String> _urls = [];
    for (var file in files) {
      final ref = _firebaseStorage.ref().child('complaints/${file.path}');
      await ref.putFile(file).then((value) async {
        await value.ref.getDownloadURL().then((value) {
          _urls.add(value);
        });
      });
    }
    return _urls;
  }
}
