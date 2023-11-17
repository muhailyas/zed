import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/home/home_bloc.dart';
import 'package:zed/business_logic/post/post_bloc.dart';
import 'package:zed/data/models/post/post.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/snackbars.dart';

class PostFloatingActionButton extends StatelessWidget {
  const PostFloatingActionButton({
    super.key,
    required this.blocProvider,
  });

  final PostBloc blocProvider;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listenWhen: (previous, current) => current is PostAddSuccess,
      buildWhen: (previous, current) =>
          current is PostLoading ||
          current is PostAddSuccess ||
          current is PostImageSelected,
      listener: (context, state) {
        blocProvider.captionController.clear();
        context.read<HomeBloc>().add(FetchingPostEvent());
        Navigator.pop(context);
      },
      builder: (context, state) {
        if (state is PostLoading) {
          return Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: CupertinoActivityIndicator(
                    radius: screenHeight * 0.015, color: greyColor),
              ));
        }
        return FloatingActionButton(
          child: const Icon(Iconsax.send_14),
          onPressed: () async {
            if (state is PostImageSelected && state.image != null) {
              final post = Post(
                userId: FirebaseAuth.instance.currentUser!.uid,
                caption: blocProvider.captionController.text,
                imageUrl: state.image!,
                likes: [],
                commentCount: 0,
                profileUrl: '',
                username: '',
                dateTime: DateTime.now(),
              );
              context.read<PostBloc>().add(AddPostEvent(post: post));
            } else {
              showErrorSnackBar('please select an image', context, red);
            }
          },
        );
      },
    );
  }
}
