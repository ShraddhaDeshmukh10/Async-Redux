// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class Succesful01 extends StatefulWidget {
//   const Succesful01({super.key});

//   @override
//   State<Succesful01> createState() => _Succesful01State();
// }

// class _Succesful01State extends State<Succesful01> {
//   String? _fcmToken;

//   @override
//   void initState() {
//     super.initState();
//     _getFcmToken();
//   }

//   Future<void> _getFcmToken() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     try {
//       String? token = await messaging.getToken();
//       setState(() {
//         _fcmToken = token;
//       });
//       print('FCM Token: $_fcmToken');
//     } catch (e) {
//       print('Error retrieving FCM token: $e');
//       setState(() {
//         _fcmToken = "Failed to retrieve token";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Center(
//             child: SafeArea(
//               child: Text(
//                 _fcmToken != null
//                     ? "FCM Token: $_fcmToken"
//                     : "Fetching FCM Token...",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:firebase01/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart'; // Add intl package to format date/time

class Succesful01 extends StatefulWidget {
  const Succesful01({super.key});

  @override
  State<Succesful01> createState() => _Succesful01State();
}

class _Succesful01State extends State<Succesful01> {
  String? _fcmToken;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _getFcmToken();
    // _initializeNotifications(); // Initialize notifications

    // Listen to foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received in foreground: ${message.messageId}');

      // Show notification with current time
      if (message.notification != null) {
        NotificationService().showNotification(
          message.notification!.title ?? "No Title",
          message.notification!.body ?? "no Body",
        );
        // _showNotification(
        //   message.notification?.title ?? "Hello",
        //   "Received at: ${_getCurrentTime()}",
        // );
      }

      if (message.data.isNotEmpty) {
        print('Data: ${message.data}');
      }
    });
  }

  // Future<void> _initializeNotifications() async {
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');

  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(android: initializationSettingsAndroid);

  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // }

  Future<void> _getFcmToken() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    try {
      String? token = await messaging.getToken();
      setState(() {
        _fcmToken = token;
      });
      print('FCM Token: $_fcmToken');
    } catch (e) {
      print('Error retrieving FCM token: $e');
      setState(() {
        _fcmToken = "Failed to retrieve token";
      });
    }
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      Navigator.pushNamed(
        context,
        '/chat',
        arguments: (message),
      );
    }
  }

  // Get current time in a readable format
  String _getCurrentTime() {
    return DateFormat('hh:mm:ss a').format(DateTime.now());
  }

  // Show notification when app is in foreground
  Future<void> _showNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'default_channel', // Channel ID
      'General Notifications', // Channel name
      //'This channel is used for general app notifications', // Channel description
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      platformChannelSpecifics,
      payload: 'item x', // Optional payload
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FCM Token Display')),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _fcmToken != null
                  ? "FCM Token: $_fcmToken"
                  : "Fetching FCM Token...",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
