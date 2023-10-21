import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zed/business_logic/bloc/auth/auth_bloc.dart';
import 'package:zed/business_logic/bloc/post/post_bloc.dart';
import 'package:zed/business_logic/bloc/user/user_bloc.dart';
import 'package:zed/business_logic/cubit/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:zed/firebase_options.dart';
import 'package:zed/presentation/screens/splash_screen/splash_screen.dart';
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
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => BottomNavigationCubit()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => PostBloc())
      ],
      child: MaterialApp(
        title: 'Zed',
        theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
