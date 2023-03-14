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
    apiKey: 'AIzaSyBvb33Cefb0C-siF75XB2PX3T2HJdjljmI',
    appId: '1:986960255776:web:7a4054f70163eafdccd545',
    messagingSenderId: '986960255776',
    projectId: 'todotest-bcf31',
    authDomain: 'todotest-bcf31.firebaseapp.com',
    storageBucket: 'todotest-bcf31.appspot.com',
    measurementId: 'G-HXGNTX137L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx-zwQwlXW93HQvxOZnIY41vlrDfKXeZk',
    appId: '1:986960255776:android:73512e1179f721fdccd545',
    messagingSenderId: '986960255776',
    projectId: 'todotest-bcf31',
    storageBucket: 'todotest-bcf31.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlty6mWLBq-JMWT8ozYuk9oAHqEzD_xRQ',
    appId: '1:986960255776:ios:293a7a700dbc491cccd545',
    messagingSenderId: '986960255776',
    projectId: 'todotest-bcf31',
    storageBucket: 'todotest-bcf31.appspot.com',
    iosClientId: '986960255776-i168tooha1icu6f4rs4fcc9ckacrdttt.apps.googleusercontent.com',
    iosBundleId: 'com.example.kardusinfoTodo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlty6mWLBq-JMWT8ozYuk9oAHqEzD_xRQ',
    appId: '1:986960255776:ios:293a7a700dbc491cccd545',
    messagingSenderId: '986960255776',
    projectId: 'todotest-bcf31',
    storageBucket: 'todotest-bcf31.appspot.com',
    iosClientId: '986960255776-i168tooha1icu6f4rs4fcc9ckacrdttt.apps.googleusercontent.com',
    iosBundleId: 'com.example.kardusinfoTodo',
  );
}
