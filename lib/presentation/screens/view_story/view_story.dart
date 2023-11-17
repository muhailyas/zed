import 'package:flutter/material.dart';
import 'package:zed/data/models/story/story.dart';
import 'package:zed/presentation/screens/home/home_screen.dart';
import 'package:zed/presentation/screens/view_story/story_widget/story_widget.dart';

class ScreenStoryView extends StatefulWidget {
  const ScreenStoryView({
    Key? key,
    required this.storyWithUser,
  }) : super(key: key);

  final StoryWithUser storyWithUser;

  @override
  ScreenStoryViewState createState() => ScreenStoryViewState();
}

class ScreenStoryViewState extends State<ScreenStoryView> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    final initialPage = storiesIn.indexOf(widget.storyWithUser);
    _controller = PageController(initialPage: initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {},
      controller: _controller,
      children: storiesIn
          .map((user) => StoryWidget(user: user, controller: _controller))
          .toList(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
