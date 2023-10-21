import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/presentation/widgets/search_field/search_field.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

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
        onRefresh: () async {},
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              height10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SearchFieldWidget(width: screenWidth * 0.8),
                  Container(
                    height: 50,
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                        color: secondaryDark, borderRadius: radius20),
                    child: Center(
                      child: Text("filter", style: customFontStyle(size: 15)),
                    ),
                  )
                ],
              ),
              height10,
              Container(
                decoration: const BoxDecoration(
                    color: secondaryDark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 65,
                                  width: 65,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://imgs.search.brave.com/INxZ1HlsxtfR-5xtNfavRgMyJ0wiVETft-WsJxJE2Jo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/Nzg1MTU3NC9waG90/by9wcm9maWxlLW9m/LXlvdW5nLXdvbWFu/cy1mYWNlLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1GQjIy/UmIwM3NZZkNiTl9M/MmNoQ2psNHVTN2JU/VTdWN1U5WEUySEZx/SFpRPQ'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sara Merry",
                                    style: customFontStyle(size: 18),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Hello",
                                          style: customFontStyle(size: 16),
                                        ),
                                        width10,
                                        Text(
                                          " 12min ago",
                                          style: customFontStyle(size: 12),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Container(
                          height: 0.1,
                          color: whiteColor,
                          width: double.infinity)),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
