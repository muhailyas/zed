import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/presentation/screens/create_user/create_user.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';
import 'package:zed/utils/loadings/loadings.dart';
import 'package:zed/utils/validators/navigation_validate.dart';

import 'widgets/text_field/text_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
                Text("Welcome back",
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
                    iconData: Icons.fingerprint,
                    obscureText: true),
                height10,
                Align(
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
                        ? userValidationResult(
                            userValidation: state.userValidation!,
                            context: context)
                        : null;
                  },
                  child: ElevatedButtonWidget(
                    color: secondaryDark,
                    fontSize: 25,
                    label: 'Login',
                    onPressed: () {
                      if (blocProvider.emailController.text.isNotEmpty &&
                          blocProvider.passwordController.text.isNotEmpty) {
                        threeDotLoading(context);
                        context.read<AuthBloc>().add(Login(
                            email: blocProvider.emailController.text,
                            password: blocProvider.passwordController.text));
                      } else {
                        // handle error here
                      }
                    },
                  ),
                ),
                height10,
                ElevatedButtonWidget(
                  color: secondaryBlue,
                  label: "Continue with facebook",
                  prefix: const Icon(Icons.facebook),
                  onPressed: () {},
                ),
                height10,
                ElevatedButtonWidget(
                  color: secondaryDark,
                  label: "Continue with google",
                  prefix: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://imgs.search.brave.com/35yJ0AAz887gh9V1WNVzv5WiPSmUbdJJlIp-Dp_Rabg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHMuc3RpY2twbmcu/Y29tL2ltYWdlcy81/ODQ3ZjljYmNlZjEw/MTRjMGI1ZTQ4Yzgu/cG5n"))),
                  ),
                  onPressed: () {},
                ),
                height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: customFontStyle(),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const CreateUser(authPages: AuthPages.email),
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
