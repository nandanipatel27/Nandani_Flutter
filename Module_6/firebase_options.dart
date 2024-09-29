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
    apiKey: 'AIzaSyC5PT6EdmBYKKmpnXrQ3F_h6I3YxgqrMfg',
    appId: '1:248438162117:web:c57fbd7d69509a3296a6ac',
    messagingSenderId: '248438162117',
    projectId: 'flutterfirebase-9d441',
    authDomain: 'flutterfirebase-9d441.firebaseapp.com',
    storageBucket: 'flutterfirebase-9d441.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2e3slMWG3V7MvpJ3hhwmnIXc-vbwhYxM',
    appId: '1:248438162117:ios:cde48f93b62f7b4396a6ac',
    messagingSenderId: '248438162117',
    projectId: 'flutterfirebase-9d441',
    storageBucket: 'flutterfirebase-9d441.appspot.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2e3slMWG3V7MvpJ3hhwmnIXc-vbwhYxM',
    appId: '1:248438162117:ios:cde48f93b62f7b4396a6ac',
    messagingSenderId: '248438162117',
    projectId: 'flutterfirebase-9d441',
    storageBucket: 'flutterfirebase-9d441.appspot.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC5PT6EdmBYKKmpnXrQ3F_h6I3YxgqrMfg',
    appId: '1:248438162117:web:f42410190ca55cee96a6ac',
    messagingSenderId: '248438162117',
    projectId: 'flutterfirebase-9d441',
    authDomain: 'flutterfirebase-9d441.firebaseapp.com',
    storageBucket: 'flutterfirebase-9d441.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8oz8rRwnBmXtLnFbUid1mf96f97vh8jc',
    appId: '1:248438162117:android:877a5b14de37706c96a6ac',
    messagingSenderId: '248438162117',
    projectId: 'flutterfirebase-9d441',
    storageBucket: 'flutterfirebase-9d441.appspot.com',
  );

}