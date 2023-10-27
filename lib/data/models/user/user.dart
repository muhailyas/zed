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
      this.isPrivate = false,
      required this.followers,
      required this.following});

  // Convert JSON to UserProfile
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: json['uid'],
      fullname: json['fullname'],
      userName: json['username'],
      email: json['email'],
      bio: json['bio'] ?? '',
      gender: json['gender'] ?? '',
      profilePhoto: json['profilephoto'] ?? '',
      coverPhoto: json['coverphoto'] ?? '',
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      mobile: json['mobile'] ?? '',
      isPrivate: json['isPrivate'] ?? false,
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
      'isPrivate': isPrivate,
      'followers': [],
      'following': []
    };
  }
}
