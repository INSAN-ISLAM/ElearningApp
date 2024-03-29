import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Screen/Assain_Sub.dart';
import 'Screen/ChatApp_Screen.dart';
import 'Screen/Home_Page.dart';
import 'Screen/Splash.dart';

import 'Screen/PayMentSystem.dart';
import 'Screen/practice.dart';
import 'Screen/updateProfilePage.dart';
import 'Screen/profile_Page.dart';

void main()  {

      runApp( MyApp());

}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
     debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}