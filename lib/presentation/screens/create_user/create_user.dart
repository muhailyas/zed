import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/data/models/sign_up/sign_up.dart';
import 'package:zed/presentation/screens/auth/widgets/text_field/text_field.dart';
import 'package:zed/presentation/screens/email_verification/email_verification.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';
import 'package:zed/utils/validators/navigation_validate.dart';

class CreateUser extends StatelessWidget {
  final AuthPages authPages;
  const CreateUser({super.key, required this.authPages});

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<AuthBloc>(context, listen: false);
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
              "Step 1 of 3",
              style: customFontStyle(fontWeight: FontWeight.w400, size: 16),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: blocProvider.signUpformKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Full Name", style: customFontStyle(size: 16)),
                    TextFieldWidget(
                      controller: blocProvider.fullNameController,
                      hint: 'Type your name',
                      iconData: Icons.edit_note_sharp,
                    ),
                    height05,
                    Text("Email", style: customFontStyle(size: 16)),
                    TextFieldWidget(
                      controller: blocProvider.emailController,
                      hint: 'Type your email',
                      iconData: Icons.email_outlined,
                    ),
                    height05,
                    Text("Password", style: customFontStyle(size: 16)),
                    TextFieldWidget(
                      controller: blocProvider.passwordController,
                      hint: 'Type password',
                      iconData: Icons.fingerprint,
                      obscureText: true,
                    ),
                    height05,
                    Row(
                      children: [
                        ValueListenableBuilder(
                            valueListenable: isValid,
                            builder: (context, value, _) {
                              return Icon(
                                Icons.check_circle_outline_rounded,
                                color: value ? Colors.green : greyColor,
                                size: textSize * 18,
                              );
                            }),
                        const SizedBox(width: 5),
                        Text(
                          "Password should contain atleast 8 characters",
                          style: customFontStyle(size: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text(
              "By tapping Continue, you acknowledge that you have read the Privacy Policy and agree to the Terms of Service",
              style: customFontStyle(
                fontWeight: FontWeight.w400,
                size: 14,
                color: greyColor,
              ),
            ),
            height10,
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.authResults == AuthResults.signUpSuccess) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailVerification(
                            fullName: blocProvider.fullNameController.text),
                      ));
                }
                state.authResults == AuthResults.initial
                    ? null
                    : userValidationResult(
                        authResults: state.authResults,
                        context: context,
                        isLogin: state.isLogin);
              },
              builder: (context, state) {
                if (state.isSaving) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButtonWidget(
                  color: secondaryBlue,
                  label: 'Continue',
                  onPressed: () {
                    if (!blocProvider.signUpformKey.currentState!.validate()) {
                      return;
                    }
                    final signUp = SignUp(
                        email: blocProvider.emailController.text,
                        password: blocProvider.passwordController.text);
                    blocProvider.add(SignUpEvent(signUp: signUp));
                    blocProvider.signUpformKey.currentState!.reset();
                  },
                );
              },
            ),
            height10
          ],
        ),
      ),
    );
  }
}
