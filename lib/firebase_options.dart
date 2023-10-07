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
        return macos;
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
    apiKey: 'AIzaSyApKekK_8CscmVuccryFbsr10MOZ-ue8EY',
    appId: '1:847769322034:web:184a6e6ed3358d08fff22b',
    messagingSenderId: '847769322034',
    projectId: 'student-registration-sys-36c13',
    authDomain: 'student-registration-sys-36c13.firebaseapp.com',
    storageBucket: 'student-registration-sys-36c13.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMRI_ASOdCGxHm3iFnWIg1RTYr_qjl9fQ',
    appId: '1:847769322034:android:9cb3a62eca640a4dfff22b',
    messagingSenderId: '847769322034',
    projectId: 'student-registration-sys-36c13',
    storageBucket: 'student-registration-sys-36c13.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBml2egmdtt2LGMrI2TmFRPx_evBearqxo',
    appId: '1:847769322034:ios:85f5e2fffe6b9984fff22b',
    messagingSenderId: '847769322034',
    projectId: 'student-registration-sys-36c13',
    storageBucket: 'student-registration-sys-36c13.appspot.com',
    iosClientId: '847769322034-67a9g4lhg8occi9thtelko6u75qbi8e2.apps.googleusercontent.com',
    iosBundleId: 'com.example.studentRecordKeepingSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBml2egmdtt2LGMrI2TmFRPx_evBearqxo',
    appId: '1:847769322034:ios:85f5e2fffe6b9984fff22b',
    messagingSenderId: '847769322034',
    projectId: 'student-registration-sys-36c13',
    storageBucket: 'student-registration-sys-36c13.appspot.com',
    iosClientId: '847769322034-67a9g4lhg8occi9thtelko6u75qbi8e2.apps.googleusercontent.com',
    iosBundleId: 'com.example.studentRecordKeepingSystem',
  );
}