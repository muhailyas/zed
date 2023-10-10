// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDNZlIaN_dC2PIaOKuXS7AyV_uVJBQnN4I',
    appId: '1:1945711983:web:4de36661617cd3c72b649a',
    messagingSenderId: '1945711983',
    projectId: 'zed-social-media',
    authDomain: 'zed-social-media.firebaseapp.com',
    databaseURL: 'https://zed-social-media-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'zed-social-media.appspot.com',
    measurementId: 'G-1LQWTL5FVJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBe2kCPQOlaju9W3CpfGyFTbfAkVt153RM',
    appId: '1:1945711983:android:6491b6f9e71631f92b649a',
    messagingSenderId: '1945711983',
    projectId: 'zed-social-media',
    databaseURL: 'https://zed-social-media-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'zed-social-media.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEOou6ou6YYKE76wXwArKF259iFX5RHiI',
    appId: '1:1945711983:ios:232b2a1a1fc6d76d2b649a',
    messagingSenderId: '1945711983',
    projectId: 'zed-social-media',
    databaseURL: 'https://zed-social-media-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'zed-social-media.appspot.com',
    iosBundleId: 'com.example.zed',
  );
}
