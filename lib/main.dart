import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wallpaperapp/adminPage.dart';
import 'package:wallpaperapp/bottomnavigation.dart';
import 'package:wallpaperapp/category.dart';
import 'package:wallpaperapp/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp();
  
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AdminPage(), // Set the initial page to AdminPage
      ),
    );
  }
}
