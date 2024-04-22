import 'package:automarvelsystem/Presentation/Commonscreens/Splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Auto marvel system',
      theme: ThemeData(fontFamily: 'Poppins',
        colorScheme: ThemeData().colorScheme.copyWith(),
        useMaterial3: true,
      ),debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


