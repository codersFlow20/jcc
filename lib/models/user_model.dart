class UserModel {
  final String phoneNo;
  final String name;
  final String? profilePicUrl;
  final String notificationToken;

  const UserModel({
    required this.phoneNo,
    required this.name,
    required this.profilePicUrl,
    required this.notificationToken,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          phoneNo == other.phoneNo &&
          name == other.name &&
          profilePicUrl == other.profilePicUrl &&
          notificationToken == other.notificationToken);

  @override
  int get hashCode =>
      phoneNo.hashCode ^
      name.hashCode ^
      profilePicUrl.hashCode ^
      notificationToken.hashCode;

  @override
  String toString() {
    return 'UserModel{ phoneNo: $phoneNo, name: $name, profilePicUrl: $profilePicUrl, notificationToken: $notificationToken,}';
  }

  UserModel copyWith({
    String? phoneNo,
    String? name,
    String? profilePicUrl,
    String? notificationToken,
  }) {
    return UserModel(
      phoneNo: phoneNo ?? this.phoneNo,
      name: name ?? this.name,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      notificationToken: notificationToken ?? this.notificationToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNo': phoneNo,
      'name': name,
      'profilePicUrl': profilePicUrl ?? '',
      'notificationToken': notificationToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phoneNo: map['phoneNo'] as String,
      name: map['name'] as String,
      profilePicUrl: map['profilePicUrl'] as String,
      notificationToken: map['notificationToken'] as String,
    );
  }

//</editor-fold>
}
