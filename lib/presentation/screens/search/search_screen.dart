import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:zed/business_logic/search/search_bloc.dart';
import 'package:zed/data/data_sources/post_data_source/post_data_source.dart';
import 'package:zed/presentation/screens/search/widgets/search_tile_widget/search_tile_widget.dart';
import 'package:zed/presentation/screens/view_post/view_post.dart';
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
                  return FutureBuilder(
                      future: PostDataSource().fetchPosts(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 1.2,
                                    mainAxisSpacing: 1.2,
                                    childAspectRatio: 1 / 1.6),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoModalPopupRoute(
                                      builder: (context) => ScreenViewPost(
                                          post: snapshot.data![index]),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: secondaryDark,
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          snapshot.data![index].imageUrl,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      });
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
