import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/home/home_bloc.dart';
import 'package:zed/business_logic/story/story_bloc.dart';
import 'package:zed/data/models/story/story.dart';
import 'package:zed/presentation/screens/chat_list/chat_list.dart';
import 'package:zed/presentation/screens/create_story/create_story.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget/post_widget.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget_shimmer/post_widget_shimmer.dart';
import 'package:zed/presentation/screens/home/widgets/story_item_widget/story_item_widget.dart';
import 'package:zed/presentation/screens/home/widgets/story_items_shimmer/story_items_shimmer.dart';
import 'package:zed/presentation/screens/view_story/view_story.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

List<StoryWithUser> storiesIn = [];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(FetchingPostEvent());
      context.read<StoryBloc>().add(const StoryEvent.fetchStories(again: null));
    });
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(FetchingPostEvent());
          context
              .read<StoryBloc>()
              .add(const StoryEvent.fetchStories(again: false));
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(context),
              _buildStoryList(context),
              divider,
              _buildPostList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ZED",
            style: customFontStyle(size: 35, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ChatListScreen(),
              ));
            },
            child: const Icon(Iconsax.messages_1, color: whiteColor, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryList(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.123,
      width: double.infinity,
      child: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, snapshot) {
          if (snapshot is FetchedStories) {
            List<StoryWithUser> stories = snapshot.stories;
            storiesIn.clear();
            storiesIn.addAll(stories);
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildStoryItem(index, stories[index], context);
              },
              itemCount: stories.length,
              separatorBuilder: (context, index) => width10,
            );
          } else if (snapshot is Loading && snapshot.again == null) {
            return const StoryItemShimmer();
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildStoryItem(index, storiesIn[index], context);
              },
              itemCount: storiesIn.length,
              separatorBuilder: (context, index) => width10,
            );
          }
        },
      ),
    );
  }

  Widget _buildStoryItem(
      int index, StoryWithUser storyWithUser, BuildContext context) {
    return InkWell(
        onLongPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateStroyScreen()));
        },
        onTap: () {
          index == 0 && storyWithUser.stories.isEmpty
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateStroyScreen(),
                  ))
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScreenStoryView(storyWithUser: storyWithUser),
                  ));
        },
        child: Padding(
          padding: EdgeInsets.only(left: index == 0 ? 10 : 0),
          child: StoryItemWidget(index: index, storyWithUser: storyWithUser),
        ));
  }
}

Widget _buildPostList() {
  return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeLoading || current is PostFetchingSuccess,
      builder: (context, state) {
        if (state is HomeLoading) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const ShimmerPostWidget(),
          );
        } else if (state is PostFetchingSuccess) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                ),
                child: PostWidget(post: post),
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(color: whiteColor),
            itemCount: state.posts.length,
          );
        } else {
          return const SizedBox();
        }
      });
}
