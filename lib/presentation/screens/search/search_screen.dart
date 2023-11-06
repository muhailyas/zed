import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:zed/business_logic/search/search_bloc.dart';
import 'package:zed/presentation/screens/search/widgets/search_tile_widget/search_tile_widget.dart';
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
            SearchFieldWidget(width: screenWidth * 1, type: SearchType.gloabal),
            divider,
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
                          color: greyColor, borderRadius: radius10),
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
