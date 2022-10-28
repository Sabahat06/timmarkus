import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timmarkus/controller%20/bottom_bar_controller.dart';
import 'package:timmarkus/screens/splash_screen.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState()  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomController = Get.put(BottomBarController());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Timmarkus',
          theme: ThemeData(
            backgroundColor: Colors.white,
            colorScheme: ThemeData().colorScheme.copyWith(primary: const Color(0xff246BFD)),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



