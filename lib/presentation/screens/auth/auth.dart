import 'package:flutter/material.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor:primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: double.infinity),
               Align(
                alignment: Alignment.center,
                child: Text("ZED",style: customFontStyle(size: 55,fontWeight: FontWeight.bold,letterSpacing: -4,italic: FontStyle.italic))),
               SizedBox(height: screenHeight*0.2),
              Text("Welcome back",style: customFontStyle(size: 35)),
              height10,
              // email field
               Text("Email",style: customFontStyle()),
              TextFieldWidget(controller: emailController,hint: 'Type your email',iconData: Icons.email_outlined),
              height10,
              // password field
               Text("Password",style: customFontStyle()),
              TextFieldWidget(controller: passwordController,hint: 'Type your password',iconData: Icons.password_outlined,obscureText: true),
              height10,
              Align(
                alignment: Alignment.centerRight,
                child: Text("Forget password?",style: customFontStyle(size: 15,fontWeight: FontWeight.w300),)),
              
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.iconData,
    this.obscureText=false
  });

  final TextEditingController controller;
  final String hint;
  final IconData iconData;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: customFontStyle(size: 16,color: greyColor),
      cursorColor: greyColor,
      decoration:  InputDecoration(
        prefixIcon:Icon(iconData,color: greyColor),
        suffixIcon:obscureText? const Icon(Icons.visibility_off,color: greyColor):null,
        hintText: hint,
        hintStyle:const TextStyle(color: greyColor),
        focusedBorder:const UnderlineInputBorder(borderSide: BorderSide(width: 2,color: greyColor)),
        enabledBorder:const UnderlineInputBorder(borderSide: BorderSide(width: 2,color: greyColor))
      ),
    );
  }
}