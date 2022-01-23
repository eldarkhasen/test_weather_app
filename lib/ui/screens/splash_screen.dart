import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app_weather/constants/routes.dart';
import 'package:test_app_weather/constants/styles.dart';
import 'package:test_app_weather/helpers/navigable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test_app_weather/helpers/shared_preferences.dart';

class SplashScreen extends StatefulWidget implements Navigable {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();

  @override
  String getName() {
    return Routes.initialSplash;
  }

  @override
  bool isInitialRoute() {
    return true;
  }
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(microseconds: 50), () {
      setState(() {
        _opacity = 1;
      });
    });
    Future.delayed(Duration(seconds: 2), () async {
      String page = Routes.main;
      Navigator.pushReplacementNamed(context, page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.k_brand_primary_color,
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _opacity,
            child: Text(
              "welcome".tr(),
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Styles.k_white_color),
            ),
          ),
        ),
      ),
    );
  }
}
