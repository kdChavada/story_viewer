import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whatsapp_lite/UI/welcome_ui.dart';
import 'package:whatsapp_lite/helper/constant.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Welcome(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                height: h * 0.4,
                width: w,
                child: Lottie.asset(
                  'assets/images/96176-whatsapp.json',
                ),
              ),
            ),
          ),
          const Text("From"),
          const Text("9 Brainz"),
          const SizedBox(
            height: 08,
          ),
        ],
      ),
    );
  }
}
