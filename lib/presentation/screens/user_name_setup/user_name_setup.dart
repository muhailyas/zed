import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/business_logic/bloc/user/user_bloc.dart';
import 'package:zed/data/models/user/user.dart';
import 'package:zed/data/repositories/auth_repositories/auth_repositories.dart';
import 'package:zed/presentation/screens/login_page/widgets/text_field/text_field.dart';
import 'package:zed/presentation/screens/root_page/root_page.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/validations.dart';

class UserNameSetup extends StatelessWidget {
  const UserNameSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<AuthBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        AuthRepository.deleteUser();
        return true;
      },
      child: Scaffold(
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
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Text(
                    state.authResults == AuthResults.googleSignInVerifiedNewUser
                        ? "Step 1 of 1"
                        : "Step 3 of 3",
                    style:
                        customFontStyle(fontWeight: FontWeight.w400, size: 16),
                  );
                },
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
              ValueListenableBuilder(
                  valueListenable: isAvailable,
                  builder: (context, value, _) {
                    return TextFieldWidget(
                      controller: blocProvider.userNameController,
                      hint: 'Username',
                      iconData: Icons.account_circle_outlined,
                      function: isUsernameValid,
                      available: true,
                    );
                  }),
              height05,
              Align(
                alignment: Alignment.centerLeft,
                child: ValueListenableBuilder(
                    valueListenable: isAvailable,
                    builder: (context, value, _) {
                      return Text(
                        !value
                            ? '${blocProvider.userNameController.text} is available'
                            : "${blocProvider.userNameController.text} not available",
                        style: customFontStyle(
                            size: 15, color: !value ? whiteColor : Colors.red),
                      );
                    }),
              ),
              height05,
              BlocConsumer<UserBloc, UserState>(
                builder: (context, state) {
                  if (state.isSaving) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButtonWidget(
                      color: secondaryBlue,
                      label: 'Finish Setup',
                      onPressed: () async {
                        if (blocProvider.userNameController.text.isNotEmpty) {
                          final newUser = UserProfile(
                              fullname:
                                  blocProvider.fullNameController.text.trim(),
                              userName:
                                  blocProvider.userNameController.text.trim(),
                              email: blocProvider.emailController.text.trim());
                          context
                              .read<UserBloc>()
                              .add(CreateUserEvent(userProfile: newUser));
                        }
                      });
                },
                listener: (context, state) {
                  if (!state.isSaving) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                        (route) => false);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
