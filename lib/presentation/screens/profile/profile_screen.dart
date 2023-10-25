import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/profile/profile_bloc.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget/post_widget.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    context.read<ProfileBloc>().add(UserPostsFetchEvent());
    context.read<ProfileBloc>().add(UserInfoFetchEvent());
  }

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // edit profile and profile image
            buildUpperSection(),

            // user details
            buildInfoSection(),

            // post and saved head
            buildTabBar(),

            height05,
            // post and saved view
            buildTabBarView()
          ],
        ),
      ),
    );
  }

  Widget buildTabBarView() {
    return SizedBox(
      height: screenHeight * 0.52,
      width: double.infinity,
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return tab == myTabs[0]
              ? BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (previous, current) =>
                      current is UserPostsFetchSuccess ||
                      current is ProfileLoading,
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is UserPostsFetchSuccess) {
                      return state.posts.isEmpty
                          ? Center(
                              child: Text("No Posts", style: customFontStyle()))
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.posts.length,
                              itemBuilder: (context, index) {
                                final data = state.posts[index];
                                return PostWidget(
                                  userProfileImage: data.profileUrl,
                                  username: data.username,
                                  postImage: data.imageUrl,
                                  likes: data.likes,
                                  comments: data.commentCount,
                                  views: data.views,
                                  caption: data.caption,
                                );
                              });
                    }
                    return const SizedBox();
                  },
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => const PostWidget(
                      userProfileImage: test2,
                      username: 'SaraMerry',
                      postImage: test2,
                      likes: 100,
                      comments: 100,
                      views: 100,
                      caption: 'Making memmories every day'));
        }).toList(),
      ),
    );
  }

  SizedBox buildTabBar() {
    return SizedBox(
      height: screenHeight * 0.05,
      width: double.infinity,
      child: TabBar(
        tabs: myTabs,
        controller: _tabController,
      ),
    );
  }

  Widget buildInfoSection() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => current is UserInfoFetchSuccess,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state is! UserInfoFetchSuccess
                      ? ''
                      : state.userProfile!.fullname.isEmpty
                          ? 'ilyas'
                          : state.userProfile!.fullname,
                  style: customFontStyle(size: 24),
                ),
                Text(
                  "@${state is! UserInfoFetchSuccess ? '' : state.userProfile!.userName}",
                  style: customFontStyle(size: 15),
                ),
                height05,
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "1.2k",
                          style: customFontStyle(
                              size: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " follwers",
                          style: customFontStyle(size: 17),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Text("500 ",
                            style: customFontStyle(
                                size: 17, fontWeight: FontWeight.bold)),
                        Text("following", style: customFontStyle(size: 17)),
                      ],
                    )
                  ],
                ),
                height05,
                Text(
                  state is! UserInfoFetchSuccess
                      ? ''
                      : state.userProfile!.bio.isEmpty
                          ? ''
                          : state.userProfile!.bio,
                  style: customFontStyle(size: 17),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildUpperSection() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => current is UserInfoFetchSuccess,
      builder: (context, state) {
        return SizedBox(
          height: screenHeight * 0.19,
          child: Stack(
            children: [
              Container(
                height: screenHeight * 0.12,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(state is! UserInfoFetchSuccess
                            ? test2
                            : state.userProfile!.coverPhoto.isEmpty
                                ? test2
                                : state.userProfile!.coverPhoto),
                        fit: BoxFit.cover)),
                child: const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Icon(Icons.menu_rounded, color: whiteColor, size: 35),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(state is! UserInfoFetchSuccess
                                ? test2
                                : state.userProfile!.profilePhoto.isEmpty
                                    ? test2
                                    : state.userProfile!.profilePhoto),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 15,
                child: ElevatedButtonWidget(
                    color: secondaryBlue,
                    width: 0.4,
                    height: 0.04,
                    label: 'Edit profile',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    onPressed: () {}),
              ),
            ],
          ),
        );
      },
    );
  }
}
