import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/post/post_bloc.dart';
import 'package:zed/presentation/screens/create_post/widgets/floating_actionbutton_widget/floating_actionbutton_widget.dart';
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
      floatingActionButton:
          PostFloatingActionButton(blocProvider: blocProvider),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CircleAvatar(
                backgroundImage: const NetworkImage(defaultProfileImage),
                radius: screenWidth * 0.05),
          ),
          Expanded(
            child: Container(
              decoration:
                  BoxDecoration(color: secondaryDark, borderRadius: radius10),
              constraints: BoxConstraints(minHeight: screenHeight * 0.1),
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
          ),
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
          InkWell(
              onTap: () async {
                context.read<PostBloc>().add(OpenCameraEvent());
              },
              child: const Icon(Icons.camera_alt_outlined, color: whiteColor)),
          width20,
          InkWell(
              onTap: () {
                context.read<PostBloc>().add(SelectImageFromGalleryEvent());
              },
              child: const Icon(
                Icons.photo_library_outlined,
                color: whiteColor,
              )),
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
