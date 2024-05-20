import 'package:admin_web_panel/dashboard/side_navigation_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC_hjxkJCV9M7YmsucOI5pvv7uupPxb4Hw",
          authDomain: "taxiapp-d42d3.firebaseapp.com",
          databaseURL: "https://taxiapp-d42d3-default-rtdb.firebaseio.com",
          projectId: "taxiapp-d42d3",
          storageBucket: "taxiapp-d42d3.appspot.com",
          messagingSenderId: "624182944337",
          appId: "1:624182944337:web:dac37247af5ac463db0e70",
          measurementId: "G-RTTT0904G1"
      )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SideNavigationDrawer(),
    );
  }
}


