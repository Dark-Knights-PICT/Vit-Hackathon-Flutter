import 'package:darkknightspict/firebase_options.dart';
import 'package:darkknightspict/project/bottombar.dart';
import 'package:darkknightspict/features/login/login.dart';
import 'package:darkknightspict/services/local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'services/firebase_notification.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  LocalNotificationService.initialize();
  await FirebaseNotifications.initialize();

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dark Knights App',
        theme: ThemeData.dark(),
        home: const BottomBar(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dark Knights App',
        theme: ThemeData.dark(),
        home: const LoginScreen(),
      );
    }
  }
}
