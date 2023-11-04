import 'dart:developer' as dev;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jcc/constants/string_constants.dart';
import 'package:jcc/utils/generators.dart';

import '../models/complaint_model.dart';
import '../models/complaint_stats_model.dart';

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
        .where(
          'userId',
          isEqualTo: _firebaseAuth.currentUser!.phoneNumber.toString(),
        )
        .snapshots()
        .map((event) {
      return event.docs
          .map(
            (e) => ComplaintModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    });
  }

  Future<void> updateComplaintToTaken(String id, Map<String, dynamic> data) async {
    return await _firestore.collection('complaints').doc(id).update(data);
  }

  Future<ComplaintModel?> registerComplaint(
      Map<String, dynamic> complaintData) async {
    try {
      final List<File> images = complaintData['images'];
      final String id = complaintData['id'];
      final urls = await uploadFiles(id, images);

      if (urls.length != images.length) {
        return null;
      } else {
        final time = DateTime.now();

        final complaint = ComplaintModel(
          id: id,
          departmentName: complaintData['department'],
          subject: complaintData['subject'],
          description: complaintData['description'],
          ward: complaintData['wardNo'],
          area: complaintData['area'],
          detailedAddress: complaintData['detailedAddress'],
          imageUrls: urls,
          isAssigned: false,
          isLocked: false,
          assignedEmployeeId: '',
          registrationDate: time,
          status: CommonDataConstants.complaintStatuses[0],
          uniquePin: GeneratorUtils.generateSixDigitRandomPin(),
          userId: complaintData['userId'],
          trackData: [
            TimeLine(
              date: time.toString(),
              status: 'Registered',
            ),
          ],
          // trackData: {
          //   'Registered' : time.toString(),
          // },
          noOfHours: 40,
          remarks: '',
          applicantName: complaintData['userName'],
        );

        await _firestore
            .collection('complaints')
            .doc(id)
            .set(complaint.toMap());

        await _firestore.collection('complaint_stats').doc('stats').update({
          'registered': id,
        });
        return complaint;
      }
    } catch (e) {
      dev.log('Got error in complaint registration: $e', name: 'Complaint');
      return null;
    }
  }

  Future<List<String>> uploadFiles(String id, List<File> files) async {
    List<String> urls = [];
    int count = 1;
    for (var file in files) {
      final ref = _firebaseStorage.ref().child(
            'complaint_photographs/cid_${id}_img_$count.jpg',
          );
      await ref
          .putFile(
        file,
        SettableMetadata(contentType: 'image/jpeg'),
      )
          .then((value) async {
        await value.ref.getDownloadURL().then((value) {
          urls.add(value);
        });
      });
      count++;
    }
    return urls;
  }

  Stream<ComplaintStatsModel?> getComplaintStats() {
    return _firestore
        .collection('complaint_stats')
        .doc('stats')
        .snapshots()
        .map((event) {
      try {
        final data = event.data();
        return ComplaintStatsModel.fromMap(data!);
      } catch (e) {
        dev.log('Got complaint stats error: $e', name: 'Stats');
        return null;
      }
    });
  }
}
