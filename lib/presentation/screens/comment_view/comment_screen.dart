import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/comment/comment_bloc.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/presentation/screens/comment_view/widgets/comment_input_widget/comment_input_widget.dart';
import 'package:zed/presentation/screens/comment_view/widgets/comment_tile_shimmer_widget/comment_tile_shimmer_widget.dart';
import 'package:zed/presentation/screens/comment_view/widgets/comment_tile_widget/comment_tile_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ScreenComment extends StatefulWidget {
  const ScreenComment({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<ScreenComment> createState() => _ScreenCommentState();
}

class _ScreenCommentState extends State<ScreenComment>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    context.read<CommentBloc>().add(CommentFetchEvent(postId: widget.post.id!));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            width10,
            _buildHeader(),
            width10,
            _buildCommentList(),
            _buildCommentInputField(widget.post.id!),
            height05,
          ],
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: whiteColor)),
        Text("Comments", style: customFontStyle()),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(),
        )
      ],
    );
  }

  Widget _buildCommentList() {
    return Expanded(
      child: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentLoading) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return const CommentTileShimmerWidget();
              },
            );
          } else if (state is CommentFetchFailure) {
            return const Center(child: Text("Fetching failure"));
          } else {
            state as CommentFetchSuccess;
            if (state.comments.isEmpty) {
              return Center(
                  child: Text("No comments", style: customFontStyle()));
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                return CommentTileWidget(
                  post: widget.post,
                  comment: state.comments[index],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildCommentInputField(String postId) {
    return CommentInputWidget(postId: postId);
  }
}
