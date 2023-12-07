import 'package:flutter/material.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'widgets/feature_item/feature_item.dart';
import 'widgets/join_reason_item/join_reason_item.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "About",
          style: customFontStyle(fontWeight: FontWeight.bold, size: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Zed - Your Social Hub!',
              style: customFontStyle(fontWeight: FontWeight.bold, size: 24),
            ),
            const SizedBox(height: 16),
            Text(
              'At Zed, we believe in connecting people through shared moments, vibrant stories, and meaningful interactions. Our platform is designed to bring joy, creativity, and community to your social experience. Here\'s what you can expect:',
              style: customFontStyle(size: 16),
            ),
            const SizedBox(height: 16),
            const FeatureItem(
                text: '📸 Image Sharing: Share your life in pictures.'),
            height05,
            const FeatureItem(
                text:
                    '📖 Story Feature: Craft engaging stories with photos and videos.'),
            height05,
            const FeatureItem(
                text:
                    '💬 Chat Anytime: Stay connected with friends through seamless and instant messaging.'),
            const SizedBox(height: 16),
            Text(
              'Why Zed?',
              style: customFontStyle(fontWeight: FontWeight.bold, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              'Join Zed to:',
              style: customFontStyle(size: 16),
            ),
            const JoinReasonItem(
                text: 'Rediscover the joy of sharing genuine moments.'),
            const JoinReasonItem(
                text:
                    'Connect with friends in a visually rich and interactive environment.'),
            const JoinReasonItem(
                text:
                    'Explore a community-driven space where creativity knows no bounds.'),
            height10,
            Text(
              'Thank you for being a part of the Zed community. Together, let\'s create, connect, and celebrate moments that matter.',
              style: customFontStyle(size: 18),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  fullWidth,
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'version ',
                        style: customFontStyle(size: 16, color: greyColor)),
                    TextSpan(
                        text: '1.0.0',
                        style: customFontStyle(size: 13, color: greyColor))
                  ])),
                  height10
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
