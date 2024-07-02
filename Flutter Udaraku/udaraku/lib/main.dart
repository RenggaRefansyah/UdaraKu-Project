import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udaraku/pages/gauge.dart';
import 'package:udaraku/pages/history.dart';
import 'package:udaraku/pages/main_page.dart';
import 'package:udaraku/pages/education.dart';
import 'package:udaraku/pages/opening/splash.dart';
import 'package:udaraku/pages/scan.dart';
import 'package:udaraku/pages/statistik.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Firebase Connect");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      //home: MainPage(),
      // home: StatistikPage(),
      theme: ThemeData(primaryColor: Colors.blue),
      title: 'UdaraKu',
    );
  }
}
