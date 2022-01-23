import 'package:flutter/material.dart';
import 'package:test_app_weather/constants/routes.dart';
import 'package:test_app_weather/helpers/navigable.dart';

class MainScreen extends StatefulWidget implements Navigable{
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();

  @override
  String getName() {
    return Routes.main;
  }

  @override
  bool isInitialRoute() {
    return false;
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Main Screen")),
      ),
    );
  }
}
