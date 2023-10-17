import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/data/data_providers/email_verify/email_verify.dart';
import 'package:zed/data/repositories/auth_repositories/auth_repositories.dart';
import 'package:zed/presentation/screens/login_page/login.dart';
import 'package:zed/presentation/screens/user_name_setup/user_name_setup.dart';
import 'package:zed/presentation/widgets/elevated_button/elevated_button.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';
import 'package:zed/utils/validators/snackbars.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key, required this.fullName});
  final String fullName;

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<AuthBloc>(context, listen: false);
    blocProvider.add(VerifyEmailEvent());
    blocProvider.userNameController.text = fullName;
    return WillPopScope(
      onWillPop: () async {
        AuthRepository.deleteUser();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                AuthRepository.deleteUser();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
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
                "Step 2 of 3",
                style: customFontStyle(fontWeight: FontWeight.w400, size: 16),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/email_opened.png'),
                      fit: BoxFit.contain)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    "Verify your email address",
                    style:
                        customFontStyle(fontWeight: FontWeight.bold, size: 25),
                  ),
                  height10,
                  Text(
                    "We have just send email verification link on your email.Please check email and click on that link to verify your Email address.",
                    style: customFontStyle(size: 20),
                    textAlign: TextAlign.center,
                  ),
                  height20,
                  Text(
                    "If not auto redirected after verification, click on the Continue button.",
                    style: customFontStyle(size: 20),
                    textAlign: TextAlign.center,
                  ),
                  height20,
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      blocProvider.userNameController.text = fullName;
                      if (state.authResults == AuthResults.verified) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const UserNameSetup()));
                      }
                    },
                    child: ElevatedButtonWidget(
                        color: secondaryBlue,
                        label: "Continue",
                        onPressed: () {
                          if (FirebaseAuth
                                  .instance.currentUser?.emailVerified ??
                              false) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserNameSetup(),
                                ));
                          } else {
                            showErrorSnackBar('verify your email and continue',
                                context, Colors.red);
                          }
                        }),
                  ),
                  height10,
                  TextButton(
                      onPressed: () {
                        EmailVerify().sendEmailForVerification();
                      },
                      child: const Text("Resend E-mail Link")),
                  TextButton.icon(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      AuthRepository.deleteUser();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthScreen(),
                          ),
                          (route) => false);
                    },
                    label: const Text("back to login"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
