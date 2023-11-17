import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/home/home_bloc.dart';
import 'package:zed/data/data_sources/story_data_source/story_data_source.dart';
import 'package:zed/data/models/story/story.dart';
import 'package:zed/presentation/screens/chat_list/chat_list.dart';
import 'package:zed/presentation/screens/create_story/create_story.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget/post_widget.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget_shimmer/post_widget_shimmer.dart';
import 'package:zed/presentation/screens/home/widgets/story_item_widget/story_item_widget.dart';
import 'package:zed/presentation/screens/home/widgets/story_items_shimmer/story_items_shimmer.dart';
import 'package:zed/presentation/screens/login_page/login.dart';
import 'package:zed/presentation/screens/view_story/view_story.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/validations.dart';

List<StoryWithUser> storiesIn = [];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(FetchingPostEvent());
    return SafeArea(
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
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () async {
              //test
            },
            child: Text(
              "ZED",
              style: customFontStyle(size: 35, fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onLongPress: () async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                  (route) => false);
              await Future.delayed(const Duration(seconds: 1));
              if (getProviderForCurrentUser() == 'Google Provider') {
                GoogleSignIn().signOut();
              }
              FirebaseAuth.instance.signOut();
            },
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
      height: screenHeight * 0.122,
      width: double.infinity,
      child: FutureBuilder(
        future: StoryDataSource().fetchStories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<StoryWithUser> stories = snapshot.data as List<StoryWithUser>;
            storiesIn.addAll(stories);
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildStoryItem(index, stories[index], context);
              },
              itemCount: stories.length,
              separatorBuilder: (context, index) => width10,
            );
          } else {
            return const StoryItemShimmer();
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
        child: StoryItemWidget(index: index, storyWithUser: storyWithUser));
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
            itemCount: 10,
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
                padding: const EdgeInsets.only(top: 0),
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
