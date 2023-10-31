import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final DateTime timeStamp;
  final String departmentName;
  final String description;
  final String complaintId;
  final String userId;

  NotificationModel({
    required this.timeStamp,
    required this.departmentName,
    required this.description,
    required this.complaintId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'timeStamp': timeStamp,
      'departmentName': departmentName,
      'description': description,
      'complaintId': complaintId,
      'userId': userId,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      timeStamp: (map['timeStamp'] as Timestamp).toDate(),
      departmentName: map['departmentName'] as String,
      description: map['description'] as String,
      complaintId: map['complaintId'] as String,
      userId: map['userId'] as String,
    );
  }
}
