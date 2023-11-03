import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/friends_list/freinds_list_bloc.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class FreindsListView extends StatelessWidget {
  final Friend type;
  final String userId;
  const FreindsListView({super.key, required this.type, required this.userId});

  @override
  Widget build(BuildContext context) {
    context
        .read<FreindsListBloc>()
        .add(FetchFriendsListEvent(friend: type, userId: userId));
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title:
              Text(type.name.replaceRange(0, 1, 'F'), style: customFontStyle()),
        ),
        body: BlocBuilder<FreindsListBloc, FreindsListState>(
          buildWhen: (previous, current) => current is FriendsListFetchSuccess,
          builder: (context, state) {
            if (state is FriendsListFetchSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.freinds.length,
                itemBuilder: (context, index) {
                  final friend = state.freinds[index];
                  return Container(
                    height: screenHeight * 0.09,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Row(
                      children: [
                        width10,
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(test2),
                        ),
                        width10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(friend.fullname,
                                style: customFontStyle(
                                    fontWeight: FontWeight.w400, size: 18)),
                            Row(
                              children: [
                                Text('@${friend.userName}',
                                    style: customFontStyle(
                                        size: 13, fontWeight: FontWeight.w300)),
                                width10,
                                type == Friend.followers && index % 2 == 0
                                    ? Text(
                                        "follow",
                                        style: customFontStyle(
                                            color: secondaryBlue, size: 16),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 110,
                          decoration: BoxDecoration(
                              color: secondaryDarkgrey, borderRadius: radius10),
                          child: Center(
                              child: Text(
                                  type == Friend.following
                                      ? "following"
                                      : "remove",
                                  style: customFontStyle(size: 16))),
                        ),
                        width10,
                      ],
                    ),
                  );
                },
              );
            } else {
              return const 
              Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
