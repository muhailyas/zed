import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:zed/business_logic/notification/notification_bloc.dart';
import 'package:zed/presentation/screens/notifications/widgets/notification_tile_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.fetchNotifications());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        titleSpacing: 5,
        title: Text("Notifications",
            style: customFontStyle(size: 25, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                backgroundColor: greyColor,
                valueColor: AlwaysStoppedAnimation(whiteColor),
              ));
            }
            if (state is FetchedSucces) {
              if (state.notifications.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: screenWidth / 1.53,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenHeight / 5,
                          width: screenWidth / 2,
                          child: const RiveAnimation.asset(
                              'assets/no notifications.riv'),
                        ),
                        Text('Nothing to see here yet',
                            style: customFontStyle(
                                fontWeight: FontWeight.bold, size: 24)),
                        height05,
                        Text(
                          'When you receive notifications about your post, you will see them here.',
                          style: customFontStyle(size: 15, color: greyColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => NotificationTileWidget(
                      notification: state.notifications[index]),
                  separatorBuilder: (context, index) => height05,
                  itemCount: state.notifications.length);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
