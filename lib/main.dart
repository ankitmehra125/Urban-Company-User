import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:usc_project/AUTH/splash_page.dart';
import 'package:usc_project/AUTH/welcome_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:usc_project/DashBoard/Beauty/beauty_page.dart';
import 'package:usc_project/DashBoard/BottomNav.dart';
import 'package:usc_project/DashBoard/uscPlus/uscPlus_page.dart';

final authentication = GetStorage();

void main()
{
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context)
  //     {
  //       return const MyApp();
  //     },
  //   )
  // );
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
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage()
    );
  }
}






