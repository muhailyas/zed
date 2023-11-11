import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/home/home_bloc.dart';
import 'package:zed/presentation/screens/chat_list/chat_list.dart';
import 'package:zed/presentation/screens/create_story/create_story.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget/post_widget.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget_shimmer/post_widget_shimmer.dart';
import 'package:zed/presentation/screens/login_page/login.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/validations.dart';

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
            _buildStoryList(),
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
          Text(
            "ZED",
            style: customFontStyle(size: 35, fontWeight: FontWeight.bold),
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

  Widget _buildStoryList() {
    return SizedBox(
      height: screenHeight * 0.122,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateStroyScreen()));
              }
            },
            child: _buildStoryItem(index)),
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }

  Widget _buildStoryItem(int index) {
    return Column(
      children: [
        Container(
          height: screenHeight * 0.1,
          width: screenWidth * 0.2,
          decoration: BoxDecoration(
              color: secondaryDark,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: index == 0
                      ? const NetworkImage(defaultProfileImage)
                      : const NetworkImage(test2),
                  fit: BoxFit.cover)),
          child: index == 0
              ? const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Iconsax.add_circle5, size: 25, color: whiteColor))
              : null,
        ),
        Text(index == 0 ? "Your story" : "username",
            style: customFontStyle(size: 14)),
      ],
    );
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
}
