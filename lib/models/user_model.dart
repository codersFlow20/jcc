class UserModel {
  final String phoneNo;
  final String name;
  final String profilePicUrl;
  final List<String> complaintIds;
  final String notificationToken;
  final String optional;

  const UserModel({
    required this.phoneNo,
    required this.name,
    required this.profilePicUrl,
    required this.complaintIds,
    required this.notificationToken,
    required this.optional,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          phoneNo == other.phoneNo &&
          name == other.name &&
          profilePicUrl == other.profilePicUrl &&
          complaintIds == other.complaintIds &&
          notificationToken == other.notificationToken &&
          optional == other.optional);

  @override
  int get hashCode =>
      phoneNo.hashCode ^
      name.hashCode ^
      profilePicUrl.hashCode ^
      complaintIds.hashCode ^
      notificationToken.hashCode ^
      optional.hashCode;

  @override
  String toString() {
    return 'UserModel{ phoneNo: $phoneNo, name: $name, profilePicUrl: $profilePicUrl, complaintIds: $complaintIds, notificationToken: $notificationToken, optional: $optional,}';
  }

  UserModel copyWith({
    String? phoneNo,
    String? name,
    String? profilePicUrl,
    List<String>? complaintIds,
    String? notificationToken,
    String? optional,
  }) {
    return UserModel(
      phoneNo: phoneNo ?? this.phoneNo,
      name: name ?? this.name,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      complaintIds: complaintIds ?? this.complaintIds,
      notificationToken: notificationToken ?? this.notificationToken,
      optional: optional ?? this.optional,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNo': phoneNo,
      'name': name,
      'profilePicUrl': profilePicUrl,
      'complaintIds': complaintIds,
      'notificationToken': notificationToken,
      'optional': optional,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phoneNo: map['phoneNo'] as String,
      name: map['name'] as String,
      profilePicUrl: map['profilePicUrl'] as String,
      complaintIds: map['complaintIds'] as List<String>,
      notificationToken: map['notificationToken'] as String,
      optional: map['optional'] as String,
    );
  }

//</editor-fold>
}
