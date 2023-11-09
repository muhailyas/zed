import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed/data/data_sources/image_upload_to_storage/image_upload_to_storage.dart';
import 'package:zed/data/data_sources/post_data_source/post_data_source.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/presentation/screens/edit_field_screen/edit_field_screen.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/image_picker/image_picker.dart';

ValueNotifier<UserProfile?> userProfile = ValueNotifier(null);

class ScreenEditProfile extends StatelessWidget {
  const ScreenEditProfile({super.key, required this.user});
  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    userProfile.value = user;
    return ValueListenableBuilder(
        valueListenable: userProfile,
        builder: (context, value, _) {
          return Scaffold(
            backgroundColor: primaryColor,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  fullWidth,
                  SizedBox(
                    height: screenHeight * 0.24,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: screenHeight * 0.14,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: secondaryBlue,
                              image: value!.coverPhoto.isNotEmpty
                                  ? DecorationImage(
                                      image: NetworkImage(value.coverPhoto),
                                      fit: BoxFit.cover)
                                  : null),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back,
                                      color: whiteColor)),
                              width10,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text("Edit profile",
                                    style: customFontStyle(
                                        fontWeight: FontWeight.w600)),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () async {
                                  final imageUrl = await photoUpdate(
                                      foldername: 'coverPhotos');
                                  if (imageUrl.isNotEmpty) {
                                    userProfile.value!.coverPhoto = imageUrl;
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Icon(Iconsax.edit,
                                      size: 20, color: whiteColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: loadingNotifier,
                            builder: (context, loading, _) {
                              return Positioned(
                                bottom: 25,
                                left: 15,
                                child: Container(
                                  height: screenHeight * 0.15,
                                  width: screenHeight * 0.15,
                                  decoration: BoxDecoration(
                                      image: value.profilePhoto.isNotEmpty
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                  value.profilePhoto),
                                              fit: BoxFit.cover)
                                          : const DecorationImage(
                                              image: NetworkImage(
                                                  defaultProfileImage)),
                                      color: secondaryDark,
                                      shape: BoxShape.circle),
                                  child: loading
                                      ? CupertinoActivityIndicator(
                                          color: whiteColor,
                                          radius: screenWidth * 0.05)
                                      : null,
                                ),
                              );
                            }),
                        Positioned(
                            bottom: 0,
                            left: 15,
                            child: InkWell(
                              onTap: () async {
                                final imageUrl = await photoUpdate(
                                    foldername: 'profilePhotos');
                                if (imageUrl.isNotEmpty) {
                                  userProfile.value!.profilePhoto = imageUrl;
                                }
                                loadingNotifier.value = false;
                              },
                              child: Text("Edit profile photo",
                                  style: customFontStyle(size: 18)),
                            ))
                      ],
                    ),
                  ),
                  height10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name",
                            style: customFontStyle(size: 18, color: greyColor)),
                        height005,
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EditFieldScreen(field: Field.name),
                                ));
                          },
                          child: Text(
                            value.fullname,
                            style: customFontStyle(size: 16),
                          ),
                        ),
                        divider,
                        height05,
                        Text("Username",
                            style: customFontStyle(size: 18, color: greyColor)),
                        height005,
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditFieldScreen(
                                      field: Field.username),
                                ));
                          },
                          child: Text(
                            value.userName,
                            style: customFontStyle(size: 16),
                          ),
                        ),
                        divider,
                        height05,
                        Text("Bio",
                            style: customFontStyle(size: 18, color: greyColor)),
                        height005,
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EditFieldScreen(field: Field.bio),
                                ));
                          },
                          child: Text(
                            userProfile.value!.bio.isEmpty
                                ? "Add your bio here"
                                : value.bio,
                            style: customFontStyle(size: 16),
                          ),
                        ),
                        divider,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Future<String> photoUpdate({required String foldername}) async {
  final imagePath = await ImagePickerProvider().pickImage(ImageSource.gallery);
  foldername.contains('profilePhotos') ? loadingNotifier.value = true : null;
  if (imagePath != null) {
    final response =
        await FireStoreStorage().uploadImageAndGetUrl(imagePath, foldername);
    updateImages(response, foldername.contains('profilePhotos'));
    return response;
  } else {
    return '';
  }
}

Future<void> updateImages(String url, bool isProfile) async {
  if (isProfile) {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'profilephoto': url,
    });
    PostDataSource().updateProfileInPost(url);
  } else {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'coverPhoto': url,
    });
  }
}
