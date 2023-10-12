import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/presentation/screens/add_details/add_details.dart';
import 'package:zed/presentation/screens/root_page/root_page.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

import 'widgets/text_field/text_field.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key, required this.result});
  final UserValidation result;

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<AuthBloc>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity),
                Align(
                    alignment: Alignment.center,
                    child: Text("ZED",
                        style: customFontStyle(
                            size: textSize * 55,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -4,
                            italic: FontStyle.italic))),
                SizedBox(height: screenHeight * 0.15),
                Text(
                    result == UserValidation.oldUser
                        ? "Welcome back"
                        : "Your social journey starts here",
                    style: customFontStyle(size: textSize * 35)),
                height10,
                // email field
                Text("Email", style: customFontStyle(size: textSize * 16)),
                TextFieldWidget(
                    controller: context.read<AuthBloc>().emailController,
                    hint: 'Type your email',
                    iconData: Icons.email_outlined),
                height10,
                // password field
                Text("Password", style: customFontStyle(size: textSize * 16)),
                TextFieldWidget(
                    controller: context.read<AuthBloc>().passwordController,
                    hint: 'Type your password',
                    iconData: Icons.password_outlined,
                    obscureText: true),
                height10,
                result == UserValidation.newUser
                    ? Text("Confirm password",
                        style: customFontStyle(size: textSize * 16))
                    : const SizedBox(),
                result == UserValidation.newUser
                    ? TextFieldWidget(
                        controller:
                            context.read<AuthBloc>().confirmPasswordController,
                        hint: 'Type your password',
                        iconData: Icons.password_outlined,
                        obscureText: true,
                        isConfirm: true,
                      )
                    : const SizedBox(),
                height10,
                result == UserValidation.newUser
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget password?",
                          style: customFontStyle(
                              size: textSize * 16, fontWeight: FontWeight.w300),
                        )),
                height10,
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    state.userValidation != null
                        ? userValidationResult(state.userValidation!, context)
                        : null;
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (result == UserValidation.newUser &&
                          blocProvider.emailController.text.isNotEmpty &&
                          blocProvider.passwordController.text.isNotEmpty &&
                          blocProvider.passwordController.text ==
                              blocProvider.confirmPasswordController.text) {

                        context.read<AuthBloc>().add(SignUp(
                            email: blocProvider.emailController.text,
                            password: blocProvider.passwordController.text));
                      } else if (result == UserValidation.oldUser &&
                          blocProvider.emailController.text.isNotEmpty &&
                          blocProvider.passwordController.text.isNotEmpty) {
                        context.read<AuthBloc>().add(Login(
                            email: blocProvider.emailController.text,
                            password: blocProvider.passwordController.text));
                      } else {
                        print("complete?");
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: radius20)),
                        fixedSize: MaterialStatePropertyAll(
                            Size(screenWidth, screenHeight * 0.055)),
                        backgroundColor:
                            const MaterialStatePropertyAll(secondaryDark)),
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state.isSaving) {
                          return const RiveAnimation.asset(
                            'assets/loading.riv',
                          );
                        }
                        return Text(
                          result == UserValidation.newUser
                              ? "Sign up"
                              : "Login",
                          style: customFontStyle(
                              fontWeight: FontWeight.bold, size: textSize * 25),
                        );
                      },
                    ),
                  ),
                ),
                height10,
                result == UserValidation.newUser
                    ? const SizedBox()
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: whiteColor,
                                  thickness: 1,
                                ),
                              ),
                              Text(
                                "OR",
                                style: customFontStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Expanded(
                                child: Divider(
                                  color: whiteColor,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          height10,
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: radius20)),
                                fixedSize: MaterialStatePropertyAll(
                                    Size(screenWidth, screenHeight * 0.05)),
                                backgroundColor: const MaterialStatePropertyAll(
                                    secondaryBlue)),
                            icon: const Icon(
                              Icons.facebook,
                              color: whiteColor,
                              size: 30,
                            ),
                            label: Text(
                              "Continue with facebook",
                              style: customFontStyle(
                                  fontWeight: FontWeight.bold,
                                  size: textSize * 20),
                            ),
                          ),
                          height10,
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: radius20)),
                                fixedSize: MaterialStatePropertyAll(
                                    Size(screenWidth, screenHeight * 0.05)),
                                backgroundColor: const MaterialStatePropertyAll(
                                    secondaryDark)),
                            icon: Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://imgs.search.brave.com/35yJ0AAz887gh9V1WNVzv5WiPSmUbdJJlIp-Dp_Rabg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHMuc3RpY2twbmcu/Y29tL2ltYWdlcy81/ODQ3ZjljYmNlZjEw/MTRjMGI1ZTQ4Yzgu/cG5n"))),
                            ),
                            label: Text(
                              "Continue with google",
                              style: customFontStyle(
                                  fontWeight: FontWeight.bold,
                                  size: textSize * 20),
                            ),
                          ),
                        ],
                      ),
                height10,
                result == UserValidation.newUser
                    ? InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                AuthScreen(result: UserValidation.oldUser),
                          ));
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Already have an account",
                            style: customFontStyle(),
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: customFontStyle(),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    AuthScreen(result: UserValidation.newUser),
                              ));
                            },
                            child: Text(
                              "Sign up",
                              style: customFontStyle(color: secondaryBlue),
                            ),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void userValidationResult(UserValidation userValidation, BuildContext context) {
  if (userValidation == UserValidation.signUpSuccess) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const AddDetailsWithSignUp(),
    ));
  } else if (userValidation == UserValidation.loginSuccess) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const RootPage(),
        ),
        (route) => false);
  }
}
