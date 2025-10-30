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
          'DefaultFirebaseOptions have not been configured for macOS - '
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEmpwSDAWtGH-DNdB5cPZqKXCrnDW3Pes',
    appId: '1:270779683640:android:9f71ac57af5499a16ce7cd',
    messagingSenderId: '270779683640',
    projectId: 'learn-loop-f1855',
    storageBucket: 'learn-loop-f1855.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEmpwSDAWtGH-DNdB5cPZqKXCrnDW3Pes',
    appId: '1:270779683640:ios:9f71ac57af5499a16ce7cd',
    messagingSenderId: '270779683640',
    projectId: 'learn-loop-f1855',
    storageBucket: 'learn-loop-f1855.firebasestorage.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDEmpwSDAWtGH-DNdB5cPZqKXCrnDW3Pes',
    appId: '1:270779683640:web:9f71ac57af5499a16ce7cd',
    messagingSenderId: '270779683640',
    projectId: 'learn-loop-f1855',
    storageBucket: 'learn-loop-f1855.firebasestorage.app',
  );
}
