import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://imgs.search.brave.com/INxZ1HlsxtfR-5xtNfavRgMyJ0wiVETft-WsJxJE2Jo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/Nzg1MTU3NC9waG90/by9wcm9maWxlLW9m/LXlvdW5nLXdvbWFu/cy1mYWNlLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1GQjIy/UmIwM3NZZkNiTl9M/MmNoQ2psNHVTN2JU/VTdWN1U5WEUySEZx/SFpRPQ'),
                          fit: BoxFit.cover)),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.add_box_outlined, color: whiteColor, size: 25),
                      SizedBox(width: 20),
                      Icon(Icons.menu, color: whiteColor, size: 25)
                    ],
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 10,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://imgs.search.brave.com/INxZ1HlsxtfR-5xtNfavRgMyJ0wiVETft-WsJxJE2Jo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/Nzg1MTU3NC9waG90/by9wcm9maWxlLW9m/LXlvdW5nLXdvbWFu/cy1mYWNlLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1GQjIy/UmIwM3NZZkNiTl9M/MmNoQ2psNHVTN2JU/VTdWN1U5WEUySEZx/SFpRPQ'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: ElevatedButtonWidget(
                      color: secondaryBlue,
                      width: 0.4,
                      height: 0.04,
                      label: 'Edit profile',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      onPressed: () {}),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sara Merry",
                    style: customFontStyle(),
                  ),
                  Text(
                    "@sara merry",
                    style: customFontStyle(size: 15),
                  ),
                  height05,
                  Row(
                    children: [
                      Text(
                        "1.2k follwers",
                        style: customFontStyle(size: 17),
                      ),
                      const SizedBox(width: 10),
                      Text("500 following", style: customFontStyle(size: 17))
                    ],
                  ),
                  height05,
                  Text(
                    "joined 2023 mar 21",
                    style: customFontStyle(size: 17),
                  ),
                  height05,
                  Text(
                    "I'm passionate flutter developer",
                    style: customFontStyle(size: 17),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: greyColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.border_left_sharp,
                    color: whiteColor,
                  ),
                  label: Text(
                    'posts',
                    style: customFontStyle(size: 16),
                  )),
              const SizedBox(width: 50),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark,
                    color: whiteColor,
                  ),
                  label: Text(
                    'saved',
                    style: customFontStyle(size: 16),
                  ))
            ],
          ),
          const Divider(
            color: greyColor,
          ),
          height05,
          SizedBox(
            height: 330,
            width: double.infinity,
            child: Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://imgs.search.brave.com/INxZ1HlsxtfR-5xtNfavRgMyJ0wiVETft-WsJxJE2Jo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTEz/Nzg1MTU3NC9waG90/by9wcm9maWxlLW9m/LXlvdW5nLXdvbWFu/cy1mYWNlLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1GQjIy/UmIwM3NZZkNiTl9M/MmNoQ2psNHVTN2JU/VTdWN1U5WEUySEZx/SFpRPQ'),
                ),
                Positioned(
                    left: 50,
                    child: Text(
                      'sara merry',
                      style: customFontStyle(),
                    )),
                Positioned(
                    left: 150,
                    top: 6,
                    child: Text(
                      "45min",
                      style: customFontStyle(
                          size: 14, fontWeight: FontWeight.w300),
                    )),
                const Positioned(
                  right: 6,
                  child: Icon(Icons.more_vert_rounded, color: whiteColor),
                ),
                Positioned(
                  left: 50,
                  top: 27,
                  child: Container(
                    height: 250,
                    width: 390,
                    decoration: BoxDecoration(
                        borderRadius: radius10,
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://imgs.search.brave.com/3GUPfYEu8Y90_u9h12PxYb3qQg74mKgJTA26xQpfEBA/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNzkz/MzkwMjcvcGhvdG8v/cHJvZmlsZS1vZi1h/LXlvdW5nLXdvbWFu/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz1VdWY4SDRacVVT/bXlzTWg5Tnd4cHps/Skg2WG16TFpLVWZ6/V19vWXRVVFVJPQ'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                  left: 50,
                  bottom: 20,
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.like_14,
                        color: whiteColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "29.1k",
                        style: customFontStyle(
                            size: 15, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Iconsax.message_2,
                        color: whiteColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "12.5k",
                        style: customFontStyle(
                            size: 15, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.insights,
                        color: whiteColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "129.7k",
                        style: customFontStyle(
                            size: 15, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                    right: 10, bottom: 20, child: Icon(Icons.share))
              ],
            ),
          )
        ],
      ),
    );
  }
}
