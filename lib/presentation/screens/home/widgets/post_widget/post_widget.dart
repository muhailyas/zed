
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                style: customFontStyle(size: 14, fontWeight: FontWeight.w300),
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
                  style: customFontStyle(size: 15, fontWeight: FontWeight.w300),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Iconsax.message_2,
                  color: whiteColor,
                ),
                const SizedBox(width: 5),
                Text(
                  "12.5k",
                  style: customFontStyle(size: 15, fontWeight: FontWeight.w300),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.insights,
                  color: whiteColor,
                ),
                const SizedBox(width: 5),
                Text(
                  "129.7k",
                  style: customFontStyle(size: 15, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          const Positioned(right: 10, bottom: 20, child: Icon(Icons.share)),
        ],
      ),
    );
  }
}
