class UserProfile {
  String? uid;
  String fullname;
  String userName;
  String email;
  String bio;
  String gender;
  String profilePhoto;
  String coverPhoto;
  DateTime? birthday;
  String mobile;
  bool isPrivate;
  UserProfile(
      {this.uid,
      required this.fullname,
      required this.userName,
      required this.email,
      this.bio = '',
      this.gender = '',
      this.profilePhoto = '',
      this.coverPhoto = '',
      this.birthday,
      this.mobile = '',
      this.isPrivate = false});

  // Convert JSON to UserProfile
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: json['uid'],
      fullname: json['fullname'],
      userName: json['username'],
      email: json['email'],
      bio: json['bio'] ?? '',
      gender: json['gender'] ?? '', 
      profilePhoto: json['profilePhoto'] ?? '', 
      coverPhoto: json['coverphoto'] ?? '',
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      mobile: json['mobile'] ?? '',
      isPrivate: json['isPrivate'] ?? false,
    );
  }

  // Convert UserProfile to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fullname': fullname,
      'userName': userName,
      'email': email,
      'bio': bio,
      'gender': gender,
      'profilePhoto': profilePhoto,
      'coverPhoto': coverPhoto,
      'birthday': birthday?.toIso8601String(),
      'mobile': mobile,
      'isPrivate': isPrivate,
    };
  }
}
