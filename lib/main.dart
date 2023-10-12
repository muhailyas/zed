import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/firebase_options.dart';
import 'package:zed/presentation/screens/auth/auth.dart';
import 'package:zed/utils/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setScreenSize(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return AuthBloc();
          },
        )
      ],
      child: MaterialApp(
        title: 'Zed',
        theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
        debugShowCheckedModeBanner: false,
        home: AuthScreen(result: UserValidation.oldUser),
      ),
    );
  }
}
