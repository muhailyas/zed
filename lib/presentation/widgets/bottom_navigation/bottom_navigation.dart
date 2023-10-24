import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/bottom_nav/bottom_navigation_bloc.dart';
import 'package:zed/utils/colors/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
            backgroundColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            onTap: (value) {
              context
                  .read<BottomNavigationBloc>()
                  .add(IndexChagerEvent(index: value));
            },
            selectedItemColor: secondaryBlue,
            unselectedItemColor: greyColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search), label: 'search'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.bell), label: 'Notifications'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled), label: 'Account'),
            ]);
      },
    );
  }
}
