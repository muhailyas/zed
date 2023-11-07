import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/friends_list/freinds_list_bloc.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/presentation/screens/visit_profile/visit_profile.dart';
import 'package:zed/presentation/widgets/follow_button/follow_button_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class SearchResultTileWidget extends StatelessWidget {
  const SearchResultTileWidget(
      {super.key, required this.user, this.friend, this.isOwner = false});

  final UserProfile user;
  final Friend? friend;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenVisitProfile(userProfile: user),
            ));
      },
      child: Container(
        height: screenHeight * 0.09,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: Row(
          children: [
            width10,
            CircleAvatar(
              radius: screenWidth * 0.07,
              backgroundImage: NetworkImage(user.profilePhoto.isEmpty
                  ? defaultProfileImage
                  : user.profilePhoto),
            ),
            width10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.fullname,
                    style:
                        customFontStyle(fontWeight: FontWeight.w400, size: 18)),
                Row(
                  children: [
                    Text('@${user.userName}',
                        style: customFontStyle(
                            size: 13, fontWeight: FontWeight.w300)),
                    width10,
                    isOwner
                        ? InkWell(
                            onTap: () {
                              context
                                  .read<FreindsListBloc>()
                                  .add(RemoveFollower(userId: user.uid!));
                            },
                            child: Text("Remove",
                                style: customFontStyle(size: 15, color: red)),
                          )
                        : const SizedBox()
                  ],
                ),
              ],
            ),
            const Spacer(),
            user.uid != FirebaseAuth.instance.currentUser!.uid && friend != null
                ? FollowButtonWidget(
                    userProfile: user,
                    height: screenHeight * 0.04,
                    width: screenWidth * 0.32,
                    fontSize: 16,
                    type: friend,
                  )
                : const SizedBox(),
            width10,
          ],
        ),
      ),
    );
  }
}
