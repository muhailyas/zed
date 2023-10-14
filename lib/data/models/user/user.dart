class UserProfile {
  String? uid;
  String userName;
  String email;
  String bio;
  String gender;
  String profilePhoto;
  String coverPhoto;
  DateTime? birthDay;
  String mobile;
  bool isPrivate;
  UserProfile(
      {this.uid,
      required this.userName,
      required this.email,
       this.bio='',
       this.gender='',
       this.profilePhoto='',
       this.coverPhoto='',
       this.birthDay,
       this.mobile='',
      this.isPrivate = false});
}
