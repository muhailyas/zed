import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/friends_list/freinds_list_bloc.dart';
import 'package:zed/presentation/screens/search/widgets/search_tile_widget/search_tile_widget.dart';
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
        body: RefreshIndicator(
          onRefresh: () async {
            context
                .read<FreindsListBloc>()
                .add(FetchFriendsListEvent(friend: type, userId: userId));
          },
          child: BlocConsumer<FreindsListBloc, FreindsListState>(
            listenWhen: (previous, current) =>
                current is FriendsListFetchSuccess && current.isRemoved,
            listener: (context, state) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(
                    content: Text('Removed from followers'),
                    backgroundColor: red));
            },
            builder: (context, state) {
              if (state is FriendsListFetchSuccess) {
                if (state.freinds.isEmpty) {
                  return Center(
                    child:
                        Text("${type.name} is empty", style: customFontStyle()),
                  );
                } else {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.freinds.length,
                    itemBuilder: (context, index) {
                      final friend = state.freinds[index];
                      return SearchResultTileWidget(
                        user: friend,
                        friend: type == Friend.followers
                            ? Friend.followers
                            : Friend.following,
                        isOwner: type == Friend.followers ? true : false,
                      );
                    },
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
