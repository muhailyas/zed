import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
import 'package:zed/presentation/screens/edit_profile/edit_profile.dart';
import 'package:zed/presentation/screens/login_page/widgets/text_field/text_field.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

enum Field { name, username, bio }

class EditFieldScreen extends StatelessWidget {
  const EditFieldScreen({super.key, required this.field});
  final Field field;

  @override
  Widget build(BuildContext context) {
    if (field == Field.bio) {
      bioController.text = userProfile.value!.bio;
    } else if (field == Field.name) {
      nameController.text = userProfile.value!.fullname;
    } else {
      usernameController.text = userProfile.value!.userName;
    }
    final fieldName =
        field.name.replaceRange(0, 1, field.name.substring(0, 1).toUpperCase());
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          const Icon(Icons.close, color: whiteColor, size: 30)),
                  width20,
                  Text(fieldName,
                      style: customFontStyle(
                          size: 22, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      loadingNotifier.value = true;
                      if (field == Field.bio) {
                        await updateDetails(
                                input: bioController.text.trim(), field: field)
                            .whenComplete(() => Navigator.pop(context));
                      } else if (field == Field.name) {
                        await updateDetails(
                                input: nameController.text.trim(), field: field)
                            .whenComplete(() => Navigator.pop(context));
                      } else {
                        await updateDetails(
                                input: usernameController.text.trim(),
                                field: field)
                            .whenComplete(() => Navigator.pop(context));
                      }
                      final user = await UserDataSource()
                          .getUserByUid(FirebaseAuth.instance.currentUser!.uid);
                      userProfile.value = user;
                      loadingNotifier.value = false;
                    },
                    child: ValueListenableBuilder(
                      valueListenable: loadingNotifier,
                      builder: (context, value, _) {
                        return value
                            ? const CupertinoActivityIndicator()
                            : const Icon(Icons.check,
                                color: secondaryBlue, size: 30);
                      },
                    ),
                  ),
                ],
              ),
              height10,
              Text(fieldName,
                  style: customFontStyle(color: greyColor, size: 14)),
              TextFieldWidget(
                  controller: field == Field.bio
                      ? bioController
                      : field == Field.name
                          ? nameController
                          : usernameController,
                  hint: fieldName,
                  iconData: null,
                  fontSize: 14,
                  function: () {}),
              height05,
              field == Field.bio
                  ? const SizedBox()
                  : Text(
                      field == Field.name ? nameUpdateText : usernameUpdateText,
                      textAlign: TextAlign.justify,
                      style: customFontStyle(
                        size: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> updateDetails(
    {required String input, required Field field}) async {
  final user = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  if (field == Field.bio) {
    //
    await user.update({'bio': input});
  } else if (field == Field.name) {
    //
    await user.update({'fullname': input});
  } else {
    //
    await user.update({'userName': input});
  }
}
