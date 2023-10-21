import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed/business_logic/bloc/post/post_bloc.dart';
import 'package:zed/data/data_providers/image_picker/image_picker.dart';
import 'package:zed/data/data_providers/image_upload_to_storage/image_upload_to_storage.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/data/repositories/post_repositories/post_repositories.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

final captionController = TextEditingController();

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
            _bulidPostContent(),
            height05,
            _buildPostImage(),
            height05,
            _buildPickImageOptions(),
            height10
          ],
        ),
      ),
    );
  }

  Expanded _buildPickImageOptions() {
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
                    image.value = await ImagePickerProvider()
                        .pickImage(ImageSource.camera);
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
                  onTap: () async {
                    image.value = await ImagePickerProvider()
                        .pickImage(ImageSource.gallery);
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
            child: ValueListenableBuilder(
                valueListenable: image,
                builder: (context, value, _) {
                  return value.isEmpty
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
                              File(value),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                }),
          ),
        ],
      ),
    );
  }

  Padding _bulidPostContent() {
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
            controller: captionController,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          _closeButton(),
          const Spacer(),
          ElevatedButtonWidget(
              width: 0.21,
              height: 0.02,
              color: secondaryBlue,
              label: 'Post',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              onPressed: () async {
                if (image.value.isNotEmpty) {
                  final imageUrl = await FireStoreStorage()
                      .uploadImageAndGetUrl(image.value, 'posts');
                  final post = Post(
                      userId: FirebaseAuth.instance.currentUser!.uid,
                      caption: captionController.text,
                      imageUrl: imageUrl,
                      likes: 0,
                      commentCount: 0,
                      views: 0);
                  PostRepository().addPost(post);
                } else {
                  print(" post not eligible");
                }
              }),
        ],
      ),
    );
  }

  BlocConsumer<PostBloc, PostState> _closeButton() {
    return BlocConsumer<PostBloc, PostState>(
      buildWhen: (previous, current) =>
          current is! ClosePostScreenToHomeActionState,
      listenWhen: (previous, current) =>
          current is ClosePostScreenToHomeActionState,
      listener: (context, state) {
        if (state is ClosePostScreenToHomeActionState) {
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
