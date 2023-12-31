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
    apiKey: 'AIzaSyC3KTNfwBnSAaSRwbb7z29SKhrFTLN011Q',
    appId: '1:171872205774:web:850a4598ec38d21f7d899f',
    messagingSenderId: '171872205774',
    projectId: 'projectdonation',
    authDomain: 'projectdonation.firebaseapp.com',
    storageBucket: 'projectdonation.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLkWzNi4JXz2GpKm5eccLkVHxT1yvHRlo',
    appId: '1:171872205774:android:27054a4fa36e9d6b7d899f',
    messagingSenderId: '171872205774',
    projectId: 'projectdonation',
    storageBucket: 'projectdonation.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7Rgb8C2IyLTMQ6ijid02G2A_Y5ylurFI',
    appId: '1:171872205774:ios:e100741b52ac4e7a7d899f',
    messagingSenderId: '171872205774',
    projectId: 'projectdonation',
    storageBucket: 'projectdonation.appspot.com',
    iosBundleId: 'com.example.projectDonation',
  );
}
