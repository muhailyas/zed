import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/search/search_bloc.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key, required this.width, required this.type});
  final double width;
  final SearchType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: primaryColor, borderRadius: radius10),
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          style: customFontStyle(),
          onChanged: (value) async {
            if (SearchType.gloabal == type) {
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

ValueNotifier<List<UserProfile>> listN = ValueNotifier([]);
