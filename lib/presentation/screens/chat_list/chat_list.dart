import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/data/data_sources/post_data_source/post_data_source.dart';
import 'package:zed/presentation/widgets/search_field/search_field.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Iconsax.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Chat Room", style: customFontStyle(size: 25)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await PostDataSource()
              .fetchSavedPosts(userId: 'wQk4kUkZTPZupSaaBkq3');
        },
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              height05,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SearchFieldWidget(
                      width: screenWidth * 0.8, type: SearchType.chatSearch),
                  Container(
                    height: 50,
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                        color: primaryColor, borderRadius: radius10),
                    child: Center(
                      child: Text("filter", style: customFontStyle(size: 15)),
                    ),
                  )
                ],
              ),
              height05,
              Container(
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 85,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(test2),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sara Merry",
                                  style: customFontStyle(size: 18),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Hello",
                                      style: customFontStyle(size: 16),
                                    ),
                                    width10,
                                    SizedBox(
                                      width: screenWidth * 0.59,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            " 12min ago",
                                            style: customFontStyle(size: 12),
                                          ),
                                          const CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Colors.blue),
                                        ],
                                      ),
                                    ),
                                    width10
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
