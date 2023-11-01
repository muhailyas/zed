import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zed/business_logic/auth/auth_bloc.dart';
import 'package:zed/business_logic/bottom_nav/bottom_navigation_bloc.dart';
import 'package:zed/business_logic/comment/comment_bloc.dart';
import 'package:zed/business_logic/home/home_bloc.dart';
import 'package:zed/business_logic/post/post_bloc.dart';
import 'package:zed/business_logic/profile/profile_bloc.dart';
import 'package:zed/business_logic/search/search_bloc.dart';
import 'package:zed/business_logic/user/user_bloc.dart';
import 'package:zed/data/data_sources/authentication_data_source/authentication_data_source.dart';
import 'package:zed/data/data_sources/comment_data_source/comment_data_source.dart';
import 'package:zed/data/data_sources/post_data_source/post_data_source.dart';
import 'package:zed/data/data_sources/user_data_source/user_data_source.dart';
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
        BlocProvider(create: (context) => AuthBloc(AuthenticationDataSource())),
        BlocProvider(create: (context) => BottomNavigationBloc()),
        BlocProvider(create: (context) => UserBloc(UserDataSource())),
        BlocProvider(
            create: (context) => PostBloc(PostDataSource(), UserDataSource())),
        BlocProvider(create: (context) => HomeBloc(PostDataSource())),
        BlocProvider(
            create: (context) =>
                ProfileBloc(UserDataSource(), PostDataSource())),
        BlocProvider(create: (context) => SearchBloc(UserDataSource())),
        BlocProvider(create: (context) => CommentBloc(CommentDataSource())),
      ],
      child: MaterialApp(
        title: 'Zed',
        theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
