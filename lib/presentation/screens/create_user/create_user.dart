import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/presentation/screens/auth/widgets/text_field/text_field.dart';
import 'package:zed/presentation/screens/email_verification/email_verification.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/enums/enums.dart';

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
                  ),
                  height05,
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline_rounded,
                        color: greyColor,
                        size: 18,
                      ),
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
            Text(
              "By tapping Continue, you acknowledge that you have read the Privacy Policy and agree to the Terms of Service",
              style: customFontStyle(
                fontWeight: FontWeight.w400,
                size: 14,
                color: greyColor,
              ),
            ),
            height10,
            BlocBuilder<AuthBloc, AuthState>(
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
                    if (blocProvider.emailController.text.isEmpty ||
                        blocProvider.fullNameController.text.isEmpty ||
                        blocProvider.passwordController.text.isEmpty) {
                      print("Complete full fields");
                      return;
                    }
                    blocProvider.add(SignUp(
                        email: blocProvider.emailController.text,
                        password: blocProvider.passwordController.text));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailVerification(
                              email: blocProvider.emailController.text,
                              fullName: blocProvider.fullNameController.text),
                        ));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
