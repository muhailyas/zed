import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/profile/profile_bloc.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/presentation/screens/friends_list_view/friends_list_view.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget/post_widget.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class ScreenVisitProfile extends StatelessWidget {
  const ScreenVisitProfile({super.key, required this.userProfile});
  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(UserPostsFetchEvent());
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // edit profile and profile image
              buildUpperSection(),

              // user details
              buildInfoSection(),

              // post head
              SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                      child: Text("Posts",
                          style:
                              customFontStyle(fontWeight: FontWeight.w700)))),

              height05,
              // post and saved view
              buildTabBarView()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabBarView() {
    return SizedBox(
        width: double.infinity,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) =>
              current is UserPostsFetchSuccess || current is ProfileLoading,
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserPostsFetchSuccess) {
              return state.posts.isEmpty
                  ? Center(child: Text("No Posts", style: customFontStyle()))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
        ));
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
                  userProfile.fullname,
                  style: customFontStyle(size: 24),
                ),
                Text(
                  "@${userProfile.userName}",
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
                            "${userProfile.followers.length}",
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
                          Text("${userProfile.followers.length} ",
                              style: customFontStyle(
                                  size: 17, fontWeight: FontWeight.bold)),
                          Text("following", style: customFontStyle(size: 17)),
                        ],
                      ),
                    )
                  ],
                ),
                height05,
                userProfile.bio.isEmpty
                    ? const SizedBox()
                    : Text(
                        userProfile.bio,
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
                    image: userProfile.coverPhoto.isEmpty
                        ? const DecorationImage(
                            image: NetworkImage(test2), fit: BoxFit.cover)
                        : DecorationImage(
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
                        color: secondaryDark,
                        shape: BoxShape.circle,
                        image: userProfile.coverPhoto.isEmpty
                            ? const DecorationImage(
                                image: NetworkImage(testImage),
                                fit: BoxFit.cover)
                            : DecorationImage(
                                image: NetworkImage(state
                                        is! UserInfoFetchSuccess
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
                child: Row(
                  children: [
                    Container(
                      height: screenHeight * 0.04,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: radius20, color: secondaryDarkgrey),
                      child: const Icon(Iconsax.message_2, color: whiteColor),
                    ),
                    width05,
                    ElevatedButtonWidget(
                        color: secondaryBlue,
                        width: 0.35,
                        height: 0.04,
                        label: 'Follow',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
