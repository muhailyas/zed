import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/cubit/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:zed/presentation/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:zed/utils/colors/colors.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationCubit().screens[state.index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
