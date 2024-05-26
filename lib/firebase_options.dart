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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1QFXIdeQAoHldU63ELhLCBLVq3Fj5nbw',
    appId: '1:1065188411544:android:894dfe3035cd79ba6528ed',
    messagingSenderId: '1065188411544',
    projectId: 'todomate-ff3d2',
    storageBucket: 'todomate-ff3d2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6k93jxljbbWYNmgD5Xa4pwY4nGIpUNTQ',
    appId: '1:1065188411544:ios:20ffee24a3a2d7206528ed',
    messagingSenderId: '1065188411544',
    projectId: 'todomate-ff3d2',
    storageBucket: 'todomate-ff3d2.appspot.com',
    androidClientId: '1065188411544-th0h1s4up7p7900aq956fnn3p8d3k2pk.apps.googleusercontent.com',
    iosClientId: '1065188411544-gu5r23pdbo60m1j7d34diks969pd5roc.apps.googleusercontent.com',
    iosBundleId: 'com.example.todomate',
  );
}
