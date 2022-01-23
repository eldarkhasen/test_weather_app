import 'package:flutter/material.dart';

abstract class Navigable  extends Widget{
  String getName();

  bool isInitialRoute() {
    return false;
  }
}