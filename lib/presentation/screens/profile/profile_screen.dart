import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/profile/profile_bloc.dart';
import 'package:zed/presentation/screens/edit_profile/edit_profile.dart';
import 'package:zed/presentation/screens/friends_list_view/friends_list_view.dart';
import 'package:zed/presentation/screens/profile/widgets/tab_view/tab_view_widget.dart';
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
    context
        .read<ProfileBloc>()
        .add(ProfileFetchEvent(userId: FirebaseAuth.instance.currentUser!.uid));
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
    return TabViewWidget(tabController: _tabController);
  }

  SizedBox buildTabBar() {
    return SizedBox(
      height: screenHeight * 0.05,
      width: double.infinity,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: TabBar(
          tabs: myTabs,
          controller: _tabController,
        ),
      ),
    );
  }

  Widget buildInfoSection() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          current is ProfileFetchSuccess && previous is ProfileLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state is! ProfileFetchSuccess
                      ? ''
                      : state.userProfile!.fullname.isEmpty
                          ? 'ilyas'
                          : state.userProfile!.fullname,
                  style: customFontStyle(size: 24),
                ),
                Text(
                  "@${state is! ProfileFetchSuccess ? '' : state.userProfile!.userName}",
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
                              builder: (context) => FreindsListView(
                                  type: Friend.followers,
                                  userId:
                                      FirebaseAuth.instance.currentUser!.uid),
                            ));
                      },
                      child: Row(
                        children: [
                          Text(
                            "${state is! ProfileFetchSuccess ? '' : state.userProfile!.followers.length}",
                            style: customFontStyle(
                                size: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " followers",
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
                              builder: (context) => FreindsListView(
                                  type: Friend.following,
                                  userId:
                                      FirebaseAuth.instance.currentUser!.uid),
                            ));
                      },
                      child: Row(
                        children: [
                          Text(
                              "${state is! ProfileFetchSuccess ? '' : state.userProfile!.following.length} ",
                              style: customFontStyle(
                                  size: 17, fontWeight: FontWeight.bold)),
                          Text("following", style: customFontStyle(size: 17)),
                        ],
                      ),
                    )
                  ],
                ),
                height05,
                state is! ProfileFetchSuccess
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
      buildWhen: (previous, current) => current is ProfileFetchSuccess,
      builder: (context, state) {
        return SizedBox(
          height: screenHeight * 0.2,
          child: Stack(
            children: [
              Container(
                height: screenHeight * 0.12,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: secondaryBlue,
                    image: state is ProfileFetchSuccess &&
                            state.userProfile!.coverPhoto.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(state.userProfile!.coverPhoto),
                            fit: BoxFit.cover)
                        : null),
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
                            image: state is ProfileFetchSuccess &&
                                    state.userProfile!.profilePhoto.isNotEmpty
                                ? NetworkImage(state.userProfile!.profilePhoto)
                                : const NetworkImage(defaultProfileImage),
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ScreenEditProfile()));
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
