import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/story/story_bloc.dart';
import 'package:zed/presentation/screens/confirm_story/confirm_story.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/app_strings.dart';
import 'package:zed/utils/constants/constants.dart';

class CreateStroyScreen extends StatelessWidget {
  const CreateStroyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StoryBloc>().add(const StoryEvent.fetchRecentImages());
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // header row
            Row(
              children: [
                // close button
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: whiteColor, size: 30)),
                width10,
                // add stroy text
                Text(AppStrings.addToStory, style: customFontStyle()),
              ],
            ),
            height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // image take using camera button
                BlocListener<StoryBloc, StoryState>(
                  listener: (context, state) {
                    if (state is ImageSelected && state.isCamera) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ScreenConfirmStroy(image: state.selectedImage),
                          ));
                    }
                  },
                  child: InkWell(
                    onTap: () async {
                      context
                          .read<StoryBloc>()
                          .add(const TakeImageWithCamera());
                    },
                    child: Container(
                      height: screenHeight * 0.13,
                      width: screenWidth / 2.2,
                      decoration: BoxDecoration(
                          color: secondaryDark, borderRadius: radius20),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: whiteColor,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                // image select from gallery
                BlocListener<StoryBloc, StoryState>(
                  listener: (context, state) {
                    if (state is ImageSelected && !state.isCamera) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ScreenConfirmStroy(image: state.selectedImage),
                          ));
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      context
                          .read<StoryBloc>()
                          .add(const SelectImageFromGallery());
                    },
                    child: Container(
                      height: screenHeight * 0.13,
                      width: screenWidth / 2.2,
                      decoration: BoxDecoration(
                          color: secondaryDark, borderRadius: radius20),
                      child: const Icon(
                        Icons.image,
                        color: whiteColor,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            height005,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text("Recents", style: customFontStyle(size: 16)),
                  width05,
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: whiteColor)
                ],
              ),
            ),
            height005,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: BlocBuilder<StoryBloc, StoryState>(
                builder: (context, state) {
                  if (state is Initial) {
                    context
                        .read<StoryBloc>()
                        .add(const StoryEvent.fetchRecentImages());
                    return const CircularProgressIndicator();
                  } else if (state is Loading) {
                    return const CircularProgressIndicator();
                  } else if (state is RecentImagesFetchedSuccess) {
                    return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.recentImages.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1 / 1.6),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              File? imageData = state.recentImages[index];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ScreenConfirmStroy(image: imageData!),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: radius10,
                                  image: DecorationImage(
                                      image:
                                          FileImage(state.recentImages[index]!),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        });
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
