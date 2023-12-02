import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:zed/data/models/story/story.dart';
import 'package:zed/presentation/screens/home/home_screen.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/format_time_difference/format_time_defference.dart';

class StoryWidget extends StatefulWidget {
  final StoryWithUser user;
  final PageController controller;

  const StoryWidget({
    super.key,
    required this.user,
    required this.controller,
  });

  @override
  StoryWidgetState createState() => StoryWidgetState();
}

class StoryWidgetState extends State<StoryWidget> {
  final storyItems = <StoryItem>[];
  late StoryController controller;
  String date = '';

  @override
  void initState() {
    super.initState();
    controller = StoryController();
    addStoryItems();
  }

  void addStoryItems() {
    for (final story in widget.user.stories) {
      storyItems.add(
        StoryItem.pageImage(
          url: story.imageUrl,
          imageFit: story.isFullView ? BoxFit.cover : BoxFit.contain,
          controller: controller,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleCompleted() {
    widget.controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );

    final currentIndex = storiesIn.indexOf(widget.user);
    final isLastPage = storiesIn.length - 1 == currentIndex;

    if (isLastPage) {
      Navigator.of(context).pop();
    } else if (currentIndex == 0 && storiesIn[0].stories.isEmpty) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Stack(
          children: <Widget>[
            Material(
              type: MaterialType.transparency,
              child: StoryView(
                indicatorForegroundColor: secondaryBlue,
                storyItems: storyItems,
                controller: controller,
                onComplete: handleCompleted,
                onVerticalSwipeComplete: (direction) {
                  if (direction == Direction.down) {
                    Navigator.pop(context);
                  }
                },
                onStoryShow: (storyItem) async {
                  final index = storyItems.indexOf(storyItem);

                  await Future.delayed(const Duration(milliseconds: 200));
                  setState(() {
                    date =
                        formatTimeDifference(widget.user.stories[index].time);
                  });
                },
              ),
            ),
            Positioned(
              top: 20,
              left: 15,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.04,
                    backgroundImage: NetworkImage(
                      widget.user.userProfile.profilePhoto.isEmpty
                          ? defaultProfileImage
                          : widget.user.userProfile.profilePhoto,
                    ),
                  ),
                  width10,
                  RichText(
                    text: TextSpan(
                        text: widget.user.userProfile.userName,
                        style: customFontStyle(
                          fontWeight: FontWeight.bold,
                          size: 18,
                        ),
                        children: [
                          TextSpan(
                            text: '   $date',
                            style: customFontStyle(
                              fontWeight: FontWeight.w300,
                              size: 14,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
