import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gazali/global.dart';

import 'check_internet.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => swithScreenReplacement(context, const InternetConnection()));

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/splash.jpg",
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
