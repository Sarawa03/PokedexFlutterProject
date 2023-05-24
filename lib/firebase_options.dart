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
    apiKey: 'AIzaSyA7jSzcRnaxkXBzrRkXJAc9QoooIlKefY8',
    appId: '1:971432344887:web:5a657b557879549197aeb2',
    messagingSenderId: '971432344887',
    projectId: 'flutter-project-sara-pokedex',
    authDomain: 'flutter-project-sara-pokedex.firebaseapp.com',
    storageBucket: 'flutter-project-sara-pokedex.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYNhUMa0I9VueHZhRqlsvYuLplZJinYok',
    appId: '1:971432344887:android:d160dd6b85020dba97aeb2',
    messagingSenderId: '971432344887',
    projectId: 'flutter-project-sara-pokedex',
    storageBucket: 'flutter-project-sara-pokedex.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyh25yi1qOFGrbII9czp8wygeiYawo8_Q',
    appId: '1:971432344887:ios:60368b899a099c0197aeb2',
    messagingSenderId: '971432344887',
    projectId: 'flutter-project-sara-pokedex',
    storageBucket: 'flutter-project-sara-pokedex.appspot.com',
    iosClientId: '971432344887-58att0phjre68em7mjqnguhumgrs1o0q.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyh25yi1qOFGrbII9czp8wygeiYawo8_Q',
    appId: '1:971432344887:ios:60368b899a099c0197aeb2',
    messagingSenderId: '971432344887',
    projectId: 'flutter-project-sara-pokedex',
    storageBucket: 'flutter-project-sara-pokedex.appspot.com',
    iosClientId: '971432344887-58att0phjre68em7mjqnguhumgrs1o0q.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterproject',
  );
}