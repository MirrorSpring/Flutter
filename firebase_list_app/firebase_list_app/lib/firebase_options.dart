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
    apiKey: 'AIzaSyDt8ktdJ4DKSXJ8BmX_CxitJUZrpYTbd3o',
    appId: '1:961978257291:web:7bd008bbaab733e588698e',
    messagingSenderId: '961978257291',
    projectId: 'students-3a2d6',
    authDomain: 'students-3a2d6.firebaseapp.com',
    storageBucket: 'students-3a2d6.appspot.com',
    measurementId: 'G-72NFJQCBM3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAN0D4_C4FWFdcO_u4czSjtp5VK5uFMUSg',
    appId: '1:961978257291:android:970c31b013a79cb388698e',
    messagingSenderId: '961978257291',
    projectId: 'students-3a2d6',
    storageBucket: 'students-3a2d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSg8RSBILjG0sz6I0SKBv9purarv8NNXs',
    appId: '1:961978257291:ios:9d8294f5e679be7d88698e',
    messagingSenderId: '961978257291',
    projectId: 'students-3a2d6',
    storageBucket: 'students-3a2d6.appspot.com',
    iosClientId: '961978257291-7v8rdg46q6usumt0ib5fcbklc7redk82.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseListApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSg8RSBILjG0sz6I0SKBv9purarv8NNXs',
    appId: '1:961978257291:ios:9d8294f5e679be7d88698e',
    messagingSenderId: '961978257291',
    projectId: 'students-3a2d6',
    storageBucket: 'students-3a2d6.appspot.com',
    iosClientId: '961978257291-7v8rdg46q6usumt0ib5fcbklc7redk82.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseListApp',
  );
}
