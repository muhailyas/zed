import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/auth/auth_bloc.dart';
import 'package:zed/data/models/login/login.dart';
import 'package:zed/presentation/screens/create_user/create_user.dart';
import 'package:zed/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:zed/presentation/screens/root_page/root_page.dart';
import 'package:zed/presentation/screens/user_name_setup/user_name_setup.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';
import 'package:zed/utils/loadings/loadings.dart';
import 'package:zed/utils/validators/snackbars.dart';
import 'package:zed/utils/validators/validations.dart';
import 'widgets/text_field/text_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<AuthBloc>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: Form(
          key: blocProvider.loginFormKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
                  iconData: Icons.email_outlined,
                  function: isEmailValid,
                ),
                height10,
                // password field
                Text("Password", style: customFontStyle(size: textSize * 16)),
                ValueListenableBuilder(
                    valueListenable: isObscure,
                    builder: (context, value, _) {
                      return TextFieldWidget(
                        controller: context.read<AuthBloc>().passwordController,
                        hint: 'Type your password',
                        iconData: Icons.fingerprint,
                        obscureText: true,
                        function: isPasswordValid,
                      );
                    }),
                height10,
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ));
                      },
                      child: Text(
                        "Forgot password?",
                        style: customFontStyle(
                            size: textSize * 16, fontWeight: FontWeight.w300),
                      ),
                    )),
                height10,
                BlocListener<AuthBloc, AuthState>(
                  listenWhen: (previous, current) =>
                      current is AuthSuccess ||
                      current is AuthError &&
                          current.authResults != AuthResults.error,
                  listener: (context, state) {
                    if (state is AuthError) {
                      userValidationResult(
                          authResults: state.authResults,
                          context: context,
                          isLogin: AuthProvider.login);
                    }

                    if (state is AuthSuccess &&
                        state.authResults == AuthResults.loginSuccess) {
                      userValidationResult(
                          authResults: state.authResults,
                          context: context,
                          isLogin: AuthProvider.login);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RootPage(),
                          ),
                          (route) => false);
                      blocProvider.emailController.clear();
                      blocProvider.passwordController.clear();
                    }
                  },
                  child: ElevatedButtonWidget(
                    color: secondaryDark,
                    height: 0.06,
                    fontSize: 20,
                    label: 'Login',
                    onPressed: () async {
                      if (blocProvider.loginFormKey.currentState!.validate()) {
                        threeDotLoading(context);
                        final login = Login(
                            email: blocProvider.emailController.text,
                            password: blocProvider.passwordController.text);
                        context.read<AuthBloc>().add(LoginEvent(login: login));
                      }
                    },
                  ),
                ),
                height10,
                BlocListener<AuthBloc, AuthState>(
                  listenWhen: (previous, current) => current is AuthSuccess,
                  listener: (context, state) {
                    state as AuthSuccess;
                    if (AuthResults.googleSignInVerified == state.authResults) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RootPage(),
                          ),
                          (route) => false);
                    } else if (state.authResults ==
                        AuthResults.googleSignInVerifiedNewUser) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserNameSetup()));
                    }
                  },
                  child: ElevatedButtonWidget(
                    color: secondaryDark,
                    height: 0.06,
                    label: "Continue with google",
                    fontSize: 20,
                    prefix: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://imgs.search.brave.com/35yJ0AAz887gh9V1WNVzv5WiPSmUbdJJlIp-Dp_Rabg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHMuc3RpY2twbmcu/Y29tL2ltYWdlcy81/ODQ3ZjljYmNlZjEw/MTRjMGI1ZTQ4Yzgu/cG5n"))),
                    ),
                    onPressed: () {
                      blocProvider.add(GoogleSignUpEvent());
                    },
                  ),
                ),
                height10,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                                builder: (context) => const CreateUser(),
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
                height10,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
