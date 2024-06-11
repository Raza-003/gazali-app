import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gazali/global.dart';
import 'package:flutter/material.dart';
// import 'package:nexgeno/global.dart';

import 'check_internet.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => swithScreenReplacement(context, const InternetConnection()));
 SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xffc07d77), // Transparent status bar
      statusBarBrightness: Brightness.dark, // Dark text for status bar
      systemNavigationBarColor: Color(0xffc07d77),
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Image.asset(
            "assets/images/logo2.png",
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
