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
    apiKey: 'AIzaSyDYu6A-CgBzhe7ndQ2b8MxDCYaJSZWQlvE',
    appId: '1:868056082454:web:c9035b8f59fc2ad5e76d37',
    messagingSenderId: '868056082454',
    projectId: 'socialmediaapp-d09f1',
    authDomain: 'socialmediaapp-d09f1.firebaseapp.com',
    storageBucket: 'socialmediaapp-d09f1.appspot.com',
    measurementId: 'G-3YG65DKBG0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWixOyeEdCxa6QpQX-osKzrCnO7WKv38g',
    appId: '1:868056082454:android:c332afb7f8155df5e76d37',
    messagingSenderId: '868056082454',
    projectId: 'socialmediaapp-d09f1',
    storageBucket: 'socialmediaapp-d09f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXojPQdEsaf60dx1dBVzA4qp-zGoDc6jY',
    appId: '1:868056082454:ios:4e88d01d085549a7e76d37',
    messagingSenderId: '868056082454',
    projectId: 'socialmediaapp-d09f1',
    storageBucket: 'socialmediaapp-d09f1.appspot.com',
    iosBundleId: 'com.example.flutterWorksheet3',
  );
}