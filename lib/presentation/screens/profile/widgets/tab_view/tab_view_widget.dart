import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/profile/profile_bloc.dart';
import 'package:zed/presentation/screens/home/widgets/post_widget/post_widget.dart';
import 'package:zed/utils/constants/constants.dart';

class TabViewWidget extends StatelessWidget {
  const TabViewWidget({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.52,
      width: double.infinity,
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: tabController,
        children:List.generate(2, (index) {
          return index%2==0
          ? BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (previous, current) =>
                      current is ProfileFetchSuccess &&
                      previous is ProfileLoading,
                  builder: (context, state) {
                    if (state is ProfileFetchSuccess) {
                      if (state is ProfileLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
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
              : BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (previous, current) =>
                      current is ProfileFetchSuccess &&
                      previous is ProfileLoading,
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is ProfileFetchSuccess &&
                        state.savedPosts.isEmpty) {
                      return Center(
                        child: Text(
                          "No posts saved yet",
                          style: customFontStyle(),
                        ),
                      );
                    }
                    state as ProfileFetchSuccess;
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.savedPosts.length,
                      itemBuilder: (context, index) {
                        return PostWidget(post: state.savedPosts[index]);
                      },
                    );
                  },
                );
        }).toList(),
      ),
    );
  }
}
