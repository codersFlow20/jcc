import 'package:equatable/equatable.dart';

class ComplaintModel extends Equatable {
  final String id;
  final String description;
  final DateTime registrationDate;
  final String departmentName;
  final String subject;
  final String ward;
  final String area;
  final String userId;
  final String uniquePin;
  final List<String> imageUrls;
  final String status;
  final String optionalNumber;
  final String siteAddress;
  final bool isLocked;
  final bool isAssigned;
  final String assignedId;

  const ComplaintModel({
    required this.id,
    required this.description,
    required this.registrationDate,
    required this.departmentName,
    required this.subject,
    required this.ward,
    required this.area,
    required this.userId,
    required this.uniquePin,
    required this.imageUrls,
    required this.status,
    required this.optionalNumber,
    required this.siteAddress,
    required this.isLocked,
    required this.isAssigned,
    required this.assignedId,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        registrationDate,
        departmentName,
        subject,
        ward,
        area,
        userId,
        uniquePin,
        imageUrls,
        status,
        optionalNumber,
        siteAddress,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'registrationDate': registrationDate,
      'departmentName': departmentName,
      'subject': subject,
      'ward': ward,
      'area': area,
      'userId': userId,
      'uniquePin': uniquePin,
      'imageUrls': imageUrls,
      'status': status,
      'optionalNumber': optionalNumber,
      'siteAddress': siteAddress,
      'isLocked': isLocked,
      'isAssigned': isAssigned,
      'assignedId': assignedId,
    };
  }

  factory ComplaintModel.fromMap(Map<String, dynamic> map) {
    return ComplaintModel(
      id: map['id'] as String,
      description: map['description'] as String,
      registrationDate: map['registrationDate'] as DateTime,
      departmentName: map['departmentName'] as String,
      subject: map['subject'] as String,
      ward: map['ward'] as String,
      area: map['area'] as String,
      userId: map['userId'] as String,
      uniquePin: map['uniquePin'] as String,
      imageUrls: map['imageUrls'] as List<String>,
      status: map['status'] as String,
      optionalNumber: map['optionalNumber'] as String,
      siteAddress: map['siteAddress'] as String,
      isLocked: map['isLocked'] as bool,
      isAssigned: map['isAssigned'] as bool,
      assignedId: map['assignedId'] as String,
    );
  }
}
