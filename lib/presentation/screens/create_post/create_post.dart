import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/home/home_bloc.dart';
import 'package:zed/business_logic/post/post_bloc.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/snackbars.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            height05,
            _bulidPostContent(context),
            height05,
            _buildPostImage(),
            height05,
            _buildPickImageOptions(context),
            height10
          ],
        ),
      ),
    );
  }

  Expanded _buildPickImageOptions(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    context.read<PostBloc>().add(OpenCameraEvent());
                  },
                  child: Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.46,
                    decoration: BoxDecoration(
                        color: secondaryBlue, borderRadius: radius10),
                    child: const Center(
                      child: Icon(Iconsax.camera, color: whiteColor),
                    ),
                  ),
                ),
                width10,
                InkWell(
                  onTap: () {
                    context.read<PostBloc>().add(SelectImageFromGalleryEvent());
                  },
                  child: Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.46,
                    decoration: BoxDecoration(
                        color: secondaryBlue, borderRadius: radius10),
                    child: const Center(
                      child: Icon(Iconsax.gallery, color: whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildPostImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(width: screenWidth * 0.12),
          Expanded(
            child: BlocConsumer<PostBloc, PostState>(
              listenWhen: (previous, current) => current is PostImageSelected,
              buildWhen: (previous, current) => current is PostImageSelected,
              listener: (context, state) {
                state as PostImageSelected;
                if (state.image == null) {
                  showErrorSnackBar('image not selected', context, red, 1);
                } else {
                  showErrorSnackBar('Image selected', context, green, 1);
                }
              },
              builder: (context, state) {
                return state is! PostImageSelected
                    ? const SizedBox()
                    : ClipRRect(
                        borderRadius: radius10,
                        child: Container(
                          constraints:
                              BoxConstraints(maxHeight: screenHeight * 0.4),
                          width: screenWidth * 0.86,
                          decoration: BoxDecoration(
                            borderRadius: radius10,
                          ),
                          child: Image.file(
                            File(state.image ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding _bulidPostContent(BuildContext context) {
    final blocProvider = BlocProvider.of<PostBloc>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: screenHeight * 0.018,
            backgroundImage: const NetworkImage(testImage),
          ),
          width10,
          Expanded(
              child: TextFormField(
            controller: blocProvider.captionController,
            style: customFontStyle(),
            maxLines: null,
            decoration: InputDecoration(
                hintText: 'Type anything . . .',
                hintStyle: customFontStyle(),
                border: InputBorder.none),
          )),
        ],
      ),
    );
  }

  Padding _buildHeader(BuildContext context) {
    final blocProvider = BlocProvider.of<PostBloc>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          _closeButton(),
          const Spacer(),
          BlocConsumer<PostBloc, PostState>(
            listenWhen: (previous, current) => current is PostAddSuccess,
            buildWhen: (previous, current) =>
                current is PostLoading ||
                current is PostAddSuccess ||
                current is PostImageSelected,
            listener: (context, state) {
              blocProvider.captionController.clear();
              context.read<HomeBloc>().add(FetchingPostEvent());
              Navigator.pop(context);
            },
            builder: (context, state) {
              if (state is PostLoading) {
                return Center(
                    child: CupertinoActivityIndicator(
                        radius: screenHeight * 0.015, color: greyColor));
              }
              return ElevatedButtonWidget(
                  width: 0.21,
                  height: 0.02,
                  color: secondaryBlue,
                  label: 'Post',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  onPressed: () async {
                    if (state is PostImageSelected && state.image != null) {
                      final post = Post(
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        caption: blocProvider.captionController.text,
                        imageUrl: state.image!,
                        likes: 0,
                        commentCount: 0,
                        views: 0,
                        profileUrl: '',
                        username: '',
                      );
                      context.read<PostBloc>().add(AddPostEvent(post: post));
                    } else {
                      showErrorSnackBar('please select an image', context, red);
                    }
                  });
            },
          ),
        ],
      ),
    );
  }

  BlocConsumer<PostBloc, PostState> _closeButton() {
    return BlocConsumer<PostBloc, PostState>(
      buildWhen: (previous, current) => current is! ClosePostScreenToHome,
      listenWhen: (previous, current) => current is ClosePostScreenToHome,
      listener: (context, state) {
        if (state is ClosePostScreenToHome) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<PostBloc>().add(ClosePostScreenEvent());
          },
          icon: const Icon(Icons.close, color: whiteColor, size: 30),
        );
      },
    );
  }
}
