import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/story/story_bloc.dart';
import 'package:zed/data/models/story/story.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

ValueNotifier<bool> isZoomed = ValueNotifier(false);

class ScreenConfirmStroy extends StatelessWidget {
  const ScreenConfirmStroy({super.key, required this.image});
  final File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: isZoomed,
              builder: (context, value, _) {
                return Container(
                  height: screenHeight / 1.15,
                  decoration: BoxDecoration(
                      borderRadius: radius20,
                      color: primaryColor,
                      image: DecorationImage(
                          image: FileImage(image),
                          fit: isZoomed.value ? BoxFit.cover : null)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // back button
                          IconButton(
                              onPressed: () {
                                context
                                    .read<StoryBloc>()
                                    .add(const StoryEvent.fetchRecentImages());
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back,
                                  color: whiteColor)),
                          IconButton(
                              onPressed: () {
                                isZoomed.value = !isZoomed.value;
                              },
                              icon: Icon(
                                  isZoomed.value
                                      ? Icons.zoom_in_map_rounded
                                      : Icons.zoom_out_map_rounded,
                                  color: whiteColor))
                        ],
                      ),
                    ],
                  ),
                );
              }),
          height005,
          BlocConsumer<StoryBloc, StoryState>(
            listenWhen: (previous, current) => current is StoryAddedSuccesfully,
            listener: (context, state) {
              Navigator.pop(context);
              context
              .read<StoryBloc>()
              .add(const StoryEvent.fetchStories(again: false));
              Navigator.pop(context);
            },
            builder: (context, state) {
              return ElevatedButtonWidget(
                  height: 0.07,
                  width: 0.99,
                  color: secondaryBlue,
                  label: '',
                  child: state is Loading
                      ? const CircularProgressIndicator(
                          backgroundColor: secondaryBlue,
                          color: whiteColor,
                        )
                      : Text(
                          'Add to your story',
                          style: customFontStyle(),
                        ),
                  onPressed: () {
                    if (state is! Loading) {
                      final story = Story(
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        imageUrl: image.path,
                        time: DateTime.now(),
                        isFullView: isZoomed.value,
                      );
                      context.read<StoryBloc>().add(AddToStory(story: story));
                    }
                  });
            },
          ),
          height005
        ],
      )),
    );
  }
}
