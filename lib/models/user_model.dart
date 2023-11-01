import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String phoneNo;
  final String name;
  final String? profilePicUrl;
  final String notificationToken;
  final String? email;

  const UserModel({
    required this.phoneNo,
    required this.name,
    this.profilePicUrl,
    required this.notificationToken,
    this.email,
  });

  @override
  String toString() {
    return 'UserModel{ phoneNo: $phoneNo, name: $name, profilePicUrl: $profilePicUrl, notificationToken: $notificationToken, email: $email}';
  }

  UserModel copyWith({
    String? phoneNo,
    String? name,
    String? profilePicUrl,
    String? notificationToken,
    String? email,
  }) {
    return UserModel(
      phoneNo: phoneNo ?? this.phoneNo,
      name: name ?? this.name,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      notificationToken: notificationToken ?? this.notificationToken,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNo': phoneNo,
      'name': name,
      'profilePicUrl': profilePicUrl ?? '',
      'notificationToken': notificationToken,
      'email': email ?? '',
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final profilePicUrl = map['profilePicUrl'] as String;
    final email = map['email'] as String;

    return UserModel(
      phoneNo: map['phoneNo'] as String,
      name: map['name'] as String,
      profilePicUrl: profilePicUrl == '' ? null : profilePicUrl,
      notificationToken: map['notificationToken'] as String,
      email: email == '' ? null : email,
    );
  }

  @override
  List<Object?> get props => [
        name,
        phoneNo,
        profilePicUrl,
        notificationToken,
        email,
      ];

//</editor-fold>
}
