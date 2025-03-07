// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCnatV3HjqMc0EzB5LXQEEMGsRS4xGGels',
    appId: '1:917284048428:web:e5d09bdcffe72f4278cb89',
    messagingSenderId: '917284048428',
    projectId: 'fir-01-29e02',
    authDomain: 'fir-01-29e02.firebaseapp.com',
    storageBucket: 'fir-01-29e02.appspot.com',
    measurementId: 'G-30B5T3RBD1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBU2L_nsRuzFtY5u7nITbYnXTeJjBsxn0',
    appId: '1:917284048428:android:3a3eb613a833d7c978cb89',
    messagingSenderId: '917284048428',
    projectId: 'fir-01-29e02',
    storageBucket: 'fir-01-29e02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYs7pea-b-o5jvKbswmVWFt8J7OfaZNnY',
    appId: '1:917284048428:ios:6b7b2ac9615cfcc278cb89',
    messagingSenderId: '917284048428',
    projectId: 'fir-01-29e02',
    storageBucket: 'fir-01-29e02.appspot.com',
    iosBundleId: 'com.example.firebase01',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYs7pea-b-o5jvKbswmVWFt8J7OfaZNnY',
    appId: '1:917284048428:ios:6b7b2ac9615cfcc278cb89',
    messagingSenderId: '917284048428',
    projectId: 'fir-01-29e02',
    storageBucket: 'fir-01-29e02.appspot.com',
    iosBundleId: 'com.example.firebase01',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCnatV3HjqMc0EzB5LXQEEMGsRS4xGGels',
    appId: '1:917284048428:web:f7def2030b8d274678cb89',
    messagingSenderId: '917284048428',
    projectId: 'fir-01-29e02',
    authDomain: 'fir-01-29e02.firebaseapp.com',
    storageBucket: 'fir-01-29e02.appspot.com',
    measurementId: 'G-8T1N952180',
  );
}
