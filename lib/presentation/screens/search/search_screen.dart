import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:zed/business_logic/search/search_bloc.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/presentation/screens/visit_profile/visit_profile.dart';
import 'package:zed/presentation/widgets/search_field/search_field.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            height05,
            SearchFieldWidget(width: screenWidth * 1, type: SearchType.gloabal),
            height05,
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const RiveAnimation.asset('assets/loading.riv');
                } else if (state is SearchResultFound) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return SearchResultTileWidget(user: user);
                      },
                      itemCount: state.users.length);
                } else if (state is SearchResultEmpty) {
                  return Center(
                    child: Text(
                      "Not found",
                      style: customFontStyle(),
                    ),
                  );
                } else if (state is SearchInitial) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          color: secondaryDark, borderRadius: radius10),
                    ),
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}

class SearchResultTileWidget extends StatelessWidget {
  const SearchResultTileWidget({
    super.key,
    required this.user,
  });

  final UserProfile user;

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
              backgroundImage: NetworkImage(
                  user.profilePhoto.isEmpty ? testImage : user.profilePhoto),
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
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 35,
              width: 120,
              decoration:
                  BoxDecoration(color: secondaryBlue, borderRadius: radius10),
              child: Center(
                  child: Text("follow", style: customFontStyle(size: 16))),
            ),
            width10,
          ],
        ),
      ),
    );
  }
}
