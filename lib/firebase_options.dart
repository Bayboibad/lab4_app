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
    apiKey: 'AIzaSyAt0Pti76yqg18DRk3R--jveJV-5nF3zDc',
    appId: '1:1014063841879:web:a84df2ac3b0f5e9e631912',
    messagingSenderId: '1014063841879',
    projectId: 'hotelbooking-2fbf9',
    authDomain: 'hotelbooking-2fbf9.firebaseapp.com',
    storageBucket: 'hotelbooking-2fbf9.appspot.com',
    measurementId: 'G-LBW2QQ7HT7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAE6yGJjx9lgRFaQmacBAP27FOJgQr-fT0',
    appId: '1:1014063841879:android:e37e4e016a7ae4c7631912',
    messagingSenderId: '1014063841879',
    projectId: 'hotelbooking-2fbf9',
    storageBucket: 'hotelbooking-2fbf9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcUObKf0ItAHWzog-fFjlt1gWlaWuruNk',
    appId: '1:1014063841879:ios:37fc4ba916ed6c18631912',
    messagingSenderId: '1014063841879',
    projectId: 'hotelbooking-2fbf9',
    storageBucket: 'hotelbooking-2fbf9.appspot.com',
    iosBundleId: 'com.example.lab4App',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcUObKf0ItAHWzog-fFjlt1gWlaWuruNk',
    appId: '1:1014063841879:ios:de8a132aef000502631912',
    messagingSenderId: '1014063841879',
    projectId: 'hotelbooking-2fbf9',
    storageBucket: 'hotelbooking-2fbf9.appspot.com',
    iosBundleId: 'com.example.lab4App.RunnerTests',
  );
}
