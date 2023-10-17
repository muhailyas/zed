import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/business_logic/cubit/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:zed/firebase_options.dart';
import 'package:zed/presentation/screens/login_page/login.dart';
import 'package:zed/presentation/screens/root_page/root_page.dart';
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
        ),
        BlocProvider(
          create: (context) {
            return BottomNavigationCubit();
          },
        )
      ],
      child: MaterialApp(
        title: 'Zed',
        theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const RootPage();
              }
              return AuthScreen();
            }),
      ),
    );
  }
}
