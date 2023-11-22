import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final DateTime timeStamp;
  final String departmentName;
  final String description;
  final String complaintId;
  final String userId;
  final String ward;

  NotificationModel({
    required this.timeStamp,
    required this.departmentName,
    required this.description,
    required this.complaintId,
    required this.userId,
    required this.ward,
  });

  Map<String, dynamic> toMap() {
    return {
      'timeStamp': timeStamp,
      'departmentName': departmentName,
      'description': description,
      'complaintId': complaintId,
      'userId': userId,
      'ward' : ward,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      timeStamp: (map['timeStamp'] as Timestamp).toDate(),
      departmentName: map['departmentName'] as String,
      description: map['description'] as String,
      complaintId: map['complaintId'] as String,
      userId: map['userId'] as String,
      ward: map['ward'] as String,
    );
  }
}
