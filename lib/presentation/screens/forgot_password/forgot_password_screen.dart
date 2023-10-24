import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/auth/auth_bloc.dart';
import 'package:zed/presentation/screens/login_page/widgets/text_field/text_field.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/validations.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<AuthBloc>(context, listen: false);
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back,
                          color: whiteColor, size: 25)),
                  Text(
                    "Forgot password",
                    style:
                        customFontStyle(size: 25, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter your email and we'll send you a link to reset your password",
                      style: customFontStyle(fontWeight: FontWeight.w300),
                    ),
                    height10,
                    Text('Email',
                        style: customFontStyle(
                            fontWeight: FontWeight.w300, size: 18)),
                    TextFieldWidget(
                      controller: blocProvider.emailController,
                      hint: 'example@gmail.com',
                      iconData: Icons.email_outlined,
                      function: isEmailValid,
                    ),
                    height10,
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state.authResults == AuthResults.passwordReset &&
                            state.passReset != null) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.transparent,
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.passReset!,
                                  style: customFontStyle(),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state.isSaving) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ElevatedButtonWidget(
                            color: secondaryBlue,
                            label: 'Reset password',
                            onPressed: () {
                              if (blocProvider
                                  .emailController.text.isNotEmpty) {
                                blocProvider.add(PasswordResetEvent(
                                    email: blocProvider.emailController.text));
                              } else {
                                const SnackBar snackBar = SnackBar(
                                    content: Text("Field is required"),
                                    backgroundColor: Colors.red);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                      },
                    ),
                    height20
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
