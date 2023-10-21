import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed/data/data_providers/image_picker/image_picker.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
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
                      : Container(
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.86,
                          decoration: BoxDecoration(
                              borderRadius: radius10,
                              image: DecorationImage(
                                  image: FileImage(File(image.value)),
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  image.value = '';
                                },
                                icon: const Icon(Iconsax.close_circle5)),
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

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          const Icon(Icons.close, color: whiteColor, size: 30),
          const Spacer(),
          ElevatedButtonWidget(
              width: 0.21,
              height: 0.02,
              color: secondaryBlue,
              label: 'Post',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              onPressed: () {}),
        ],
      ),
    );
  }
}
