import 'package:flutter/material.dart';
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
  }

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Posts'),
    Tab(text: 'Saved'),
  ];
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // edit profile and profile image
            buildUpperSection(),

            // user details
            buildInfoSection(),
            const Divider(
              color: greyColor,
            ),

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

  SizedBox buildTabBarView() {
    return SizedBox(
      height: screenHeight,
      width: double.infinity,
      child: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const PostWidget(
                  userProfileImage: testImage,
                  username: 'ilyas',
                  postImage: testImage,
                  likes: 100,
                  comments: 100,
                  views: 100,
                  caption: 'soethislf lsklf lslfjls fs;l ffnkl fls'));
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

  Padding buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sara Merry",
              style: customFontStyle(),
            ),
            Text(
              "@sara merry",
              style: customFontStyle(size: 15),
            ),
            height05,
            Row(
              children: [
                Text(
                  "1.2k follwers",
                  style: customFontStyle(size: 17),
                ),
                const SizedBox(width: 10),
                Text("500 following", style: customFontStyle(size: 17))
              ],
            ),
            height05,
            Text(
              "joined 2023 mar 21",
              style: customFontStyle(size: 17),
            ),
            height05,
            Text(
              "I'm passionate flutter developer",
              style: customFontStyle(size: 17),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildUpperSection() {
    return SizedBox(
      height: screenHeight * 0.23,
      child: Stack(
        children: [
          Container(
            height: screenHeight * 0.16,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://imgs.search.brave.com/INxZ1HlsxtfR-5xtNfavRgMyJ0wiVETft-WsJxJE2Jo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/Nzg1MTU3NC9waG90/by9wcm9maWxlLW9m/LXlvdW5nLXdvbWFu/cy1mYWNlLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1GQjIy/UmIwM3NZZkNiTl9M/MmNoQ2psNHVTN2JU/VTdWN1U5WEUySEZx/SFpRPQ'),
                    fit: BoxFit.cover)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.add_box_outlined, color: whiteColor, size: 33),
                width20,
                const Icon(Icons.menu, color: whiteColor, size: 35)
              ],
            ),
          ),
          Positioned(
            top: 80,
            left: 10,
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://imgs.search.brave.com/INxZ1HlsxtfR-5xtNfavRgMyJ0wiVETft-WsJxJE2Jo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/Nzg1MTU3NC9waG90/by9wcm9maWxlLW9m/LXlvdW5nLXdvbWFu/cy1mYWNlLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1GQjIy/UmIwM3NZZkNiTl9M/MmNoQ2psNHVTN2JU/VTdWN1U5WEUySEZx/SFpRPQ'),
                      fit: BoxFit.cover)),
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
  }
}
