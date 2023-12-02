import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/post/post_bloc.dart';
import 'package:zed/presentation/screens/view_post/view_post.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class PostList extends StatelessWidget {
  const PostList({super.key, required this.isSavedPost});
  final bool isSavedPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(isSavedPost ? 'Saved posts' : 'Posts',
            style: customFontStyle(fontWeight: FontWeight.bold)),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsFetchIsEmpty) {
            return Center(
                child: Text(
              'No Posts',
              style: customFontStyle(),
            ));
          } else if (state is PostsFetchSuccess) {
            return GridView.builder(
              itemCount: state.posts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: .5,
                crossAxisSpacing: .5,
                childAspectRatio: 1 / 1.6,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenViewPost(post: state.posts[index]),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        image: DecorationImage(
                            image: NetworkImage(state.posts[index].imageUrl),
                            fit: BoxFit.cover)),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
