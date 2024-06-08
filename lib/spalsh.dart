import 'dart:async';

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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Image.asset(
            "assets/images/logo1.jpeg",
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
