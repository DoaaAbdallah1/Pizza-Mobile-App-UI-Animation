import 'package:flutter/material.dart';

abstract class AppEffects {
  static const BoxShadow tabbar = BoxShadow(offset: Offset(0, -4), blurRadius: 12,color:Color.fromRGBO(0, 0, 0, 0.07), spreadRadius: 0);
  static const BoxShadow navbar = BoxShadow(offset: Offset(0, 4), blurRadius: 12,color:Color.fromRGBO(0, 0, 0, 0.07) , spreadRadius: 0);
  static const BoxShadow tile = BoxShadow(offset: Offset(0, 2), blurRadius: 8,color:Color.fromRGBO(0, 0, 0, 0.15) , spreadRadius: 0);
}