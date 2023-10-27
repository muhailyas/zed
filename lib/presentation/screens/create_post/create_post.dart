import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/home/home_bloc.dart';
import 'package:zed/business_logic/post/post_bloc.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/snackbars.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<PostBloc>(context);
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
            height10
          ],
        ),
      ),
      floatingActionButton: BlocConsumer<PostBloc, PostState>(
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
            return Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CupertinoActivityIndicator(
                      radius: screenHeight * 0.015, color: greyColor),
                ));
          }
          return FloatingActionButton(
            child: const Icon(Iconsax.send_14),
            onPressed: () async {
              if (state is PostImageSelected && state.image != null) {
                final post = Post(
                  userId: FirebaseAuth.instance.currentUser!.uid,
                  caption: blocProvider.captionController.text,
                  imageUrl: state.image!,
                  likes: [],
                  commentCount: 0,
                  views: 0,
                  profileUrl: '',
                  username: '',
                  dateTime: DateTime.now(),
                );
                context.read<PostBloc>().add(AddPostEvent(post: post));
              } else {
                showErrorSnackBar('please select an image', context, red);
              }
            },
          );
        },
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

  Widget _bulidPostContent(BuildContext context) {
    final blocProvider = BlocProvider.of<PostBloc>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(color: secondaryDark, borderRadius: radius10),
        constraints: BoxConstraints(minHeight: screenHeight * 0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: blocProvider.captionController,
                style: customFontStyle(),
                maxLines: null,
                decoration: InputDecoration(
                    hintText: 'add caption . . .',
                    hintStyle: customFontStyle(size: 16),
                    border: InputBorder.none),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Padding _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          _closeButton(),
          const Spacer(),
          InkWell(
              onTap: () async {
                context.read<PostBloc>().add(OpenCameraEvent());
              },
              child: const Icon(Iconsax.camera, color: whiteColor)),
          width20,
          InkWell(
              onTap: () {
                context.read<PostBloc>().add(SelectImageFromGalleryEvent());
              },
              child: const Icon(Iconsax.gallery, color: whiteColor)),
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
