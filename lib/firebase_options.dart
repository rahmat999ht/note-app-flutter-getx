import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCiFQyndzSW20ZATGmxhe_q0ctprRdAriU',
    appId: '1:454094728929:web:dbfb073b36bd64bfc391a0',
    messagingSenderId: '454094728929',
    projectId: 'note-app-e22c0',
    authDomain: 'note-app-e22c0.firebaseapp.com',
    storageBucket: 'note-app-e22c0.appspot.com',
    measurementId: 'G-6ZJ4JKQPTC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADfEQBsQxp5Gpfwq9BZ9RYcWuDjmF8NcI',
    appId: '1:454094728929:android:c8184aa525536ef3c391a0',
    messagingSenderId: '454094728929',
    projectId: 'note-app-e22c0',
    storageBucket: 'note-app-e22c0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJHk4ykFsd2cRkGxo6UXVS8n_Br_lBTeU',
    appId: '1:454094728929:ios:71f9959fc4c56eb1c391a0',
    messagingSenderId: '454094728929',
    projectId: 'note-app-e22c0',
    storageBucket: 'note-app-e22c0.appspot.com',
    iosBundleId: 'yayat.tech.noteAppFlutterGetxFirebase',
  );
}
