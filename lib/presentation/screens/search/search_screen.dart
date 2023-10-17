import 'package:flutter/material.dart';
import 'package:zed/presentation/widgets/search_field/search_field.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              height05,
              const SearchFieldWidget(width: 440),
              height05,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: secondaryDark, borderRadius: radius10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
