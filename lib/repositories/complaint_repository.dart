import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as dev;
import '../models/complaint_model.dart';

class ComplaintRepository {
  ComplaintRepository({
    FirebaseFirestore? firestore,
    FirebaseAuth? firebaseAuth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  Stream<List<ComplaintModel>> getComplaints() {
    // ComplaintModel model = ComplaintModel(
    //   id: '46',
    //   description: 'description',
    //   registrationDate: DateTime.now(),
    //   departmentName: 'Civil',
    //   subject: 'Irregular water ',
    //   ward: '12',
    //   area: 'area',
    //   userId: '+916355303321',
    //   uniquePin: 'uniquePin',
    //   imageUrls: const ['imageUrls'],
    //   status: 'status',
    //   optionalNumber: 'optionalNumber',
    //   siteAddress: 'siteAddress',
    //   isLocked: false,
    //   isAssigned: false,
    //   assignedId: 'assignedId',
    // );
    // _firestore.collection('complaints').doc('46').set(model.toMap());
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
}
