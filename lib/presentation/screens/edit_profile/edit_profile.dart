import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/edit_profile/edit_profile_bloc.dart';
import 'package:zed/business_logic/profile/profile_bloc.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/presentation/screens/login_page/widgets/text_field/text_field.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/validations.dart';

class ScreenEditProfile extends StatelessWidget {
  const ScreenEditProfile({super.key, required this.user});
  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    final editProfileProvider = BlocProvider.of<EditProfileBloc>(context);
    editProfileProvider.add(EditPageInitialEvent(
        fullname: user.fullname,
        username: user.userName,
        bio: user.bio,
        cover: user.coverPhoto,
        profile: user.profilePhoto));
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            fullWidth,
            SizedBox(
              height: screenHeight * 0.225,
              width: double.infinity,
              child: Stack(
                children: [
                  BlocBuilder<EditProfileBloc, EditProfileState>(
                      builder: (context, state) {
                    return state is CoverPhotoUpdated
                        ? Container(
                            height: screenHeight * 0.12,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: secondaryBlue,
                                image: state.coverPhoto != null
                                    ? DecorationImage(
                                        image:
                                            FileImage(File(state.coverPhoto!)),
                                        fit: BoxFit.cover)
                                    : null),
                          )
                        : Container(
                            height: screenHeight * 0.12,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: secondaryBlue,
                                image: state.coverPhoto != null
                                    ? DecorationImage(
                                        image: NetworkImage(state.coverPhoto!),
                                        fit: BoxFit.cover)
                                    : null),
                          );
                  }),
                  Positioned(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              const Icon(Icons.arrow_back, color: whiteColor))),
                  Positioned(
                    right: screenHeight * 0.01,
                    child: TextButton.icon(
                        onPressed: () async {
                          context
                              .read<EditProfileBloc>()
                              .add(EditCoverPhotoClickEvent());
                        },
                        icon: const Icon(Iconsax.edit, color: whiteColor),
                        label: Text("Edit cover photo",
                            style: customFontStyle(size: 15))),
                  ),
                  BlocBuilder<EditProfileBloc, EditProfileState>(
                      builder: (context, state) {
                    return state is ProfilePhotoUpdated
                        ? Positioned(
                            left: screenHeight * 0.01,
                            bottom: screenHeight * 0.04,
                            child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: secondaryBlue,
                                    shape: BoxShape.circle,
                                    image: state.profilePhoto != null
                                        ? DecorationImage(
                                            image: FileImage(
                                                File(state.profilePhoto!)),
                                            fit: BoxFit.cover)
                                        : const DecorationImage(
                                            image: NetworkImage(
                                                defaultProfileImage)))))
                        : Positioned(
                            left: screenHeight * 0.01,
                            bottom: screenHeight * 0.04,
                            child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: secondaryBlue,
                                    shape: BoxShape.circle,
                                    image: state.profilePhoto != null
                                        ? DecorationImage(
                                            image: NetworkImage(
                                                state.profilePhoto!),
                                            fit: BoxFit.cover)
                                        : const DecorationImage(
                                            image: NetworkImage(
                                                defaultProfileImage)))));
                  }),
                  Positioned(
                      bottom: -6,
                      left: screenHeight * 0.01,
                      child: TextButton(
                          onPressed: () async {
                            context
                                .read<EditProfileBloc>()
                                .add(EditProfilePhotoClickEvent());
                          },
                          child: Text("Edit profile photo",
                              style: customFontStyle(size: 15))))
                ],
              ),
            ),
            height10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: customFontStyle(size: 15)),
                  TextFieldWidget(
                      controller: editProfileProvider.nameController,
                      hint: 'Name',
                      iconData: Iconsax.edit_2,
                      function: isFullNameValid),
                  height10,
                  Text("Username", style: customFontStyle(size: 15)),
                  TextFieldWidget(
                      controller: editProfileProvider.userNameController,
                      hint: 'Username',
                      iconData: Iconsax.edit_2,
                      function: isUsernameValid),
                  height10,
                  Text("Bio", style: customFontStyle(size: 15)),
                  TextFieldWidget(
                      controller: editProfileProvider.bioController,
                      hint: 'Bio',
                      iconData: Iconsax.edit_2,
                      function: () {}),
                  height10,
                  Align(
                    alignment: Alignment.center,
                    child: BlocConsumer<EditProfileBloc, EditProfileState>(
                      listenWhen: (previous, current) =>
                          current is ProfileUpdated,
                      listener: (context, state) {
                        if (state is ProfileUpdated) {
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        if (state is ProfileLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ElevatedButtonWidget(
                            width: 0.4,
                            height: 0.04,
                            fontSize: 16,
                            color: secondaryBlue,
                            label: 'Update profile',
                            onPressed: () {
                              final profile = UserProfile(
                                uid: user.uid,
                                fullname:
                                    editProfileProvider.nameController.text,
                                userName:
                                    editProfileProvider.userNameController.text,
                                bio: editProfileProvider.bioController.text,
                                email: user.email,
                                followers: user.followers,
                                following: user.following,
                                profilePhoto: state.profilePhoto == null ||
                                        state.profilePhoto!.isEmpty
                                    ? user.profilePhoto
                                    : state.profilePhoto!,
                                coverPhoto: state.coverPhoto == null ||
                                        state.coverPhoto!.isEmpty
                                    ? user.coverPhoto
                                    : state.coverPhoto!,
                              );
                              context.read<EditProfileBloc>().add(
                                  UpdateButtonClickEvent(userProfile: profile));
                              Navigator.pop(context);
                            });
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
