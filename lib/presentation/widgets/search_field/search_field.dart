import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/search/search_bloc.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget(
      {super.key,
      required this.width,
      required this.type,
      this.isChat = false,this.textEditingController});
  final double width;
  final SearchType type;
  final bool isChat;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.06,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: isChat
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))
            : radius10,
      ),
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: textEditingController,
          style: customFontStyle(),
          onChanged: (value) async {
            if (SearchType.gloabal == type) {
              if (value.isEmpty) {
                context.read<SearchBloc>().add(InitialSearch());
                return;
              }
              context.read<SearchBloc>().add(UserSearchEvent(query: value));
            }
          },
          decoration: InputDecoration(
              hintStyle: customFontStyle(size: 16),
              prefixIcon: const Icon(Icons.search_rounded, color: whiteColor),
              hintText: 'Search',
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}
