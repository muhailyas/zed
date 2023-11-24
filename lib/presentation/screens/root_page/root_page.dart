import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/bottom_nav/bottom_navigation_bloc.dart';
import 'package:zed/data/data_sources/notification_data_source/notification_data_source.dart';
import 'package:zed/presentation/screens/create_post/create_post.dart';
import 'package:zed/presentation/screens/root_page/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationDataSource.updateToken();
    return Scaffold(
      backgroundColor: primaryColor,
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return screens[state.index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
      floatingActionButton:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          if (state.index != 0) {
            return const SizedBox();
          }
          return FloatingActionButton(
            backgroundColor: secondaryBlue,
            child: const Icon(Iconsax.additem),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatePostScreen(),
                  ));
            },
          );
        },
      ),
    );
  }
}
