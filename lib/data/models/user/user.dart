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
}
