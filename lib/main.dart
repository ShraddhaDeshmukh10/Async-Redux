// import 'package:firebase01/view/login01.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:get/get.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('Handling a background message: ${message.messageId}');
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
//     print('Token refreshed: $newToken');
//   });
//   final remoteConfig = FirebaseRemoteConfig.instance;
//   await remoteConfig.setConfigSettings(RemoteConfigSettings(
//     fetchTimeout: const Duration(minutes: 1),
//     minimumFetchInterval: const Duration(hours: 1),
//   ));
//   await remoteConfig.fetchAndActivate();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Loginone(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// import 'package:firebase01/Async%20Redux/app_state.dart';
// import 'package:firebase01/services/notification_service.dart';
// import 'package:firebase01/view/login01.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:get/get.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// /// Background message handler
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('Handling a background message: ${message.data}');
// }

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// /// Initialize local notification settings
// void _initializeLocalNotifications() {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   const InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//   );

//   flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // Set background message handler
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   // Initialize local notifications
//   _initializeLocalNotifications();

//   // Listen for FCM token refresh
//   FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
//     print('Token refreshed: $newToken');
//   });

//   // Initialize Firebase Remote Config
//   final remoteConfig = FirebaseRemoteConfig.instance;
//   await remoteConfig.setConfigSettings(RemoteConfigSettings(
//     fetchTimeout: const Duration(minutes: 1),
//     minimumFetchInterval: const Duration(hours: 1),
//   ));
//   await remoteConfig.fetchAndActivate();
//   NotificationService().init();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const Loginone(), // Your custom login screen widget
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:async_redux/async_redux.dart';
import 'package:firebase01/Async%20Redux%20ToDo/state.dart/state.dart';
import 'package:firebase01/Async%20Redux%20ToDo/todoconnecctor.dart';
import 'package:flutter/material.dart';

void main() {
  // final state = AppState.initialState();
  // Store<AppState> store = Store<AppState>(initialState: state);
  // runApp(StoreProvider(store: store, child: const MyApp()));

  var initialState = AppStateToDo.initialState();
  Store<AppStateToDo> store = Store<AppStateToDo>(initialState: initialState);
  runApp(StoreProvider(
    store: store,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Redux App 01',
        debugShowCheckedModeBanner: false,
        home: ToDoConnector());
  }
}
