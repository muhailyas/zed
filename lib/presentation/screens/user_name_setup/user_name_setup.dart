import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/presentation/screens/auth/widgets/text_field/text_field.dart';
import 'package:zed/presentation/screens/root_page/root_page.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class UserNameSetup extends StatelessWidget {
  const UserNameSetup({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<AuthBloc>(context);
    blocProvider.userNameController.text = name;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Create account",
              style: customFontStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Step 3 of 3",
              style: customFontStyle(fontWeight: FontWeight.w400, size: 16),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Choose username",
              style: customFontStyle(size: 30),
            ),
            height05,
            Text(
              "You can always change it later",
              style: customFontStyle(size: 16),
            ),
            height10,
            TextFieldWidget(
                controller: blocProvider.userNameController,
                hint: 'Username',
                iconData: Icons.account_circle_outlined),
            height10,
            ElevatedButtonWidget(
                color: secondaryBlue,
                label: 'Finish Setup',
                onPressed: () {
                  if (blocProvider.userNameController.text.isNotEmpty) {
                    // create user collection from here
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                        (route) => false);
                  }
                })
          ],
        ),
      ),
    );
  }
}
