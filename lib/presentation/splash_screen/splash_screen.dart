import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/home_screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 3, milliseconds: 750), () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      });
    });
    return Scaffold(
      backgroundColor: kblack,
      // body: Center(
      //   child: SizedBox(
      //       height: 350,
      //       width: 350,
      //       child: Image.asset(
      //         'assets/images/splash.gif',
      //         fit: BoxFit.cover,
      //       )),
      // ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/images/splashadmin.gif',
            fit: BoxFit.cover,
          )),
    );
  }
}
