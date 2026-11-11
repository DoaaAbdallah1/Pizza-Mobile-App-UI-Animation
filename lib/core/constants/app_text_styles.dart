import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    // -2 letterSpacing
    letterSpacing: -0.02,
    height: 32/32,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    // -2 letterSpacing
    letterSpacing: -0.02,
    height: 24/24,
  );
  static const TextStyle h3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    // -2 letterSpacing
    letterSpacing: 0,
    height: 18/16,
  );

  static const TextStyle body = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    // -2 letterSpacing
    letterSpacing: 0,
  );
  static const TextStyle message = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    // -2 letterSpacing
    letterSpacing: 0,
    height: 32/21,
  );

  static const TextStyle minimal = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    // -2 letterSpacing
    letterSpacing: 0,
    height: 12/10,
  );
}
