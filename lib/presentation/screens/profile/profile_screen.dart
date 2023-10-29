import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/profile/profile_bloc.dart';
import 'package:zed/presentation/screens/friends_list_view/friends_list_view.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget/post_widget.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

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
    context.read<ProfileBloc>().add(
        UserInfoFetchEvent(userId: FirebaseAuth.instance.currentUser!.uid));
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
                                  post: data,
                                );
                              });
                    }
                    return const SizedBox();
                  },
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                      height: 300, width: double.infinity, color: greyColor));
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const FreindsListView(type: Friend.followers),
                            ));
                      },
                      child: Row(
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
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const FreindsListView(type: Friend.following),
                            ));
                      },
                      child: Row(
                        children: [
                          Text("500 ",
                              style: customFontStyle(
                                  size: 17, fontWeight: FontWeight.bold)),
                          Text("following", style: customFontStyle(size: 17)),
                        ],
                      ),
                    )
                  ],
                ),
                height05,
                state is! UserInfoFetchSuccess
                    ? const SizedBox()
                    : state.userProfile!.bio.isEmpty
                        ? const SizedBox()
                        : Text(
                            state.userProfile!.bio,
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
          height: screenHeight * 0.2,
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
