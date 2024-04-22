import 'dart:async';

import 'package:automarvelsystem/Presentation/Commonscreens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your desired duration
    Timer(Duration(seconds: 3), () {
      Get.off(LoginScreen());
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) =>LoginScreen(), 
      //   ),
      // );
    });

    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
     
            FlutterLogo(
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Auto marvel system',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}