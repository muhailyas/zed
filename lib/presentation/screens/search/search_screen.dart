import 'package:flutter/material.dart';
import 'package:zed/utils/constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Search Screen",
        style: customFontStyle(),
      ),
    );
  }
}
