import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/cubit/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:zed/utils/colors/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
            backgroundColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            onTap: (value) {
              context.read<BottomNavigationCubit>().indexChanger(value);
            },
            selectedItemColor: secondaryBlue,
            unselectedItemColor: greyColor,
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
