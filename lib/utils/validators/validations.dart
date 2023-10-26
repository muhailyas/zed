import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zed/business_logic/auth/auth_bloc.dart';

bool isEmailValid(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}

bool isPasswordValid(String password) {
  return password.length >= 8;
}

bool isUsernameValid(String username) {
  final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
  return usernameRegex.hasMatch(username);
}

bool isFullNameValid(String fullName) {
  final fullNameRegex = RegExp(r'^[A-Za-z\s]{2,}$');
  return fullNameRegex.hasMatch(fullName);
}

validation(Function function, String input) {
  if (function == isEmailValid) {
    return isEmailValid(input);
  } else if (function == isPasswordValid) {
    return isPasswordValid(input);
  } else if (function == isUsernameValid) {
    return isUsernameValid(input);
  } else {
    return isFullNameValid(input);
  }
}

validationResult(Function function) {
  if (function == isEmailValid) {
    return 'Please enter a valid email';
  } else if (function == isFullNameValid) {
    return 'Invalid characters in full name';
  } else if (function == isPasswordValid) {
    return 'password should contain atleast 8 characters';
  } else if (function == isUsernameValid) {
    return 'Username can only contain letters, numbers, and underscores';
  }
}

String getProviderForCurrentUser() {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null && user.providerData.isNotEmpty) {
    String primaryProvider = user.providerData[0].providerId;
    if (primaryProvider == 'google.com') {
      return 'Google Provider';
    } else {
      return 'Email/Password Provider';
    }
  } else {
    return 'No associated providers';
  }
}

String fieldIsEmpty(TextEditingController controller, context) {
  final provider = BlocProvider.of<AuthBloc>(context);
  if (provider.emailController == controller) {
    return 'email is required';
  } else if (provider.confirmPasswordController == controller) {
    return 'confirm password is required';
  } else if (provider.fullNameController == controller) {
    return 'fullname is required';
  } else if (provider.passwordController == controller) {
    return 'password is required';
  } else if (provider.userNameController == controller) {
    return 'user is required';
  } else {
    return 'field is empty';
  }
}
