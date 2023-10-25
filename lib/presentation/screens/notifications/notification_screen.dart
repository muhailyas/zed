import 'package:flutter/material.dart';
import 'package:zed/presentation/screens/notifications/widgets/notification_tile_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today", style: customFontStyle(color: greyColor)),
              height05,
              ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      const NotificationTileWidget(),
                  separatorBuilder: (context, index) => height05,
                  itemCount: 5),
              height05,
              Text(
                "Last 7 days",
                style: customFontStyle(color: greyColor),
              ),
              height05,
              ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      const NotificationTileWidget(),
                  separatorBuilder: (context, index) => height05,
                  itemCount: 5),
              height05,
            ],
          ),
        ),
      ),
    );
  }
}
