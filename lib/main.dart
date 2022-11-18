//import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';

import 'Screens/screens.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized(); //Add this

  // await FaceCamera.intialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
