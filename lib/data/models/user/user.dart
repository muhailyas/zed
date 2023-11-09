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
  List followers;
  List following;
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
      required this.followers,
      required this.following});

  // Convert JSON to UserProfile
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: json['uid'],
      fullname: json['fullname'],
      userName: json['userName'],
      email: json['email'],
      bio: json['bio'] ?? '',
      gender: json['gender'] ?? '',
      profilePhoto: json['profilephoto'] ?? '',
      coverPhoto: json['coverPhoto'] ?? '',
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      mobile: json['mobile'] ?? '',
      followers: json['followers'],
      following: json['following'],
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
      'profilephoto': profilePhoto,
      'coverPhoto': coverPhoto,
      'birthday': birthday?.toIso8601String(),
      'mobile': mobile,
      'followers': [],
      'following': []
    };
  }
}
